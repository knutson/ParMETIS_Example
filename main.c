
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include "mpi.h"

#include "parmetis.h"

int main( int argc, char *argv[] ) {

   // TEST: EXAMPLE FROM MANUAL
   // m = number of edges (m = 22, 2m = 44)
   // n = number of vertices (n = 15, n+1 = 16)

   idx_t *vtxdist;
   idx_t *iadj;
   idx_t *jadj;

   idx_t ncon;

   int irank, nproc;

   MPI_Init(&argc, &argv);

   /* Find out process rank */
   MPI_Comm_rank(MPI_COMM_WORLD, &irank);

   /* Find out number of processes */
   MPI_Comm_size(MPI_COMM_WORLD, &nproc);

   // TEST
   printf("irank: %d\n",irank);

   // example from ParMETIS manual (page 12)
   // hard-coded for 3 processor example
   if(nproc!=3) {
      if(irank==0) {
         printf(" --- ERROR: Run with 3 processors\n");
      }
      MPI_Finalize();
      return(0);
   }

   if(irank==0) {

   }
   else if(irank==1) {

   }
   else { // irank = 2

   }


//   ier = parmetis_v3_partkway(vtxdist,iadj,jadj,iwgt,jwgt,
//                              wgtflag,numflag,ncon,nparts,tpwgts,ubvec,
//                              options,edgecut,part,up%iwcom);

   MPI_Finalize();


/*
   idx_t nvtxs = 15;
   idx_t ncon = 1;
   idx_t iadj[16] = {0, 2, 5, 8, 11, 13, 16, 20, 24, 28,
                     31, 33, 36, 39, 42, 44};
   idx_t jadj[44] = {1, 5, 0, 2, 6, 1, 3, 7, 2, 4,
                     8, 3, 9, 0, 6, 10, 1, 5, 7, 11,
                     2, 6, 8, 12, 3, 7, 9, 13, 4, 8,
                     14, 5, 11, 6, 10, 12, 7, 11, 13, 8,
                     12, 14, 9, 13};
*/

    return(0);
}

