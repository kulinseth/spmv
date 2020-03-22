#!/bin/sh
set -e
set -o pipefail
set -o xtrace
if [ -f "results.txt" ]; then
   rm "results.txt"
fi
#if [ "$#" -ne 1 ]; then
   #echo "You must enter exactly 2 command line arguments"
   #echo $#
   #exit 0
#fi
make clean
make float
make features
make dense
for d in /scratch/seth.k/spmv/data/data/3/*/ ; do
   #echo "$d"
   NAME=$(basename "$d")
   echo $NAME
   printf $NAME >> results.txt
   printf "\n\n\nSparse\n" >> results.txt
   ./run_features /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx >> results.txt
   printf "\n" >> results.txt
   ./run_float /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "csr" >> results.txt
   printf "\n" >> results.txt
   #./run_float /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "dia" >> results.txt
   #printf "\n" >> results.txt
   #./run_float /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "ell" >> results.txt
   #printf "\n" >> results.txt
   ./run_float /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "coo" >> results.txt
   printf "\n\n\nDense\n" >> results.txt
   ./run_dense /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "csr" >> results.txt
   printf "\n" >> results.txt
   ./run_dense /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "dia" >> results.txt
   printf "\n" >> results.txt
   ./run_dense /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "ell" >> results.txt
   printf "\n" >> results.txt
   ./run_dense /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx "coo" >> results.txt
   printf "\n\n\n\n" >> results.txt
done
