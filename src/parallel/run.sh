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
make
for d in /scratch/seth.k/spmv/data/data/*/ ; do
   #echo "$d"
   NAME=$(basename "$d")
   echo $NAME
   printf $NAME >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 1 ${1} >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 2 ${1} >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 3 ${1} >> results.txt
   printf "\n" >> results.txt
   ./run /scratch/seth.k/spmv/data/data/$NAME/$NAME.mtx 4 ${1} >> results.txt
   printf "\n\n" >> results.txt
done
