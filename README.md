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
