CCFLAGS = -Wall -fopenmp

all: sequential

sequential:
		gcc $(CCFLAGS) src/spmv_seq.c src/mmio.c src/utils.c src/utils.h -o spmv_seq

parallelS:
		gcc $(CCFLAGS) spmv_N_thread_static.c mmio.c utils.c -o pstatic

#parallelD: spmv_N_thread_dynamic.c mmio.c mmio.h utils.c utils.h
		#gcc $(CCFLAGS) spmv_N_thread_dynamic.c mmio.c utils.c -o pdynamic

clean:
		rm -f -r spmv_seq pstatic pdynamic pnewalg
