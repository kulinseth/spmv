#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=2
#SBATCH --mem=32Gb
#SBATCH --cpus-per-task=4
#SBATCH --job-name=spmv-spade
#SBATCH --constraint="E5-2680v4@2.40GHz"
#SBATCH -o slurm.%N.%j.spmv-csr5.out #STDOUT
#SBATCH -e slurm.%N.%j.spmv-csr5.err #STDERR

module load intel/2020.1.217
module load cuda/10.0
module unload gcc/8.1.0
pushd  /home/seth.k/src/research/spmv/spade
make clean
MKL=1 CC=icc make

#while IFS="" read -r p || [ -n "$p" ]
#do
     #printf '%s\n' "$p"
#done < peptides.txt

./spmv ../results/spade_spmv.exp spade_icc.csv
#make test
popd
# For AVX512
# --constraint="Platinum8276CPU@2.20GHz"

# For AVX2
#SBATCH --constraint="Platinum8276CPU@2.20GHz"
