SHELL := '/bin/bash'
CC = gcc

INCLUDES = -I./include
SRCDIR := $(shell pwd)/src
SRCS = $(SRCDIR)/main.cc $(SRCDIR)/spmv.cc $(SRCDIR)/utils.cc $(SRCDIR)/mmio.cc
OBJS = $(SRCS:.cc=.o)

#FEATURES_SRCS = features.c mmio.c utils.c
#FEATURES_OBJS = $(FEATURES_SRCS:.c=.o)

LIBS = -L/scratch/seth.k/tools/papi/lib -lm -lrt -lpthread -lpapi -lpfm

CFLAGS = -m64 -O3 -march=native -mtune=native -Wno-unused-result -std=c++11 -g
EMCCFLAGS = -m64 -s -O3 USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=6 -s WASM=1 -s TOTAL_MEMORY=1GB -s  ALLOW_MEMORY_GROWTH=1 --no-heap-copy -s WASM_MEM_MAX=1GB -s NO_EXIT_RUNTIME=0 --preload-file $(FILE)

DEBUG ?= 1
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG 
  LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  INCLUDES += -I/scratch/seth.k/tools/papi/include
endif

ELLR ?= 0
ifeq ($(ELLR), 1)
  CFLAGS += -DELLR 
endif

OUT=out
#features: $(FEATURES_OBJS)
	#$(CC) $(CFLAGS) $(INCLUDES) -o $(OUT)_$@ $(FEATURES_OBJS) $(LIBS)
	#rm -f *.o

dense: CFLAGS += -DDENSE
dense: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OUT)_$@ $(OBJS) $(LIBS)
	rm -f *.o

out: $(OBJS) $(ASMS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS) $(LIBS)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $< 

%.s: %.cc
	$(CC) $(CFLAGS) -S $(INCLUDES) $< 

cscope :
		find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
		cscope -b -q -k
ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
clean:
	-rm -f run $(SRCDIR)/*.o $(SRCDIR)/*.s
