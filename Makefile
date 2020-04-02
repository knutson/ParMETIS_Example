#BUILD_FLAGS= --debug

#INSTDM = 755
#INSTFM = 644

#GCC  = mpicc
#GCXX = mpicxx

MPICC = mpicc
COPTS = -Wall -fPIC -O0 -g
COPTS = -fPIC

#COPTS += -fsanitize=address
#LOPTS += -fsanitize=address

#INC_HDF5 = $(HDF5_HOME)/include
#LIB_HDF5 = $(HDF5_HOME)/lib

#METIS_HOME = /project/knuts661/opt/parmetis/4.0.3/OpenMPI/3.1.4/GCC/7.4.1 

METIS_INCLUDE = -I$(METIS_HOME)/include
METIS_LIB = -L$(METIS_HOME)/lib

.NOTPARALLEL:

#OBJS = main.o
#OBJS += hdf5_util.o
#OBJS += sort_util.o

#TARGETS = $(OBJS)
#TARGETS += a.out

#all: $(TARGETS)

all: demo

main.o: main.cpp
	$(GCXX) $(COPTS) -I. -I$(INC_HDF5) -c sort_util.cpp -o sort_util.o
	$(GCXX) $(COPTS) -I. -I$(INC_HDF5) -c hdf5_util.cpp -o hdf5_util.o
	$(GCXX) $(COPTS) -I. -I$(INC_HDF5) -I$(INC_METIS) -c main.cpp -o main.o

a.out: $(OBJS)
	$(GCXX) $(LOPTS) -o a.out $(OBJS) -L$(LIB_HDF5) -lhdf5 -lz -L$(LIB_METIS) -lparmetis -lmetis

demo:
	$(MPICC) $(COPTS) $(METIS_INCLUDE) -c main.c -o main.o
	$(MPICC) $(LOPTS) -o a.out main.o $(METIS_LIB) -lparmetis -lmetis

clean:
	rm -f *.o *.so *.a a.out *.mod

distclean: clean

.PHONY: all install clean distclean
