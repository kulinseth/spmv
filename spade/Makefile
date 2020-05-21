CC = g++

#INCLUDES = -I./include
SRCS = main.cc mmio.cc
OBJS = $(SRCS:.cc=.o)

LIBS = -L/scratch/seth.k/tools/papi/lib -lm -lrt -lpthread -lpapi -lpfm

CFLAGS = -m64 -march=native -mtune=native -O3 -Wno-unused-result -std=c++11
EMCCFLAGS = -m64 -O3 -s USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=6 -s WASM=1 -s TOTAL_MEMORY=1GB -s  ALLOW_MEMORY_GROWTH=1 --no-heap-copy -s WASM_MEM_MAX=1GB -s NO_EXIT_RUNTIME=0 --preload-file $(FILE)

VALUE_TYPE = double
NUM_RUN = 1000
avx2:
	$(CC) -march=native -mtune=native -std=c++11 -O3 -Wno-unused-result main.cc -o ./spmv -D VALUE_TYPE=$(VALUE_TYPE) -D NUM_RUN=$(NUM_RUN)

DEBUG ?= 0
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG 
  LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  INCLUDES += -I/scratch/seth.k/tools/papi/include
endif

ELLR ?= 0
ifeq ($(ELLR), 1)
  CFLAGS += -DELLR 
endif

cscope :
		find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
		cscope -b -q -k
ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

run: $(OBJS) $(ASMS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LIBS)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $< 

%.s: %.cc
	$(CC) $(CFLAGS) -S $(INCLUDES) $< 

clean:
	-rm -f run *.o *.s
