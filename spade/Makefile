CC?=g++
OBJDIR := obj
DEPDIR := $(OBJDIR)/.deps
MKLROOT ?= /opt/intel/mkl
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
INCLUDES = utils.h
SRCS := main.cpp
OBJS := $(SRCS:.cpp=.o)
DEPS := $(OBJS:.o=.d)

VALUE_TYPE ?= double
NUM_RUN ?= 10000
MKL ?= 1
CFLAGS = -march=native -O3 -mtune=native -Wno-unused-result -std=c++11 \
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

COMPILE.c = $(CC) $(DEPFLAGS) $(INCLUDES) $(CFLAGS) -c

%.o: %.cpp
	$(CC) -I$(INCLUDES) $(CFLAGS) -o $@ -c $<

spmv: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

test:
	./spmv ../results/test.exp tmp.csv

cscope :
	find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
	cscope -b -q -k

ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

.PHONY:clean
clean:
	rm -f spmv *.o

.PHONY: cleandep
cleandep:
	rm -f $(dep)

#$(DEPDIR): ; @mkdir -p $@
#DEPFILES := $(SRCS:%.cc=$(DEPDIR)/%.d)
#$(DEPFILES):
#include $(wildcard $(DEPFILES))


