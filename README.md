*SPADE: SPArse DEep learning framework*

This repository contains framework for efficient computation of sparse tensors
in deep learning networks.

Running SPADE:

CC=icc make

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

Testing :

`spade/spmv ../data/test.mtx`
`spade/spmv`  <= this tests the test.csv file which has a small sparse matrix

For installing the perf install linux-tools:
then you would have to change some kernel files to allow the symbols to be run.
There were issues running the perf as root , so try running perf without sudo
and it should work fine.

`vim /proc/sys/kernel/perf_event_paranoid` make this -1
`sudo sh -c " echo 0 > /proc/sys/kernel/kptr_restrict"`
## External Frameworks

Following are the kernels which were benchmarked with:

1. CSR5 kernels these include the AVX2, AVX512, CUDA
2. OSKI and pOSKI library
3. CUDA and CuSPARSE libraries
4. MKL intel libraries
5. TACO both CPU and GPU
6. Custom library

For CPU the comparison will be done with:
1. Intel MKL and Inspector-Executor
2. TACO CPU generated code
3. pOSKI and OSKI libraries
4. Custom

For GPU the comparison will be done with:
1. CUDA
2. CuSPARSE
3. CUSP
4. Custom
5. TACO GPU kernel
