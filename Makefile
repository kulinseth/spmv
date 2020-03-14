CCFLAGS = -Wall -fopenmp -O3

all: sequential

sequential:
		gcc $(CCFLAGS) src/spmv_seq.c src/mmio.c src/utils.c src/utils.h -o spmv_seq

parallelS:
		gcc $(CCFLAGS) src/spmv_N_thread_static.c src/mmio.c src/utils.c -o pstatic

parallelD:
		gcc $(CCFLAGS) src/spmv_N_thread_dynamic.c src/mmio.c src/utils.c -o pdynamic

clean:
		rm -f -r spmv_seq pstatic pdynamic pnewalg
