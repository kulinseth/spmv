TARGET=./build

.PHONY: all compile clean
all: compile

compile: spade/spade_ops.so
	python setup.py bdist_wheel --universal

clean:
	rm -vfr $(TARGET)

CUDA_HOME?=/usr/local/cuda
NV_INC?=$(CUDA_HOME)/include
NV_LIB?=$(CUDA_HOME)/lib64

CCFLAGS=-std=c++11 -O3 -fPIC -D_GLIBCXX_USE_CXX11_ABI=$(TF_ABI) \
	-I$(TARGET) \
	-I$(NV_INC) \
	-I$(TF_INC)/tensorflow/include \
	-I$(TF_INC)/tensorflow/include/external/nsync/public \
	-I$(TF_INC)/external/local_config_cuda/cuda \
	-I/usr/local

	# -I$(NCCL_INC) \
	# -I$(MPI_INC) \

NVCCFLAGS=-D_GLIBCXX_USE_CXX11_ABI=$(TF_ABI) -O3 -Xcompiler -fPIC -std=c++11 --prec-div=false --prec-sqrt=false \
 	-gencode=arch=compute_35,code=sm_35 \
	-gencode=arch=compute_50,code=sm_50 \
	-gencode=arch=compute_52,code=sm_52 \
 	-gencode=arch=compute_60,code=sm_60 \
	-gencode=arch=compute_61,code=sm_61 \
 	-gencode=arch=compute_70,code=sm_70 \
 	-gencode=arch=compute_70,code=compute_70
#   --keep --keep-dir tmp

OBJS=\
	$(TARGET)/conv_op.o \
	$(TARGET)/kernels.o \
	$(TARGET)/matmul_op.o \
	$(TARGET)/spmv.o

CU_OBJS=\
	$(TARGET)/batch_norm_op_gpu.cu.o \
	$(TARGET)/blocksparse_l2_norm_op_gpu.cu.o \
	$(TARGET)/blocksparse_matmul_op_gpu.cu.o \
	$(TARGET)/blocksparse_hgemm_cn_64_op_gpu.cu.o \
	$(TARGET)/blocksparse_hgemm_cn_128_op_gpu.cu.o \
	$(TARGET)/blocksparse_hgemm_nc_op_gpu.cu.o \
	$(TARGET)/bst_hgemm_op_gpu.cu.o \
	$(TARGET)/bst_sgemm_op_gpu.cu.o \
	$(TARGET)/bst_softmax_op_gpu.cu.o \
	$(TARGET)/cwise_linear_op_gpu.cu.o \
	$(TARGET)/edge_bias_op_gpu.cu.o \
	$(TARGET)/ew_op_gpu.cu.o \
	$(TARGET)/layer_norm_cn_op_gpu.cu.o \
	$(TARGET)/layer_norm_nc_op_gpu.cu.o \
	$(TARGET)/lstm_op_gpu.cu.o \
	$(TARGET)/optimize_op_gpu.cu.o \
	$(TARGET)/quantize_op_gpu.cu.o \
	$(TARGET)/transformer_op_gpu.cu.o \
	$(TARGET)/embedding_op_gpu.cu.o \
	$(TARGET)/matmul_op_gpu.cu.o

spade/spade_ops.so: $(OBJS) $(CU_OBJS)
	g++ $^ -shared -o $@ -L$(TF_LIB) -L$(NV_LIB) -ltensorflow_framework -lcudart -lcuda

	# -L$(NCCL_LIB) -L$(MPI_LIB)
	# -lnccl -lmpi

$(TARGET)/%.cu.o: src/%.cu $(TARGET)/blocksparse_kernels.h
	mkdir -p $(shell dirname $@)
	nvcc $(NVCCFLAGS) -c $< -o $@

$(TARGET)/%.o: src/%.cc src/*.h $(TARGET)/blocksparse_kernels.h
	mkdir -p $(shell dirname $@)
	g++ $(CCFLAGS) -c $< -o $@

# NCCL_HOME?=/usr/local/nccl
# NCCL_INC?=$(NCCL_HOME)/include
# NCCL_LIB?=$(NCCL_HOME)/lib
#
# MPI_HOME?=/usr/lib/mpich
# MPI_INC?=$(MPI_HOME)/include
# MPI_LIB?=$(MPI_HOME)/lib

#TF_INC=$(shell python -c 'from os.path import dirname; import tensorflow as tf; print(dirname(dirname(tf.sysconfig.get_include())))')
#TF_LIB=$(shell python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
#TF_ABI=$(shell python -c 'import tensorflow as tf; print(tf.__cxx11_abi_flag__ if "__cxx11_abi_flag__" in tf.__dict__ else 0)')


# bazel-0.17.1-installer-linux-x86_64.sh (--user)
# NVIDIA-Linux-x86_64-396.37.run
# cuda_9.2.148_396.37_linux
# cudnn-9.2-linux-x64-v7.2.1.38.tgz
# nccl_2.2.13-1+cuda9.2_x86_64.txz

# apt-get install mpich

# uncomment:
# https://github.com/tensorflow/tensorflow/blob/r1.10/tensorflow/core/kernels/batch_matmul_op_real.cc#L35


SHELL := '/bin/bash'
CC = gcc

INCLUDES = -I./include
SRCDIR := $(shell pwd)/src
SRCS = $(SRCDIR)/main.cc $(SRCDIR)/spmv.cc $(SRCDIR)/utils.cc $(SRCDIR)/mmio.cc
OBJS = $(SRCS:.cc=.o)

#FEATURES_SRCS = features.c mmio.c utils.c
#FEATURES_OBJS = $(FEATURES_SRCS:.c=.o)

LIBS = -L/scratch/seth.k/tools/papi/lib -lm -lrt -lpthread -lpapi -lpfm

CFLAGS = -m64 -O3 -march=native -mtune=native -Wno-unused-result -std=c++11 -g
EMCCFLAGS = -m64 -s -O3 USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=6 -s WASM=1 -s TOTAL_MEMORY=1GB -s  ALLOW_MEMORY_GROWTH=1 --no-heap-copy -s WASM_MEM_MAX=1GB -s NO_EXIT_RUNTIME=0 --preload-file $(FILE)

DEBUG ?= 1
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG 
  LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  INCLUDES += -I/scratch/seth.k/tools/papi/include
endif

ELLR ?= 0
ifeq ($(ELLR), 1)
  CFLAGS += -DELLR 
endif

OUT=out
#features: $(FEATURES_OBJS)
	#$(CC) $(CFLAGS) $(INCLUDES) -o $(OUT)_$@ $(FEATURES_OBJS) $(LIBS)
	#rm -f *.o

dense: CFLAGS += -DDENSE
dense: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OUT)_$@ $(OBJS) $(LIBS)
	rm -f *.o

out: $(OBJS) $(ASMS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LIBS)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $< 

%.s: %.cc
	$(CC) $(CFLAGS) -S $(INCLUDES) $< 

cscope :
		find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
		cscope -b -q -k
ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
