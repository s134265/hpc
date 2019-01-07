#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <cblas.h>
#include "datatools.h"		/* helper functions	        */
#include "matadd.h"		/* my matrix add fucntion	*/

#define NREPEAT 100		/* repeat count for the experiment loop */

#define mytimer clock
#define delta_t(a,b) (1e3 * (b - a) / CLOCKS_PER_SEC)

int
main(int argc, char *argv[]) {

    int    i,j,l, m=3, n=2, k=5, N = NREPEAT;
    double **A, **B, **C, **D;
    //double *b,*c;
    double tcpu1,tcpu2; 

    clock_t t1, t2, t3, t4;

    //for (m = 200; m <= 3500; m += 300) {
	//n = m + 25;

	/* Allocate memory */
	A = malloc_2d(m, k);
	B = malloc_2d(k, n);
	C = malloc_2d(m, n);
	D = malloc_2d(m, n);
	//b = malloc(n * sizeof(double));
	//c = malloc(n * sizeof(double));
	if (A == NULL || B == NULL | C == NULL ){ //| b == NULL | c == NULL) {
	    fprintf(stderr, "Memory allocation error...\n");
	    exit(EXIT_FAILURE);
	}
	
	//init_1d(n,b);
	/* initialize with useful data - last argument is reference */
	//init_data(m,n,A,B);
	init_data_mult(m,n,k,A,B);
	/* timings for matadd */
	t1 = mytimer();
	
	//for (i = 0; i < N; i++)
	matmult(m,n,k,A,B,C);
	    //matadd(m, n, A, B, C);
		//matmultvec(m,n,A,b,c);
	t2 = mytimer();
	t3 = mytimer();

	cblas_dgemm(CblasRowMajor,CblasNoTrans,CblasNoTrans,m,n,k,1,A,k,B,n,0,D,n);
	t4 = mytimer();
	tcpu1 = delta_t(t1, t2);
	tcpu2 = delta_t(t3, t4);
	//for (l = 0; l<m; l++)
		//for (j=0; j<n; j++)
			//printf("%8.3f\n", C[l][j]);

	//check_results("main", m, n, C);

	/* Print n and results  */
	printf("%8.3f %8.3f\n", tcpu1, tcpu2);

	/* Free memory */
	free_2d(A);
	free_2d(B);
	free_2d(C);
	//free(b);
	//free(c);
    //}

    return EXIT_SUCCESS;
}
