CC = g++

INCLUDES = utils.h
SRCS = main.cc
OBJS = $(SRCS:.cc=.o)
ASMS = $(SRCS:.cc=.s)
LIBS = -L/scratch/seth.k/tools/papi/lib -lm -lrt -lpthread -lpapi -lpfm

VALUE_TYPE = double
NUM_RUN = 1000
CFLAGS = -march=native -mtune=native -O3 -Wno-unused-result -std=c++11

DEBUG ?= 0
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG 
  LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  INCLUDES += -I/scratch/seth.k/tools/papi/include
endif

spmv:
	$(CC) $(CFLAGS) -mavx2 main.cc -o spmv -D VALUE_TYPE=$(VALUE_TYPE) -D NUM_RUN=$(NUM_RUN)

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) -D VALUE_TYPE=$(VALUE_TYPE) -D NUM_RUN=$(NUM_RUN) -o $@ -c $<

%.s: %.cc
	$(CC) $(CFLAGS) -S $(INCLUDES) $< 


test:
	./spmv ../data/test.mtx

cscope :
		find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
		cscope -b -q -k
ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

clean:
	-rm -f spmv *.o *.s
