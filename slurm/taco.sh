#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --job-name=spmv
#SBATCH --constraint="Platinum8276CPU@2.20GHz"
#SBATCH -o slurm.%N.%j.out #STDOUT
#SBATCH -e slurm.%N.%j.err #STDERR

module load cuda/10.0
module load gcc/8.1.0
export CC=`which gcc`
export CXX=`which g++`


