#!/bin/sh
set -e
set -o pipefail
set -o xtrace
if [ -f "results.txt" ]; then
   rm "results.txt"
fi
if [ -f "features.txt" ]; then
   rm "features.txt"
fi
pushd $PWD/src/sequential
#if [ "$#" -ne 1 ]; then
   #echo "You must enter exactly 2 command line arguments"
   #echo $#
   #exit 0
#fi
make clean
make float
make features
make dense
for d in ./data/data/*/ ; do
   NAME=$(basename "$d")
   echo $NAME
   printf $NAME >> features.txt
   $PWD/src/sequential/run_features ./data/data/$NAME/$NAME.mtx >> features.txt
   printf "\n" >> features.txt
done

printf "Phase\tBenchmark\tMode\tFeature\tValue" >> results.txt
for d in ../../data/data/*/ ; do
   echo "$d"
   NAME=$(basename "$d")
   echo $NAME
   ./run_float ../../data/data/$NAME/$NAME.mtx "csr" >> results.txt
   ./run_float ../../data/data/$NAME/$NAME.mtx "coo" >> results.txt
   ./run_float ../../data/data/$NAME/$NAME.mtx "dia" >> results.txt
   ./run_float ../../data/data/$NAME/$NAME.mtx "ell" >> results.txt
   ./run_dense ../../data/data/$NAME/$NAME.mtx "csr" >> results.txt
   ./run_dense ../../data/data/$NAME/$NAME.mtx "dia" >> results.txt
   ./run_dense ../../data/data/$NAME/$NAME.mtx "ell" >> results.txt
   ./run_dense ../../data/data/$NAME/$NAME.mtx "coo" >> results.txt
done
popd
