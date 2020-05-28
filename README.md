*SPADE: SPArse DEep learning framework*

This repository contains framework for efficient computation of sparse tensors
in deep learning networks.


Building TACO:

If run into this issue:
`c++ unrecognized -std=c++14` error on the cluster. Do the following:

`
module load gcc/8.1.0
export CC=which gcc
export CXX=which g++
`

Basically make sure CMake uses the right CC compiler.

For emitting code for CPU:
./build/bin/taco "a(i) = B(i,j) * c(j)"

./bin/taco "a(i) = B(i,j) * c(j)" -f=B:ds -i=B:/scratch/seth.k/spmv/data/MM/Baumann/Baumann.mtx -g=c:d -o=a:tmp.mtx -verify -print-concrete -time=2 -write-time=<file>


Running pOSKI autotuner

`python external/poski/bench/CodeGen_MBCSRRowMaj_Matmul.py`
## External Frameworks

Following are the kernels which were benchmarked with:

1. CSR5 kernels these include the AVX2, AVX512, CUDA
2. OSKI and pOSKI library
3. CUDA and CuSPARSE libraries
4. MKL intel libraries
5. TACO both CPU and GPU
6. Custom library

For CPU the comparison will be done with:
1. Intel MKL
2. TACO CPU generated code
3. pOSKI and OSKI libraries
4. Custom

For GPU the comparison will be done with:
1. CUDA
2. CuSPARSE
3. CUSP
4. Custom
5. TACO GPU kernel
