#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --job-name=spmv-features
#SBATCH --partition short
#SBATCH --time=23:00:00
#SBATCH --mem=64Gb
#SBATCH -o slurm.%N.%j.spmv-features.out #STDOUT
#SBATCH -e slurm.%N.%j.spmv-features.err #STDERR

pushd  /home/seth.k/src/research/spmv/
python scripts/run_scipy.py
popd
