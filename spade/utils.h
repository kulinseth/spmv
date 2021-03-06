#ifndef UTILS_H
#define UTILS_H

#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <math.h>
#include <pthread.h>
#include <unistd.h>
#include <sched.h>
#include <math.h>
#include <libgen.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <cmath>
#include <sys/time.h>
#include <dirent.h>
#include <fstream>
#include <string>
#include "immintrin.h"

#define ANONYMOUSLIB_CSR5_OMEGA   4
#define ANONYMOUSLIB_CSR5_SIGMA   16
#define ANONYMOUSLIB_X86_CACHELINE   64

extern std::ofstream outf;

#define ANONYMOUSLIB_SUCCESS                   0
#define ANONYMOUSLIB_UNKOWN_FORMAT            -1
#define ANONYMOUSLIB_UNSUPPORTED_CSR5_OMEGA   -2
#define ANONYMOUSLIB_CSR_TO_CSR5_FAILED       -3
#define ANONYMOUSLIB_UNSUPPORTED_CSR_SPMV     -4
#define ANONYMOUSLIB_UNSUPPORTED_VALUE_TYPE   -5

#define ANONYMOUSLIB_FORMAT_CSR  0
#define ANONYMOUSLIB_FORMAT_CSR5 1
#define ANONYMOUSLIB_FORMAT_HYB5 2

//template<typename IndexType, typename ValueType>
//using Spmv = int (*)(int m, int n,  ValueType  alpha,
                     //ValueType *  x, ValueType  *y,  IndexType*  csr_row_pointer,
                     //IndexType*  csr_column_index,  ValueType*  csr_val);
long long sum_i(int *arr, int n);
float mean_i(int *arr, int n);
double sum_f(float *arr, int n);
float geo_mean(float *arr, int n);
float mean_f(float *arr, int n);
float sd_i(int *arr, int n, float mean_i);
float vr_i(int *arr, int n, float mean_i);
float vr_f(float *arr, int n, float mean_i);
float sd_f(float *arr, int n, float mean_i);
void my_swap(int* a, int* b);
int partition (int arr[], int low, int high) ;
void my_quickSort(int arr[], int low, int high) ;
int count_nnz(FILE *f);
long long count_diag_elems(int *row, int *col, VALUE_TYPE *val, int nnz, int N, int *nd);
void quickSort(int arr[], int arr2[], VALUE_TYPE arr3[], int left, int right);

void spmv_baseline(int m, int n,  VALUE_TYPE  alpha,
                  VALUE_TYPE *  x, VALUE_TYPE  *y,  int*  csr_row_pointer,
                  int*  csr_column_index,  VALUE_TYPE*  csr_value);
int spmv_avx2(int m, int n,  VALUE_TYPE  alpha,
                VALUE_TYPE * x, VALUE_TYPE  *y,  int*  csr_row_pointer,
                int*  csr_column_index,  VALUE_TYPE*  csr_value);
int compute_avx2(int m, int n, int nnzA,
                   int *  csrRowPtrA,  int *  csrColIdxA,
                   VALUE_TYPE *  csrValA,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha);
int compute_baseline(int m, int n, int nnzA,
                   int *  csrRowPtrA,  int *  csrColIdxA,
                   VALUE_TYPE *  csrValA,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha);
#if MKL
#include <mkl.h>
#include <mkl_spblas.h>
void spmv_mkl(int m, int n,  VALUE_TYPE  alpha,
             VALUE_TYPE *  x, VALUE_TYPE * y, sparse_matrix_t A, matrix_descr desr);
#endif
int compute_mkl(int m, int n, int nnzA,
                   int *  csrRowPtrA,  int *  csrColIdxA,
                   VALUE_TYPE *  csrValA,
                   VALUE_TYPE *  x, VALUE_TYPE * y,
                   VALUE_TYPE *  y_ref, VALUE_TYPE alpha);

struct anonymouslib_timer {
    timeval t1, t2;
    struct timezone tzone;

    void start() {
        gettimeofday(&t1, &tzone);
    }

    double stop() {
        gettimeofday(&t2, &tzone);
        double elapsedTime = 0;
        elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
        elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
        return elapsedTime;
    }
};

#if __AVX2__
inline
void print_val(__m256d val) {
  double tmp[4];
  _mm256_storeu_pd(&tmp[0], val);
  printf("%lf, %lf, %lf, %lf\n", tmp[0], tmp[1], tmp[2], tmp[3]);
}
#endif


template<typename iT>
iT binary_search_right_boundary_kernel(const iT *d_row_pointer,
                                       const iT  key_input,
                                       const iT  size)
{
    iT start = 0;
    iT stop  = size - 1;
    iT median;
    iT key_median;

    while (stop >= start)
    {
        median = (stop + start) / 2;

        key_median = d_row_pointer[median];

        if (key_input >= key_median)
            start = median + 1;
        else
            stop = median - 1;
    }

    return start;
}

// sum up 4 double-precision numbers
inline double hsum_avx(__m256d in256d)
{
    double sum;

    __m256d hsum = _mm256_add_pd(in256d, _mm256_permute2f128_pd(in256d, in256d, 0x1));
    _mm_store_sd(&sum, _mm_hadd_pd( _mm256_castpd256_pd128(hsum), _mm256_castpd256_pd128(hsum) ) );

    return sum;
}

// sum up 8 single-precision numbers
inline float hsum_avx(__m256 in256)
{
    float sum;

    __m256 hsum = _mm256_hadd_ps(in256, in256);
    hsum = _mm256_add_ps(hsum, _mm256_permute2f128_ps(hsum, hsum, 0x1));
    _mm_store_ss(&sum, _mm_hadd_ps( _mm256_castps256_ps128(hsum), _mm256_castps256_ps128(hsum) ) );

    return sum;
}

inline double m256_reduce_sum1(__m256d a) {
  double res;
  a = _mm256_add_pd(a, _mm256_permute2f128_pd(a, a, 0x1));
  _mm_store_sd(&res, _mm_hadd_pd( _mm256_castpd256_pd128(a), _mm256_castpd256_pd128(a)));
  return res;
}

inline double m128_reduce_sum(__m128d a) {
  double res;
  _mm_store_sd(&res, _mm_hadd_pd(a, a));
  return res;
}



// exclusive scan using a single thread
template<typename T>
void scan_single(T            *s_scan,
                 const int     l)
{
    T old_val, new_val;

    old_val = s_scan[0];
    s_scan[0] = 0;
    for (int i = 1; i < l; i++)
    {
        new_val = s_scan[i];
        s_scan[i] = old_val + s_scan[i-1];
        old_val = new_val;
    }
}

// inclusive prefix-sum scan 
inline __m256d hscan_avx(__m256d in256d)
{
    __m256d t0, t1;
    t0 = _mm256_permute4x64_pd(in256d, 0x93);
    t1 = _mm256_add_pd(in256d, _mm256_blend_pd(t0, _mm256_set1_pd(0), 0x1));

    t0 = _mm256_permute4x64_pd(in256d, 0x4E);
    t1 = _mm256_add_pd(t1, _mm256_blend_pd(t0, _mm256_set1_pd(0), 0x3));

    t0 = _mm256_permute4x64_pd(in256d, 0x39);
    t1 = _mm256_add_pd(t1, _mm256_blend_pd(t0, _mm256_set1_pd(0), 0x7));

    return t1;
}

// inclusive prefix-sum scan 
inline __m256 hscan_avx(__m256 in256)
{
    __m256 t0, t1;
    //shift1_AVX + add
    t0 = _mm256_permute_ps(in256, _MM_SHUFFLE(2, 1, 0, 3));
    t1 = _mm256_permute2f128_ps(t0, t0, 41);
    in256 = _mm256_add_ps(in256, _mm256_blend_ps(t0, t1, 0x11));
    //shift2_AVX + add
    t0 = _mm256_permute_ps(in256, _MM_SHUFFLE(1, 0, 3, 2));
    t1 = _mm256_permute2f128_ps(t0, t0, 41);
    in256 = _mm256_add_ps(in256, _mm256_blend_ps(t0, t1, 0x33));
    //shift3_AVX + add
    in256 = _mm256_add_ps(in256, _mm256_permute2f128_ps(in256, in256, 41));
    return in256;
}
template<typename iT, typename vT>
double getB(const iT m, const iT nnz)
{
    return (double)((m + 1 + nnz) * sizeof(iT) + (2 * nnz + m) * sizeof(vT));
}

template<typename iT>
double getFLOP(const iT nnz)
{
    return (double)(2 * nnz);
}

template<typename T>
void print_tile_t(T *input, int m, int n)
{
    for (int i = 0; i < n; i++)
    {
        for (int local_id = 0; local_id < m; local_id++)
        {
            std::cout << input[local_id * n + i] << ", ";
        }
        std::cout << std::endl;
    }
}

template<typename T>
void print_tile(T *input, int m, int n)
{
    for (int i = 0; i < m; i++)
    {
        for (int local_id = 0; local_id < n; local_id++)
        {
            std::cout << input[i * n + local_id] << ", ";
        }
        std::cout << std::endl;
    }
}

template<typename T>
void print_1darray(T *input, int l)
{
    for (int i = 0; i < l; i++)
        std::cout << input[i] << ", ";
    std::cout << std::endl;
}


template<typename iT, typename vT>
inline void partition_fast_track(const vT           *d_value_partition,
                                 const vT           *d_x,
                                 const iT           *d_column_index_partition,
                                 vT                 *d_calibrator,
                                 vT                 *d_y,
                                 const iT            row_start,
                                 const iT            par_id,
                                 const int           tid,
                                 const iT            start_row_start,
                                 const vT            alpha,
                                 const int           sigma,
                                 const int           stride_vT,
                                 const bool          direct)
{
    __m256d sum256d   = _mm256_setzero_pd();
    __m256d value256d, x256d;
    vT x256d0, x256d1, x256d2, x256d3;

    #pragma unroll(ANONYMOUSLIB_CSR5_SIGMA)
    for (int i = 0; i < ANONYMOUSLIB_CSR5_SIGMA; i++)
    {
        value256d = _mm256_load_pd(&d_value_partition[i * ANONYMOUSLIB_CSR5_OMEGA]);

        x256d0 = d_x[d_column_index_partition[i * ANONYMOUSLIB_CSR5_OMEGA]];
        x256d1 = d_x[d_column_index_partition[i * ANONYMOUSLIB_CSR5_OMEGA + 1]];
        x256d2 = d_x[d_column_index_partition[i * ANONYMOUSLIB_CSR5_OMEGA + 2]];
        x256d3 = d_x[d_column_index_partition[i * ANONYMOUSLIB_CSR5_OMEGA + 3]];
        x256d = _mm256_set_pd(x256d3, x256d2, x256d1, x256d0);

        sum256d = _mm256_fmadd_pd(value256d, x256d, sum256d);
    }

    vT sum = hsum_avx(sum256d);

    if (row_start == start_row_start && !direct)
        d_calibrator[tid * stride_vT] += sum;
    else{
        if(direct)
            d_y[row_start] = sum;
        else
            d_y[row_start] += sum;
    }
}

#endif // UTILS_H

