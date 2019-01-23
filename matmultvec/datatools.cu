#include "datatools.h"

void 
init(int m, int n, double *A) {

   int i, j;

   for( i = 0; i < m; i++)
       for( j = 0; j < n; j++) {
	    A[i*n+j] = 2.0*(i*n+j);	    
       }

}


void
init_1d (int n, int m, double *b, double *c){
	int i, j;
	for(i=0; i<n; i++){
		b[i] = 1.0*i;
                
	}
        for(j=0; j<m; j++){
		c[j] = 0.0;
                
	}

}

