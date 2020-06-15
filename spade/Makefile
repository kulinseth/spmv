CC?=g++
OBJDIR := obj
DEPDIR := $(OBJDIR)/.deps
MKLROOT ?= /opt/intel/mkl
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
INCLUDES = ./
KERNEL_SRCS := kernels/avx2.cpp kernels/baseline.cpp kernels/mkl.cpp
SRCS := main.cpp utils.cpp $(KERNEL_SRCS)
OBJS := $(SRCS:.cpp=.o)
DEPS := $(OBJS:.o=.d)
ASMS = $(KERNEL_SRCS:.cpp=.s)

VALUE_TYPE ?= double
NUM_RUN ?= 10000
MKL ?= 1
PERF ?= 0
CFLAGS = -march=native -O3 -mtune=native -Wno-unused-result -std=c++17 \
				 -DVALUE_TYPE=$(VALUE_TYPE) -DNUM_RUN=$(NUM_RUN) -DMKL=$(MKL)
LIBS = -lm -lpthread 
ifeq ($(CC), icc)
	CFLAGS = -xAVX -qopt-prefetch=3 -fopenmp -std=c++11 -O3 -DVALUE_TYPE=$(VALUE_TYPE) -DNUM_RUN=$(NUM_RUN) -DMKL=1
  LIBS += -lmkl_intel_lp64 -lmkl_core -lmkl_sequential
else
	ifeq ($(MKL), 1)
		LIBS += -L$(MKLROOT)/lib -lmkl_intel_lp64 -lmkl_core -lmkl_sequential -DMKL=1
	endif
endif

DEBUG ?= 0
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG -ggdb
  #LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  #INCLUDES += -I/scratch/seth.k/tools/papi/include
endif
ifeq ($(PERF), 1)
	LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
endif

COMPILE.c = $(CC) $(DEPFLAGS) $(INCLUDES) $(CFLAGS) -c

%.o: %.cpp
	$(CC) -I$(INCLUDES) $(CFLAGS) -o $@ -c $<

%.s: %.cpp
	$(CC) $(CFLAGS) -I$(INCLUDES) -o $@ -S $< 

spmv: $(OBJS) $(ASMS)
	$(CC) -I$(INCLUDES) $(CFLAGS) -o $@ $(OBJS) $(LIBS)

test:
	./spmv ../results/test.exp tmp.csv 

cscope :
	find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
	cscope -b -q -k

ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

.PHONY:clean
clean:
	rm -f spmv *.o kernels/*.o kernels/*.s *.s

.PHONY: cleandep
cleandep:
	rm -f $(dep)

#$(DEPDIR): ; @mkdir -p $@
#DEPFILES := $(SRCS:%.cc=$(DEPDIR)/%.d)
#$(DEPFILES):
#include $(wildcard $(DEPFILES))


