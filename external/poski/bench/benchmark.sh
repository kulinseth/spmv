#! /bin/bash
##
# This file runs "off-line tuning".
##

## Grap bench path.
if [ "$poskipath" != "" ]; then
	benchpath=$poskipath/bench
else
	benchpath=`echo $0 | sed -e "s/benchmark.sh//"`
fi

echo "benchpath = $benchpath"

if [ ! -d "$benchpath" ]; then
	echo "!* Error: can't find $benchpath!"
	exit
else
	cd $benchpath
	benchpath=`pwd`
	cd -
fi

## Grap OSKI path

echo "OSKIBUILD = $OSKIBUILD"
echo "OSKIDIR = $OSKIDIR"
if [ "$OSKIBUILD" != "" ]; then
	cp $benchpath/*.py $OSKIBUILD/.
	cd $OSKIBUILD
else
	echo "!* Error: can't find an existing OSKI!"
	exit
fi

## Run off-line tuning: (1) generate various implementations for each RB, (2) benchmarks all implementations, (3) select the best implementation for each RB.
python Autotuner.py

## Override OSKI library with selected RB codes by off-line tuning.
make uninstall
make 
make benchmarks
make install



