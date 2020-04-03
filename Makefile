
MPICC = mpicc
COPTS = -g -fPIC -O0 -Wall -Wstrict-aliasing -fstrict-aliasing

#COPTS += -fsanitize=address

#HDF5_INCLUDE = -I$(HDF5_HOME)/include
#HDF5_LIB = -L$(HDF5_HOME)/lib

METIS_INCLUDE = -I$(METIS_HOME)/include
METIS_LIB = -L$(METIS_HOME)/lib

all: demo

demo:
	$(MPICC) $(COPTS) $(METIS_INCLUDE) -c main.c -o main.o
	$(MPICC) $(COPTS) -o a.out main.o $(METIS_LIB) -lparmetis -lmetis

clean:
	rm -f *.o *.so *.a a.out *.mod
