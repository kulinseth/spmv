
#if GOOGLE_CUDA

#include "ew_op_gpu.h"
//#include <stdio.h>

template <typename T, typename V, uint THREADS, uint WIDTH>
__global__ void __launch_bounds__(THREADS) layer_norm_moments1_CN(
          V*              P1,
          V*              P2,
    const T* __restrict__ X,
    uint K, uint N)
{
    // Stripe the reduction lines with tid and block_n
    uint tid      = threadIdx.x;
    uint block_n  = blockIdx.x;
    uint block_k  = blockIdx.y;

    uint warps = THREADS / 32;
    uint lines = THREADS / WIDTH;
    uint line  = tid     / WIDTH;

    uint n = block_n*WIDTH + (tid % WIDTH);
    uint k = block_k * lines + line;

    uint kn = k*N + n;
    bool bn = n < N;

    uint inc_k  = gridDim.y * lines;
    uint inc_kn = inc_k*N;

    V mean1, mean2;
    ew_zero(mean1);
    ew_zero(mean2);
    #pragma unroll 1
    while (k < K)
    {
        V x = load(add_ptr_u(X, kn), 0, bn);

        mean1 = ew_add(mean1, x);
        mean2 = ew_add(mean2, ew_sqr(x));
        kn += inc_kn;
        k  += inc_k;
    }
    __shared__ V sMean1[THREADS];
    __shared__ V sMean2[THREADS];

    sMean1[tid] = mean1;
    sMean2[tid] = mean2;

    __syncthreads();

    if (tid < 32)
    {
        for (uint i = 1; i < warps; i++)
            mean1 = ew_add(mean1, sMean1[tid + i*32]);

        // if the line width is less than a warp, reduce the lines within a warp
        for (int i = 16; i >= WIDTH; i >>= 1)
            mean1 = ew_warp_sum(mean1, i);

        // output a partial sums
        if (tid < WIDTH && bn)
            store(add_ptr_u(P1, block_k*N + n), mean1);
    }
    else if (tid < 64)
    {
        tid -= 32;
        mean2 = ew_add(mean2, sMean2[tid + 0*32]);
        for (uint i = 2; i < warps; i++)
            mean2 = ew_add(mean2, sMean2[tid + i*32]);

        // if the line width is less than a warp, reduce the lines within a warp
        for (int i = 16; i >= WIDTH; i >>= 1)
            mean2 = ew_warp_sum(mean2, i);

        // output a partial sums
        if (tid < WIDTH && bn)
            store(add_ptr_u(P2, block_k*N + n), mean2);
    }
}

// Reduce partial sums
__global__ void __launch_bounds__(256) layer_norm_moments2_CN(
          float*              Mean,
          float*              Rstd,
    const float* __restrict__ P1,
    const float* __restrict__ P2,
    uint nPartials, uint N, float rcpK, float epsilon)
{
    uint tid = threadIdx.x;
    uint bid = blockIdx.x;

    // load in 8 units of n wide to allow efficient transpose in L1 cache
    uint n = bid*8 + tid/32;
    uint k = tid & 31;

    uint kn = k*N + n;
    bool bn = n < N;

    // force compute outside of loop
    asm("mov.b32 %0, %0;" : "+r"(kn) : );

    float mean1 = 0.0f, mean2 = 0.0f;
    // We should generally have #SMs * 2 partials.
    #pragma unroll 1
    while (k < nPartials)
    {
#if __CUDA_ARCH__ >= 700
        const int UNROLL = 5; // 2*80 partials
#else
        const int UNROLL = 4; // 2*56 partials
#endif

        bool bnk[UNROLL];
        bnk[0] = bn;
        for (int i = 1; i < UNROLL; i++)
            bnk[i] = bn && (k+32*i < nPartials);

        for (int i = 0; i < UNROLL; i++)
        {
            mean1 += load(add_ptr_u(P1, kn + N*32*i), 0, bnk[i]);
            mean2 += load(add_ptr_u(P2, kn + N*32*i), 0, bnk[i]);
        }
        kn += 32*UNROLL*N;
        k  += 32*UNROLL;
    }
    for (uint i = 16; i > 0; i >>= 1)
    {
        mean1 += shfl_xor(mean1, i);
        mean2 += shfl_xor(mean2, i);
    }
    if (bn & (tid & 31) == 0)
    {
        // var  = mean(x**2) - mean(x)**2
        // rstd = 1/sqrt(var)
        mean1 *= rcpK;
        mean2 *= rcpK;
        float rstd = rsqrtf(precise_sub(mean2, ew_sqr(mean1)) + epsilon);
        store(add_ptr_u(Mean, n), mean1);
        store(add_ptr_u(Rstd, n), rstd);
    }
}

// xstdr = rcp(sqrt(xvar + epsilon))
// xhat  = xmean * xstdr
// y     = xhat*g + b
template <typename T, int UNROLL>
__global__ void __launch_bounds__(32) layer_norm_CN(
               T*              Y,
    const      T* __restrict__ X,
    const float4* __restrict__ Mean,
    const float4* __restrict__ Rstd,
    const  float* __restrict__ G,
    const  float* __restrict__ B,
    int K, int N, int relu)
{
    __shared__ float Gain[UNROLL*2];
    __shared__ float Bias[UNROLL*2];

    int tid   = threadIdx.x;
    int idx_K = blockIdx.x * UNROLL*2;
    int idx_N = blockIdx.y * 16;

    // load gain/bias for this K-block
    int ki = idx_K + tid;
    if (tid < UNROLL*2 && ki < K)
    {
        Gain[tid] = G[ki];
        Bias[tid] = B[ki];
    }

    int tid16 = tid >> 4;
    int tid15 = tid & 15;

    int k = idx_K + tid16;
    int n = idx_N + tid15;

    bool bn = n < N;

    int xi  = k*N + n;
    int inc = N * 2;

    float4 rstd = load(Rstd, n, bn);
    float4 mean = load(Mean, n, bn);

    #pragma unroll
    for (int j = 0; j < UNROLL; j++)
    {
        bool bnk = bn && k < K;
        float4 x = load(X, xi, bnk);

        float g = Gain[tid16];
        float b = Bias[tid16];

        // xhat = (x - mean) / sqrt(var + epsilon)
        //   y  = g * xhat + b
        float4 xhat = ew_mul(ew_sub(x, mean), rstd);
        float4    y = ew_add(ew_mul(xhat, g), b);

        if (relu)
            y = ew_relu(y);

        store(Y, y, xi, bnk);

        k     += 2;
        tid16 += 2;
        xi    += inc;
    }
}
template <typename T, typename V>
bool LayerNormForward_CN(CUstream stream, int SMs,
              T* y,
          float* mean,
          float* rstd,
          float* p1,
          float* p2,
    const     T* x,
    const float* g,
    const float* b,
    float epsilon, int K, int N, float rcpK, int relu)
{
    const      V*    X = (const V*)x;
    const float4* Mean = (const float4*)mean;
    const float4* Rstd = (const float4*)rstd;
          float4*   P1 = (      float4*)p1;
          float4*   P2 = (      float4*)p2;

    uint gridN64 = (N >> 6) + ((N &  63) != 0);
    uint gridN8  = (N >> 3) + ((N &   7) != 0);
    uint gridK8  = (K >> 3) + ((K &   7) != 0);

    uint nPartials = gridN64 > 1 ? SMs : SMs*2;
    if (K <= 8*nPartials)
        layer_norm_moments1_CN<V,float4,128,16><<<dim3(gridN64, nPartials),128,0,stream>>>(P1, P2, X, K, N>>2);
    else
        layer_norm_moments1_CN<V,float4,256,16><<<dim3(gridN64, nPartials),256,0,stream>>>(P1, P2, X, K, N>>2);

    layer_norm_moments2_CN<<<gridN8,256,0,stream>>>(mean, rstd, p1, p2, nPartials, N, rcpK, epsilon);

    layer_norm_CN<V,4><<<dim3(gridK8, gridN64),32, 0,stream>>>((V*)y, X, Mean, Rstd, g, b, K, N>>2, relu);
    return true; // TODO
}
template bool LayerNormForward_CN<float,float4>(CUstream stream, int SMs, float* y, float* mean, float* rstd, float* p1, float* p2, const float* x, const float* g, const float* b, float epsilon, int K, int N, float rcpK, int relu);
template bool LayerNormForward_CN<ehalf,ehalf4>(CUstream stream, int SMs, ehalf* y, float* mean, float* rstd, float* p1, float* p2, const ehalf* x, const float* g, const float* b, float epsilon, int K, int N, float rcpK, int relu);
template bool LayerNormForward_CN<bhalf,bhalf4>(CUstream stream, int SMs, bhalf* y, float* mean, float* rstd, float* p1, float* p2, const bhalf* x, const float* g, const float* b, float epsilon, int K, int N, float rcpK, int relu);


// dg = sum(dy * xhat(x), axis=1)
// db = sum(dy, axis=1)
template <typename T>
__global__ void __launch_bounds__(128) layer_norm_dg_db_CN(
           float*              DG,
           float*              DB,
    const      T* __restrict__ DY,
    const      T* __restrict__ X,
    const  float* __restrict__ Gain,
    const  float* __restrict__ Bias,
    const float4* __restrict__ Mean,
    const float4* __restrict__ Rstd,
    int K, int N, int relu)
{
    __shared__ float gain[8];
    __shared__ float bias[8];

    int tid   = threadIdx.x;
    int idx_K = blockIdx.x * 8;

    // load gain/bias for this K-block
    int ki = idx_K + tid;
    if (relu && tid < 8 && ki < K)
    {
        gain[tid] = Gain[ki];
        bias[tid] = Bias[ki];
    }
    int tid16 = tid >> 4;
    int tid15 = tid & 15;
    int k     = idx_K + tid16;

    __syncthreads();
    float dg = 0.0f, db = 0.0f;
    if (k < K)
    {
        int N4 = N >> 2;
        int xi = k*N4;
        X  += xi;
        DY += xi;

        float4 dg4, db4;
        ew_zero(dg4);
        ew_zero(db4);
        for (int n = tid15; n < N4; n += 16)
        {
            float4 x    = load(X,    n);
            float4 dy   = load(DY,   n);
            float4 rstd = load(Rstd, n);
            float4 mean = load(Mean, n);

            // xhat = (x - mean) * rstd
            float4 xhat = ew_mul(ew_sub(x, mean), rstd);

            if (relu)
            {
                float g = gain[tid16];
                float b = bias[tid16];
                dy = ew_relu_grad(dy, ew_add(ew_mul(xhat, g), b));
            }

            dg4 = ew_add(ew_mul(dy, xhat), dg4);
            db4 = ew_add(dy, db4);
        }
        dg = ew_sum(dg4);
        db = ew_sum(db4);
    }
    // reduce each half warp
    for (int i = 8; i > 0; i >>= 1)
    {
        dg += shfl_xor(dg, i);
        db += shfl_xor(db, i);
    }
    if (k < K && tid15 == 0)
    {
        DG[k] = dg;
        DB[k] = db;
    }
}

// dy    = dy * g
// sum1  = sum(xhat * dy, axis=0)
// sum2  = sum(dy, axis=0)
template <typename T, uint THREADS, uint WIDTH>
__global__ void __launch_bounds__(THREADS) layer_norm_dx_sum1_CN(
          float4*              P1,
          float4*              P2,
    const      T* __restrict__ DY,
    const      T* __restrict__ X,
    const  float* __restrict__ Gain,
    const  float* __restrict__ Bias,
    const float4* __restrict__ Mean,
    const float4* __restrict__ Rstd,
    int K, int N, int relu)
{
    // Stripe the reduction lines with tid and block_n
    uint tid      = threadIdx.x;
    uint block_n  = blockIdx.x;
    uint block_k  = blockIdx.y;

    uint warps = THREADS / 32;
    uint lines = THREADS / WIDTH;
    uint line  = tid     / WIDTH;

    uint n = block_n*WIDTH + (tid % WIDTH);
    uint k = block_k * lines + line;

    uint kn = k*N + n;
    bool bn = n < N;

    uint inc_k  = gridDim.y * lines;
    uint inc_kn = inc_k*N;

    float4 rstd = load(Rstd, n, bn);
    float4 mean = load(Mean, n, bn);

    float4 sum1, sum2;
    ew_zero(sum1);
    ew_zero(sum2);
    #pragma unroll 1
    while (k < K)
    {
        float4 dy = load(add_ptr_u(DY, kn), 0, bn);
        float4 x  = load(add_ptr_u(X,  kn), 0, bn);

        float gain = load(add_ptr_u(Gain, k), 0, bn);
        float bias = load(add_ptr_u(Bias, k), 0, bn && relu != 0);

        float4 xhat = ew_mul(ew_sub(x, mean), rstd);
        if (relu != 0)
            dy = ew_relu_grad(dy, ew_add(ew_mul(xhat, gain), bias));
        dy = ew_mul(dy, gain);

        sum1 = ew_add(sum1, ew_mul(dy, xhat));
        sum2 = ew_add(sum2, dy);

        kn += inc_kn;
        k  += inc_k;
    }
    __shared__ float4 sSum1[THREADS];
    __shared__ float4 sSum2[THREADS];

    sSum1[tid] = sum1;
    sSum2[tid] = sum2;

    __syncthreads();

    if (tid < 32)
    {
        for (uint i = 1; i < warps; i++)
            sum1 = ew_add(sum1, sSum1[tid + i*32]);

        // if the line width is less than a warp, reduce the lines within a warp
        for (int i = 16; i >= WIDTH; i >>= 1)
            sum1 = ew_warp_sum(sum1, i);

        // output a partial sums
        if (tid < WIDTH && bn)
            store(add_ptr_u(P1, block_k*N + n), sum1);
    }
    else if (tid < 64)
    {
        tid -= 32;
        sum2 = ew_add(sum2, sSum2[tid + 0*32]);
        for (uint i = 2; i < warps; i++)
            sum2 = ew_add(sum2, sSum2[tid + i*32]);

        // if the line width is less than a warp, reduce the lines within a warp
        for (int i = 16; i >= WIDTH; i >>= 1)
            sum2 = ew_warp_sum(sum2, i);

        // output a partial sums
        if (tid < WIDTH && bn)
            store(add_ptr_u(P2, block_k*N + n), sum2);
    }
}
// Reduce partial sums
__global__ void __launch_bounds__(256) layer_norm_dx_sum2_CN(float* Sum1, float* Sum2, uint nPartials, uint N)
{
    uint tid = threadIdx.x;
    uint bid = blockIdx.x;

    // load in 8 units of n wide to allow efficient transpose in L1 cache
    uint n = bid*8 + tid/32;
    uint k = tid & 31;

    float* Sum = Sum1;
    if (n >= N)
    {
        n  -= N;
        Sum = Sum2;
    }
    uint kn = k*N + n;
    bool bn = n < N;

    // force compute outside of loop
    asm("mov.b32 %0, %0;" : "+r"(kn) : );

    float sum = 0.0f;
    // We should generally have #SMs * 2 partials.
    #pragma unroll 1
    while (k < nPartials)
    {
#if __CUDA_ARCH__ >= 700
        const int UNROLL = 5; // 2*80 partials
#else
        const int UNROLL = 4; // 2*56 partials
#endif

        bool bnk[UNROLL];
        bnk[0] = bn;
        for (int i = 1; i < UNROLL; i++)
            bnk[i] = bn && (k+32*i < nPartials);

        for (int i = 0; i < UNROLL; i++)
            sum += load(add_ptr_u((const float*)Sum, kn + N*32*i), 0, bnk[i]);

        kn += 32*UNROLL*N;
        k  += 32*UNROLL;
    }
    for (uint i = 16; i > 0; i >>= 1)
    {
        sum += shfl_xor(sum, i);
    }
    if (bn & (tid & 31) == 0)
        store(add_ptr_u(Sum, n), sum);

}

// dy = dy * g
// dx = (dy - ((xhat * sum1 + sum2) * rcpK)) * xstdr
template <typename T, int UNROLL>
__global__ void __launch_bounds__(32) layer_norm_dx_CN(
               T*              DX,
    const      T* __restrict__ DY,
    const      T* __restrict__ X,
    const  float* __restrict__ Gain,
    const  float* __restrict__ Bias,
    const float4* __restrict__ Mean,
    const float4* __restrict__ Rstd,
    const float4* __restrict__ Sum1,
    const float4* __restrict__ Sum2,
    int K, int N, float rcpK, int relu)
{
    __shared__ float gain[UNROLL*2];
    __shared__ float bias[UNROLL*2];

    int tid   = threadIdx.x;
    int idx_K = blockIdx.x * UNROLL*2;
    int idx_N = blockIdx.y * 16;

    // load gain/bias for this K-block
    int ki = idx_K + tid;
    if (tid < UNROLL*2 && ki < K)
    {
        gain[tid] = Gain[ki];
        bias[tid] = Bias[ki];
    }

    int tid16 = tid >> 4;
    int tid15 = tid & 15;

    int k = idx_K + tid16;
    int n = idx_N + tid15;

    int  N4 = N  >> 2;
    bool bn = n < N4;

    int xi  = k*N4 + n;
    int inc = N4 * 2;

    float4 rstd = load(Rstd, n, bn);
    float4 mean = load(Mean, n, bn);
    float4 sum1 = load(Sum1, n, bn);
    float4 sum2 = load(Sum2, n, bn);

    #pragma unroll 4
    for (int j = 0; j < UNROLL; j++)
    {
        bool bnk = bn && k < K;
        float4  x = load( X, xi, bnk);
        float4 dy = load(DY, xi, bnk);
        float   g = gain[tid16];
        float   b = bias[tid16];

        float4 xhat = ew_mul(ew_sub(x, mean), rstd);
        if (relu)
            dy = ew_relu_grad(dy, ew_add(ew_mul(xhat, g), b));
        dy = ew_mul(dy, g);

        // dx = (dy - ((xhat * sum1 + sum2) * rcpK)) * rstd;
        float4 dx = ew_mul(ew_sub(dy, ew_mul(ew_add(ew_mul(xhat, sum1), sum2), rcpK)), rstd);

        store(DX, dx, xi, bnk);
        k     += 2;
        tid16 += 2;
        xi    += inc;
    }
}

template <typename T, typename V>
bool LayerNormBackward_CN(CUstream stream, int SMs,
              T* dx,
          float* dg,
          float* db,
          float* sum1,
          float* sum2,
    const     T* dy,
    const     T* x,
    const float* g,
    const float* b,
    const float* mean,
    const float* rstd,
    float epsilon, int K, int N, float rcpK, int relu)
{
    uint gridN64 = (N >> 6) + ((N &  63) != 0);
    uint gridN8  = (N >> 3) + ((N &   7) != 0);
    uint gridK8  = (K >> 3) + ((K &   7) != 0);
    uint nPartials = gridN64 > 1 ? SMs : SMs*2;

          V* DX = (      V*)dx;
    const V* DY = (const V*)dy;
    const V*  X = (const V*)x;

    const float4* Mean = (const float4*)mean;
    const float4* Rstd = (const float4*)rstd;
    const float4* Sum1 = (const float4*)sum1;
    const float4* Sum2 = (const float4*)sum2;

    layer_norm_dg_db_CN<V><<<gridK8,128,0,stream>>>(dg, db, DY, X, g, b, Mean, Rstd, K, N, relu);

    if (K <= 8*nPartials)
        layer_norm_dx_sum1_CN<V,128,16><<<dim3(gridN64, nPartials),128,0,stream>>>((float4*)sum1, (float4*)sum2, DY, X, g, b, Mean, Rstd, K, N>>2, relu);
    else
        layer_norm_dx_sum1_CN<V,256,16><<<dim3(gridN64, nPartials),256,0,stream>>>((float4*)sum1, (float4*)sum2, DY, X, g, b, Mean, Rstd, K, N>>2, relu);

    layer_norm_dx_sum2_CN<<<gridN8*2,256,0,stream>>>(sum1, sum2, nPartials, N);

    layer_norm_dx_CN<V,4><<<dim3(gridK8, gridN64),32,0,stream>>>(DX, DY, X, g, b, Mean, Rstd, Sum1, Sum2, K, N, rcpK, relu);

    return true; // TODO
}

template bool LayerNormBackward_CN<float,float4>(CUstream stream, int SMs, float* dx, float* dg, float* db, float* sum1, float* sum2, const float* dy, const float* x, const float* g, const float* b, const float* mean, const float* rstd, float epsilon, int K, int N, float rcpK, int relu);
template bool LayerNormBackward_CN<ehalf,ehalf4>(CUstream stream, int SMs, ehalf* dx, float* dg, float* db, float* sum1, float* sum2, const ehalf* dy, const ehalf* x, const float* g, const float* b, const float* mean, const float* rstd, float epsilon, int K, int N, float rcpK, int relu);
template bool LayerNormBackward_CN<bhalf,bhalf4>(CUstream stream, int SMs, bhalf* dx, float* dg, float* db, float* sum1, float* sum2, const bhalf* dy, const bhalf* x, const float* g, const float* b, const float* mean, const float* rstd, float epsilon, int K, int N, float rcpK, int relu);


// Sparse Projection Code

template <typename T, typename V, int SHFT>
__global__ void __launch_bounds__(128) gather_scatter(
            T*              Z,
    const   T* __restrict__ X,
    const int* __restrict__ Lut,
    int K, int N)
{
    int tid   = threadIdx.x;
    int idx_K = blockIdx.x;
    int idx_N = blockIdx.y;

    int tidK = tid >> SHFT;
    int tidN = tid & ((1<<SHFT)-1);

    int zk = (idx_K << (7-SHFT)) + tidK;
    int  n = (idx_N <<    SHFT)  + tidN;

    if (zk < K && n < N)
    {
        int xk = load(Lut, zk);

        int zi = zk*N + n;
        int xi = xk*N + n;

        V x = load(X, xi, xk >= 0);

        store(Z, x, zi);
    }
}
template <typename T, typename V, int SHFT>
__global__ void __launch_bounds__(128) scatter_add(
            T*              Z, // large tensor
    const   T* __restrict__ X, // large tensor
    const   T* __restrict__ Y, // small tensor
    const int* __restrict__ Lut,
    int K, int N)
{
    int tid   = threadIdx.x;
    int idx_K = blockIdx.x;
    int idx_N = blockIdx.y;

    int tidK = tid >> SHFT;
    int tidN = tid & ((1<<SHFT)-1);

    int yk = (idx_K << (7-SHFT)) + tidK;
    int  n = (idx_N <<    SHFT) +  tidN;

    if (yk < K && n < N)
    {
        int xk = load(Lut, yk);

        int yi = yk*N + n;
        int xi = xk*N + n;

        V y = load(Y, yi);
        V x = load(X, xi);

        store(Z, ew_add(x, y), xi);
    }
}
template <typename T, typename V, int SHFT>
__global__ void __launch_bounds__(128) scatter_mul(
            T*              Z, // large tensor
    const   T* __restrict__ X, // large tensor
    const   T* __restrict__ Y, // small tensor
    const int* __restrict__ Lut,
    int K, int N)
{
    int tid   = threadIdx.x;
    int idx_K = blockIdx.x;
    int idx_N = blockIdx.y;

    int tidK = tid >> SHFT;
    int tidN = tid & ((1<<SHFT)-1);

    int xk = (idx_K << (7-SHFT)) + tidK;
    int  n = (idx_N <<    SHFT) +  tidN;

    if (xk < K && n < N)
    {
        int yk = load(Lut, xk);

        int xi = xk*N + n;
        int yi = yk*N + n;

        V x = load(X, xi);
        V y = load(Y, yi, yk >= 0);
        V z = yk >= 0 ? ew_mul(x, y) : x; // pass through if unmapped

        store(Z, z, xi);
    }
}
template <typename T, typename V, int SHFT>
__global__ void __launch_bounds__(128) sparse_mul_grad(
            T*              DX, // large tensor
            T*              DY, // small tensor
    const   T* __restrict__ DZ, // large tensor (same pointer as DX)
    const   T* __restrict__ X,  // large tensor
    const   T* __restrict__ Y,  // small tensor
    const int* __restrict__ Lut,
    int K, int N)
{
    int tid   = threadIdx.x;
    int idx_K = blockIdx.x;
    int idx_N = blockIdx.y;

    int tidK = tid >> SHFT;
    int tidN = tid & ((1<<SHFT)-1);

    int yk = (idx_K << (7-SHFT)) + tidK;
    int  n = (idx_N <<    SHFT) +  tidN;

    if (yk < K && n < N)
    {
        int xk = load(Lut, yk);

        int yi = yk*N + n;
        int xi = xk*N + n;

        V y  = load(Y,  yi);
        V x  = load(X,  xi);
        V dz = load(DZ, xi);

        store(DX, ew_mul(dz, y), xi);
        store(DY, ew_mul(dz, x), yi);
    }
}

#define OP_GAT 0
#define OP_SCT 1
#define OP_ADD 2
#define OP_MUL 3

template <typename T, typename V4, typename V8>
bool SparseOp(CUstream stream,
            T* z,
    const   T* x,
    const   T* y,
    const int* lut,
    int op, int K, int N)
{
    int gridN = (N >> 6) + ((N & 63) != 0);

    if (sizeof(T) == 2 && (N & 7) == 0)
    {
              V8* Z = (      V8*)z;
        const V8* X = (const V8*)x;
        const V8* Y = (const V8*)y;

        // blockK = 128 / 8 = 16
        int gridK = (K >> 4) + ((K & 15) != 0);
        dim3 grid(gridK, gridN, 1);
        switch(op)
        {
            case OP_GAT: gather_scatter<V8,float8,3><<<grid,128,0,stream>>>(Z, X,    lut, K, N>>3); break;
            case OP_SCT: gather_scatter<V8,float8,3><<<grid,128,0,stream>>>(Z, X,    lut, K, N>>3); break;
            case OP_ADD:    scatter_add<V8,float8,3><<<grid,128,0,stream>>>(Z, X, Y, lut, K, N>>3); break;
            case OP_MUL:    scatter_mul<V8,float8,3><<<grid,128,0,stream>>>(Z, X, Y, lut, K, N>>3); break;
        }
    }
    else if ((N & 3) == 0)
    {
              V4* Z = (      V4*)z;
        const V4* X = (const V4*)x;
        const V4* Y = (const V4*)y;

        // blockK = 128 / 16 = 8
        int gridK = (K >> 3) + ((K & 7) != 0);
        dim3 grid(gridK, gridN, 1);
        switch(op)
        {
            case OP_GAT: gather_scatter<V4,float4,4><<<grid,128,0,stream>>>(Z, X,    lut, K, N>>2); break;
            case OP_SCT: gather_scatter<V4,float4,4><<<grid,128,0,stream>>>(Z, X,    lut, K, N>>2); break;
            case OP_ADD:    scatter_add<V4,float4,4><<<grid,128,0,stream>>>(Z, X, Y, lut, K, N>>2); break;
            case OP_MUL:    scatter_mul<V4,float4,4><<<grid,128,0,stream>>>(Z, X, Y, lut, K, N>>2); break;
        }
    }
    return true; // TODO
}

template <typename T, typename V4, typename V8>
bool SparseMulGrad(CUstream stream,
            T* dx,
            T* dy,
    const   T* dz,
    const   T* x,
    const   T* y,
    const int* lut,
    int K, int N)
{
    int gridN = (N >> 6) + ((N & 63) != 0);

    if (sizeof(T) == 2 && (N & 7) == 0)
    {
              V8* DX = (      V8*)dx;
              V8* DY = (      V8*)dy;
        const V8* DZ = (const V8*)dz;
        const V8*  X = (const V8*)x;
        const V8*  Y = (const V8*)y;

        // blockK = 128 / 8 = 16
        int gridK = (K >> 4) + ((K & 15) != 0);
        dim3 grid(gridK, gridN, 1);

        sparse_mul_grad<V8,float8,3><<<grid,128,0,stream>>>(DX, DY, DZ, X, Y, lut, K, N>>3);
    }
    else if ((N & 3) == 0)
    {
              V4* DX = (      V4*)dx;
              V4* DY = (      V4*)dy;
        const V4* DZ = (const V4*)dz;
        const V4*  X = (const V4*)x;
        const V4*  Y = (const V4*)y;

        // blockK = 128 / 16 = 8
        int gridK = (K >> 3) + ((K & 7) != 0);
        dim3 grid(gridK, gridN, 1);
        sparse_mul_grad<V4,float4,4><<<grid,128,0,stream>>>(DX, DY, DZ, X, Y, lut, K, N>>2);
    }
    return true; // TODO
}

template bool SparseOp<float,float4,float8>(CUstream stream, float* z, const float* x, const float* y, const int* lut, int op, int K, int N);
template bool SparseOp<ehalf,ehalf4,ehalf8>(CUstream stream, ehalf* z, const ehalf* x, const ehalf* y, const int* lut, int op, int K, int N);
template bool SparseOp<bhalf,bhalf4,bhalf8>(CUstream stream, bhalf* z, const bhalf* x, const bhalf* y, const int* lut, int op, int K, int N);

template bool SparseMulGrad<float,float4,float8>(CUstream stream, float* dx, float* dy, const float* dz, const float* x, const float* y, const int* lut, int K, int N);
template bool SparseMulGrad<ehalf,ehalf4,ehalf8>(CUstream stream, ehalf* dx, ehalf* dy, const ehalf* dz, const ehalf* x, const ehalf* y, const int* lut, int K, int N);
template bool SparseMulGrad<bhalf,bhalf4,bhalf8>(CUstream stream, bhalf* dx, bhalf* dy, const bhalf* dz, const bhalf* x, const bhalf* y, const int* lut, int K, int N);

#endif // GOOGLE_CUDA

// cuobjdump -xelf blocksparse_ops.5.sm_60.cubin blocksparse_ops.so
// cuobjdump -xelf blocksparse_ops.6.sm_61.cubin blocksparse_ops.so

// nvdisasm -c -raw blocksparse_ops.5.sm_60.cubin  > blocksparse_ops.5.sm_60.sass
// nvdisasm -c -raw blocksparse_ops.6.sm_61.cubin  > blocksparse_ops.6.sm_61.sass


