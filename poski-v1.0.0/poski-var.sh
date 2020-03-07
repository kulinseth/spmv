#!/bin/bash

export OSKIDIR=NONE/build_oski
export OSKIBUILD=/scratch/seth.k/spmv/poski-v1.0.0/build_oski
export POSKIDIR=/usr/local
export LD_LIBRARY_PATH=/usr/local:NONE/build_oski:/usr/local/cuda-10.0/lib64{LD_LIBRARY_PATH:+:/usr/local/cuda-10.0/lib64{LD_LIBRARY_PATH:+:}}
export POSKISRC=.
export POSKICC=gcc
export POSKICFLAGS="-INONE/build_oski/include -g -O2 -std=gnu99 -pthread -fopenmp -msse3 "

