#!/bin/sh
set -e
set -o pipefail
set -o xtrace
if [ -f "results.txt" ]; then
   rm "results.txt"
fi
make clean
make run
NUM_WORKERS=${1:-16}
for d in /scratch/seth.k/spmv/data/data/*/ ; do
   #echo "$d"
   NAME=$(basename "$d")
   echo $NAME
   printf $NAME >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 1 $NUM_WORKERS >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 2 $NUM_WORKERS >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 3 $NUM_WORKERS >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 4 $NUM_WORKERS >> results.txt
   printf "\n\n" >> results.txt
done
