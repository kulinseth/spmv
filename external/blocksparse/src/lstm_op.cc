
#include "tensorflow/core/framework/op.h"
#include "tensorflow/core/framework/op_kernel.h"
#include "tensorflow/core/framework/shape_inference.h"
#include "tensorflow/core/framework/types.h"
#include "tensorflow/core/lib/core/status.h"
#include "tensorflow/core/platform/stream_executor.h"
#include "tensorflow/stream_executor/cuda/cuda_stream.h"
#include "gpu_types.h"

using namespace tensorflow;

using shape_inference::DimensionHandle;
using shape_inference::InferenceContext;
using shape_inference::ShapeHandle;
using perftools::gputools::cuda::CUDAStream;

template <typename T, typename V> bool LSTM_Gates_Forward(CUstream stream, T* c_next, T* h_next, const T* c_prev, const T* h_prev, const float* bias, float forget_bias, int N, int K);
template <typename T, typename V> bool LSTM4_Gates_Forward(CUstream stream, T* c_next, T* h_next, const T* c, const T* i, const T* f, const T* o, const T* u, float forget_bias, int N, int K);
template <typename B, typename F, typename VB, typename VF> bool LSTM_Gates_Backward(CUstream stream, B* dc, B* dh, const B* ec, const B* eh, const F* c_prev, const F* h_prev, const float* bias, int N, int K, float forget_bias);
template <typename B, typename A, typename VB, typename VA> bool LSTM4_Gates_Backward(CUstream stream, B* dc, B* di, B* df, B* doo, B* du, const B* ec, const B* eh, const A* c, const A* i, const A* f, const A* o, const A* u, int N, int K, float forget_bias);
template <typename T, typename V> bool Split4_Forward (CUstream stream, T* z0, T* z1, T* z2, T* z3, const T* x, int N, int K);
template <typename T, typename V> bool Concat4_Forward(CUstream stream, T* dx, const T* z0, const T* z1, const T* z2, const T* z3, int N, int K);
template <typename T, typename V> bool SparseReluForward(CUstream stream, T* y, const T* x, float alpha, uint K, uint N);


Status UnchangedShape(shape_inference::InferenceContext* ctx);


REGISTER_OP("LSTMGates")
    .Input("c_prev: T")
    .Input("h_prev: T")
    .Input("bias: nbias * float")
    .Output("c_next: T")
    .Output("h_next: T")
    .Attr("T: {half, float, bfloat16}")
    .Attr("forget_bias: float = 1.0")
    .Attr("nbias: int >= 0")
    .SetShapeFn([](InferenceContext* ctx) {
      ctx->set_output(0, ctx->input(0));
      ctx->set_output(1, ctx->input(0));
      return Status::OK();
    })
    .Doc(R"doc(
  i, u, f, o = split(z, 4, 1)
  i = sigmoid(i)
  u = tanh(u)
  f = sigmoid(f + forget_bias)
  o = sigmoid(o)
  c = add(multiply(f, c), multiply(i, u))
  h = multiply(o, tanh(c))
)doc");

template <typename T, typename V1, typename V4>
class LSTMGatesOp : public OpKernel {
 public:
  explicit LSTMGatesOp(OpKernelConstruction* ctx) : OpKernel(ctx) {
    OP_REQUIRES_OK(ctx, ctx->GetAttr("forget_bias", &forget_bias_));
  }
  void Compute(OpKernelContext* ctx) override
  {
    const Tensor& c_prev = ctx->input(0);
    const Tensor& h_prev = ctx->input(1);

    int N = h_prev.dim_size(0);
    int K = h_prev.dim_size(1);

    OpInputList bias;
    ctx->input_list("bias", &bias);
    const float* Bias = bias.size() > 0 ? bias[0].flat<float>().data() : NULL;

    Tensor* c_next = nullptr;
    Tensor* h_next = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, c_prev.shape(), &c_next));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(1, c_prev.shape(), &h_next));

          V1* c_next_ptr = (      V1*)c_next->flat<T>().data();
          V1* h_next_ptr = (      V1*)h_next->flat<T>().data();
    const V1* c_prev_ptr = (const V1*)c_prev.flat<T>().data();
    const V1* h_prev_ptr = (const V1*)h_prev.flat<T>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    LSTM_Gates_Forward<V1,V4>(stream, c_next_ptr, h_next_ptr, c_prev_ptr, h_prev_ptr, Bias, forget_bias_, N,  K);
  }
  float forget_bias_;
};
REGISTER_KERNEL_BUILDER(Name("LSTMGates").Device(DEVICE_GPU).TypeConstraint<float>("T"),LSTMGatesOp<float,float,float4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates").Device(DEVICE_GPU).TypeConstraint<EHALF>("T"),LSTMGatesOp<EHALF,ehalf,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates").Device(DEVICE_GPU).TypeConstraint<BHALF>("T"),LSTMGatesOp<BHALF,bhalf,bhalf4>);


REGISTER_OP("LSTMGates4")
    .Input("c: T")
    .Input("i: T")
    .Input("u: T")
    .Input("f: T")
    .Input("o: T")
    .Output("c_next: T")
    .Output("h_next: T")
    .Attr("T: {half, float, bfloat16}")
    .Attr("forget_bias: float = 1.0")
    .SetShapeFn([](InferenceContext* ctx) {
      ctx->set_output(0, ctx->input(0));
      ctx->set_output(1, ctx->input(0));
      return Status::OK();
    })
    .Doc(R"doc(
  i = sigmoid(i)
  u = tanh(u)
  f = sigmoid(f + forget_bias)
  o = sigmoid(o)
  c = add(multiply(f, c), multiply(i, u))
  h = multiply(o, tanh(c))
)doc");

template <typename T, typename V1, typename V4 >
class LSTMGates4Op : public OpKernel {
 public:
  explicit LSTMGates4Op(OpKernelConstruction* ctx) : OpKernel(ctx) {
    OP_REQUIRES_OK(ctx, ctx->GetAttr("forget_bias", &forget_bias_));
  }
  void Compute(OpKernelContext* ctx) override {

    const Tensor& c = ctx->input(0);
    const Tensor& i = ctx->input(1);
    const Tensor& u = ctx->input(2);
    const Tensor& f = ctx->input(3);
    const Tensor& o = ctx->input(4);

    int N = c.dim_size(0);
    int K = c.dim_size(1);

    Tensor* c_next = nullptr;
    Tensor* h_next = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, c.shape(), &c_next));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(1, c.shape(), &h_next));

    V1* c_next_ptr = (V1*)c_next->flat<T>().data();
    V1* h_next_ptr = (V1*)h_next->flat<T>().data();
    const V1* c_ptr = (const V1*)c.flat<T>().data();
    const V1* i_ptr = (const V1*)i.flat<T>().data();
    const V1* f_ptr = (const V1*)f.flat<T>().data();
    const V1* o_ptr = (const V1*)o.flat<T>().data();
    const V1* u_ptr = (const V1*)u.flat<T>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    LSTM4_Gates_Forward<V1,V4>(stream, c_next_ptr, h_next_ptr, c_ptr, i_ptr, f_ptr, o_ptr, u_ptr, forget_bias_, N,  K);
  }
  float forget_bias_;
};
REGISTER_KERNEL_BUILDER(Name("LSTMGates4").Device(DEVICE_GPU).TypeConstraint<float>("T"),LSTMGates4Op<float,float,float4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates4").Device(DEVICE_GPU).TypeConstraint<EHALF>("T"),LSTMGates4Op<EHALF,ehalf,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates4").Device(DEVICE_GPU).TypeConstraint<BHALF>("T"),LSTMGates4Op<BHALF,bhalf,bhalf4>);

REGISTER_OP("LSTMGatesGrad")
    .Input("c_prev: F")
    .Input("h_prev: F")
    .Input("bias: nbias * float")
    .Input("grads: ngrads * B")
    .Output("dc: B")
    .Output("dh: B")
    .Attr("B: {half, float, bfloat16}")
    .Attr("F: {half, float, bfloat16}")
    .Attr("forget_bias: float = 1.0")
    .Attr("nbias: int >= 0")
    .Attr("ngrads: int >= 1")
    .SetShapeFn([](InferenceContext* ctx) {
      ctx->set_output(0, ctx->input(0));
      ctx->set_output(1, ctx->input(1));
      return Status::OK();
    })
    .Doc(R"doc(
  di = ec * tan_u * sig_grad(sig_i)
  df = ec * c * sig_grad(sig_f)
  do = eh * c_act * sig_grad(sig_o)
  du = ec * sig_i * tanh_grad(tan_u)
  dc = (ec  +  eh * sig_o * tanh_grad(c_act)) * sig_f
  dh = concat([di,df,do,du], 1)
)doc");

template <typename B, typename F, typename VB1, typename VF1, typename VB4, typename VF4>
class LSTMGatesGradOp : public OpKernel {
 public:
  explicit LSTMGatesGradOp(OpKernelConstruction* ctx) : OpKernel(ctx) {
    OP_REQUIRES_OK(ctx, ctx->GetAttr("forget_bias", &forget_bias_));
  }
  void Compute(OpKernelContext* ctx) override
  {
    const Tensor& c_prev = ctx->input(0);
    const Tensor& h_prev = ctx->input(1);
    OpInputList bias, grads;
    ctx->input_list("bias",  &bias);
    ctx->input_list("grads", &grads);

    int N = h_prev.dim_size(0);
    int K = h_prev.dim_size(1);

    Tensor* dc = nullptr;
    Tensor* dh = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, c_prev.shape(), &dc));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(1, h_prev.shape(), &dh));

    VB1* dc_ptr = (VB1*)dc->flat<B>().data();
    VB1* dh_ptr = (VB1*)dh->flat<B>().data();
    const VF1* c_prev_ptr = (const VF1*)c_prev.flat<F>().data();
    const VF1* h_prev_ptr = (const VF1*)h_prev.flat<F>().data();
    const VB1*     eh_ptr = (const VB1*)grads[0].flat<B>().data();
    const VB1*     ec_ptr = grads.size() > 1 ? (const VB1*)grads[1].flat<B>().data() : nullptr;
    const float* bias_ptr = bias.size()  > 0 ? bias[0].flat<float>().data() : nullptr;

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    LSTM_Gates_Backward<VB1,VF1,VB4,VF4>(stream, dc_ptr, dh_ptr, ec_ptr, eh_ptr, c_prev_ptr, h_prev_ptr, bias_ptr, N, K, forget_bias_);
  }
  float forget_bias_;
};
REGISTER_KERNEL_BUILDER(Name("LSTMGatesGrad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<float>("F"),LSTMGatesGradOp<float,float,float,float,float4,float4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGatesGrad").Device(DEVICE_GPU).TypeConstraint<EHALF>("B").TypeConstraint<EHALF>("F"),LSTMGatesGradOp<EHALF,EHALF,ehalf,ehalf,ehalf4,ehalf4>);
//REGISTER_KERNEL_BUILDER(Name("LSTMGatesGrad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<EHALF>("F"),LSTMGatesGradOp<float,EHALF,float,ehalf,float4,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGatesGrad").Device(DEVICE_GPU).TypeConstraint<BHALF>("B").TypeConstraint<BHALF>("F"),LSTMGatesGradOp<BHALF,BHALF,bhalf,bhalf,bhalf4,bhalf4>);
//REGISTER_KERNEL_BUILDER(Name("LSTMGatesGrad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<BHALF>("F"),LSTMGatesGradOp<float,BHALF,float,bhalf,float4,bhalf4>);


REGISTER_OP("LSTMGates4Grad")
    .Input("c: F")
    .Input("i: F")
    .Input("u: F")
    .Input("f: F")
    .Input("o: F")
    .Input("grads: ngrads * B")
    .Output("dc: B")
    .Output("di: B")
    .Output("du: B")
    .Output("df: B")
    .Output("do: B")
    .Attr("B: {half, float, bfloat16}")
    .Attr("F: {half, float, bfloat16}")
    .Attr("forget_bias: float = 1.0")
    .Attr("ngrads: int >= 1")
    .SetShapeFn([](InferenceContext* ctx) {
      ctx->set_output(0, ctx->input(0));
      ctx->set_output(1, ctx->input(0));
      ctx->set_output(2, ctx->input(0));
      ctx->set_output(3, ctx->input(0));
      ctx->set_output(4, ctx->input(0));
      return Status::OK();
    })
    .Doc(R"doc(
  di = ec * tan_u * sig_grad(sig_i)
  df = ec * c * sig_grad(sig_f)
  do = eh * c_act * sig_grad(sig_o)
  du = ec * sig_i * tanh_grad(tan_u)
  dc = (ec  +  eh * sig_o * tanh_grad(c_act)) * sig_f
)doc");

template <typename B, typename F, typename VB1, typename VF1, typename VB4, typename VF4>
class LSTMGates4GradOp : public OpKernel {
 public:
  explicit LSTMGates4GradOp(OpKernelConstruction* ctx) : OpKernel(ctx) {
    OP_REQUIRES_OK(ctx, ctx->GetAttr("forget_bias", &forget_bias_));
  }
  void Compute(OpKernelContext* ctx) override {

    const Tensor& c  = ctx->input(0);
    const Tensor& i  = ctx->input(1);
    const Tensor& u  = ctx->input(2);
    const Tensor& f  = ctx->input(3);
    const Tensor& o  = ctx->input(4);
    const Tensor& eh = ctx->input(5);

    int N = c.dim_size(0);
    int K = c.dim_size(1);

    Tensor* dc  = nullptr;
    Tensor* di  = nullptr;
    Tensor* df  = nullptr;
    Tensor* doo = nullptr;
    Tensor* du  = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, c.shape(), &dc));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(1, c.shape(), &di));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(2, c.shape(), &du));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(3, c.shape(), &df));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(4, c.shape(), &doo));

    VB1* dc_ptr = (VB1*)dc->flat<B>().data();
    VB1* di_ptr = (VB1*)di->flat<B>().data();
    VB1* df_ptr = (VB1*)df->flat<B>().data();
    VB1* do_ptr = (VB1*)doo->flat<B>().data();
    VB1* du_ptr = (VB1*)du->flat<B>().data();
    const VF1*  c_ptr = (const VF1*)c.flat<F>().data();
    const VF1*  i_ptr = (const VF1*)i.flat<F>().data();
    const VF1*  f_ptr = (const VF1*)f.flat<F>().data();
    const VF1*  o_ptr = (const VF1*)o.flat<F>().data();
    const VF1*  u_ptr = (const VF1*)u.flat<F>().data();
    const VB1* eh_ptr = (const VB1*)eh.flat<B>().data();
    const VB1* ec_ptr = nullptr;
    if (ctx->num_inputs() == 7)
      ec_ptr = (const VB1*)ctx->input(6).flat<B>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    LSTM4_Gates_Backward<VB1,VF1,VB4,VF4>(stream, dc_ptr, di_ptr, df_ptr, do_ptr, du_ptr, ec_ptr, eh_ptr, c_ptr, i_ptr, f_ptr, o_ptr, u_ptr, N, K, forget_bias_);
  }
  float forget_bias_;
};
REGISTER_KERNEL_BUILDER(Name("LSTMGates4Grad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<float>("F"),LSTMGates4GradOp<float,float,float,float,float4,float4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates4Grad").Device(DEVICE_GPU).TypeConstraint<EHALF>("B").TypeConstraint<EHALF>("F"),LSTMGates4GradOp<EHALF,EHALF,ehalf,ehalf,ehalf4,ehalf4>);
//REGISTER_KERNEL_BUILDER(Name("LSTMGates4Grad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<EHALF>("F"),LSTMGates4GradOp<float,EHALF,float,ehalf,float4,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("LSTMGates4Grad").Device(DEVICE_GPU).TypeConstraint<BHALF>("B").TypeConstraint<BHALF>("F"),LSTMGates4GradOp<BHALF,BHALF,bhalf,bhalf,bhalf4,bhalf4>);
//REGISTER_KERNEL_BUILDER(Name("LSTMGates4Grad").Device(DEVICE_GPU).TypeConstraint<float>("B").TypeConstraint<BHALF>("F"),LSTMGates4GradOp<float,BHALF,float,bhalf,float4,bhalf4>);



REGISTER_OP("Split4")
    .Input("x: T")
    .Output("z0: T")
    .Output("z1: T")
    .Output("z2: T")
    .Output("z3: T")
    .Attr("T: {half, float, bfloat16}")
    .SetShapeFn([](InferenceContext* ctx) {
      ShapeHandle x = ctx->input(0);
      DimensionHandle N = ctx->Dim(x,0);
      DimensionHandle K;
      TF_RETURN_IF_ERROR(ctx->Divide( ctx->Dim(x,1), 4, true, &K));
      ShapeHandle z = ctx->MakeShape({ N, K });
      ctx->set_output(0, z);
      ctx->set_output(1, z);
      ctx->set_output(2, z);
      ctx->set_output(3, z);
      return Status::OK();
    })
    .Doc(R"doc(
split 4 for lstm type nets
)doc");

template <typename T, typename V1, typename V4>
class Split4Op : public OpKernel {
 public:
  explicit Split4Op(OpKernelConstruction* ctx) : OpKernel(ctx) {}
  void Compute(OpKernelContext* ctx) override {

    const Tensor& x = ctx->input(0);

    int N = x.dim_size(0);
    int K = x.dim_size(1);

    TensorShape z_shape({N, K >> 2});

    Tensor* z0 = nullptr;
    Tensor* z1 = nullptr;
    Tensor* z2 = nullptr;
    Tensor* z3 = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, z_shape, &z0));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(1, z_shape, &z1));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(2, z_shape, &z2));
    OP_REQUIRES_OK(ctx, ctx->allocate_output(3, z_shape, &z3));

    V1* z0_ptr = (V1*)z0->flat<T>().data();
    V1* z1_ptr = (V1*)z1->flat<T>().data();
    V1* z2_ptr = (V1*)z2->flat<T>().data();
    V1* z3_ptr = (V1*)z3->flat<T>().data();
    const V1* x_ptr = (const V1*)x.flat<T>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    Split4_Forward<V1,V4>(stream, z0_ptr, z1_ptr, z2_ptr, z3_ptr, x_ptr, N,  K);
  }
};
REGISTER_KERNEL_BUILDER(Name("Split4").Device(DEVICE_GPU).TypeConstraint<float>("T"),Split4Op<float,float,float4>);
REGISTER_KERNEL_BUILDER(Name("Split4").Device(DEVICE_GPU).TypeConstraint<EHALF>("T"),Split4Op<EHALF,ehalf,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("Split4").Device(DEVICE_GPU).TypeConstraint<BHALF>("T"),Split4Op<BHALF,bhalf,bhalf4>);


REGISTER_OP("Concat4")
    .Input("dz0: T")
    .Input("dz1: T")
    .Input("dz2: T")
    .Input("dz3: T")
    .Output("dx: T")
    .Attr("T: {half, float, bfloat16}")
    .SetShapeFn([](InferenceContext* ctx) {
      ShapeHandle dz = ctx->input(0);
      DimensionHandle N = ctx->Dim(dz,0);
      DimensionHandle K;
      TF_RETURN_IF_ERROR(ctx->Multiply( ctx->Dim(dz,1), 4, &K));
      ShapeHandle dx = ctx->MakeShape({ N, K });
      ctx->set_output(0, dx);
      return Status::OK();
    })
    .Doc(R"doc(
split 4 grad for lstm type nets
)doc");

template <typename T, typename V1, typename V4>
class Concat4Op : public OpKernel {
 public:
  explicit Concat4Op(OpKernelConstruction* ctx) : OpKernel(ctx) {}
  void Compute(OpKernelContext* ctx) override {

    const Tensor& dz0 = ctx->input(0);
    const Tensor& dz1 = ctx->input(1);
    const Tensor& dz2 = ctx->input(2);
    const Tensor& dz3 = ctx->input(3);

    int N = dz0.dim_size(0);
    int K = dz0.dim_size(1) << 2;

    Tensor* dx = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, TensorShape({N, K}), &dx));

    V1* dx_ptr = (V1*)dx->flat<T>().data();
    const V1* dz0_ptr = (const V1*)dz0.flat<T>().data();
    const V1* dz1_ptr = (const V1*)dz1.flat<T>().data();
    const V1* dz2_ptr = (const V1*)dz2.flat<T>().data();
    const V1* dz3_ptr = (const V1*)dz3.flat<T>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    Concat4_Forward<V1,V4>(stream, dx_ptr, dz0_ptr, dz1_ptr, dz2_ptr, dz3_ptr, N, K);
  }
};
REGISTER_KERNEL_BUILDER(Name("Concat4").Device(DEVICE_GPU).TypeConstraint<float>("T"),Concat4Op<float,float,float4>);
REGISTER_KERNEL_BUILDER(Name("Concat4").Device(DEVICE_GPU).TypeConstraint<EHALF>("T"),Concat4Op<EHALF,ehalf,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("Concat4").Device(DEVICE_GPU).TypeConstraint<BHALF>("T"),Concat4Op<BHALF,bhalf,bhalf4>);


REGISTER_OP("SparseRelu")
    .Input("x: T")
    .Input("alpha: float")
    .Output("z: T")
    .Attr("T: {half, float, bfloat16}")
    .SetShapeFn(UnchangedShape)
    .Doc(R"doc(
sparse relu computed from mean/std
)doc");

template <typename T, typename V1, typename V4>
class SparseReluOp : public OpKernel {
 public:
  explicit SparseReluOp(OpKernelConstruction* ctx) : OpKernel(ctx) {}
  void Compute(OpKernelContext* ctx) override {

    const Tensor&     x = ctx->input(0);
    const Tensor& alpha = ctx->input(1);

    uint rank = x.dims();
    uint K    = x.dim_size(--rank);
    uint N    = 1;
    while (rank > 0) N *= x.dim_size(--rank);

    Tensor* z = nullptr;
    OP_REQUIRES_OK(ctx, ctx->allocate_output(0, x.shape(), &z));

          V1* z_ptr = (V1*)z->flat<T>().data();
    const V1* x_ptr = (const V1*)x.flat<T>().data();

    CUstream stream = ((CUDAStream*)ctx->op_device_context()->stream()->implementation())->cuda_stream();

    SparseReluForward<V1,V4>(stream, z_ptr, x_ptr, alpha.scalar<float>()(), K, N);
  }
};
REGISTER_KERNEL_BUILDER(Name("SparseRelu").Device(DEVICE_GPU).TypeConstraint<float>("T").HostMemory("alpha"),SparseReluOp<float,float,float4>);
REGISTER_KERNEL_BUILDER(Name("SparseRelu").Device(DEVICE_GPU).TypeConstraint<EHALF>("T").HostMemory("alpha"),SparseReluOp<EHALF,ehalf,ehalf4>);
REGISTER_KERNEL_BUILDER(Name("SparseRelu").Device(DEVICE_GPU).TypeConstraint<BHALF>("T").HostMemory("alpha"),SparseReluOp<BHALF,bhalf,bhalf4>);


