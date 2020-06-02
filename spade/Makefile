CC=g++
OBJDIR := obj
DEPDIR := $(OBJDIR)/.deps

DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
INCLUDES = utils.h
SRCS := main.cpp
OBJS := $(SRCS:.cpp=.o)
DEPS := $(OBJS:.o=.d)

VALUE_TYPE ?= double
NUM_RUN ?= 1000
CFLAGS = -march=native -mtune=native -Wno-unused-result -std=c++11 -DVALUE_TYPE=$(VALUE_TYPE) -DNUM_RUN=$(NUM_RUN)
DEBUG ?= 0
ifeq ($(DEBUG), 1)
  CFLAGS += -DDEBUG -ggdb
  #LIBS += -L/scratch/seth.k/tools/papi/lib -lpapi -lpfm
  #INCLUDES += -I/scratch/seth.k/tools/papi/include
endif

COMPILE.c = $(CC) $(DEPFLAGS) $(INCLUDES) $(CFLAGS) -c

%.o: %.cpp
	g++ -I$(INCLUDES) $(CFLAGS) -o $@ -c $<

spmv: $(OBJS)
	g++ $(CFLAGS) -o $@ $^

test:
	./spmv ../data/test.mtx

cscope :
	find  .  -name "*.[cphm]" -print -o -name "*.cc" -print > cscope.files
	cscope -b -q -k

ctags:
	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

LIBS := -L/scratch/seth.k/tools/papi/lib -lm -lrt -lpthread -lpapi -lpfm

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


