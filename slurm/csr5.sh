#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --job-name=spmv-csr5
#SBATCH --constraint="Platinum8276CPU@2.20GHz"
#SBATCH -o slurm.%N.%j.spmv-csr5.out #STDOUT
#SBATCH -e slurm.%N.%j.spmv-csr5.err #STDERR

module load intel/2020.1.217
module load cuda/10.0

pushd  /home/seth.k/src/research/spmv/external/csr5/
if [[ $1 == "CSR5_cuda" ]]
then
   module unload intel/2020.1.217
   module load gcc/7.2.0
fi
cd $1
rm spmv
make
popd
pushd /home/seth.k/src/research/spmv/
python scripts/run_scipy.py --exp_file="results/spmv.exp" --exp="csr5"
# For AVX512
# --constraint="Platinum8276CPU@2.20GHz"

# For AVX2
# --constraint="E5-2680v4@2.40GHz"
