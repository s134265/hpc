#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <helper_cuda.h>
#include "datatools.h"
#include "matadd.h"



int
main(int argc, char *argv[]) {

    double *h_A,*h_b,*h_c,*d_A,*d_b,*d_c;
    int i, j, m=32, n=5;
    h_A = (double *)malloc(m*n * sizeof(double));
    h_b = (double *)malloc(n * sizeof(double));
    h_c = (double *)malloc(m * sizeof(double));
    cudaMalloc((void **)&d_A,m*n * sizeof(double));
    cudaMalloc((void **)&d_b,n * sizeof(double));
    cudaMalloc((void **)&d_c,m * sizeof(double));
    init_1d(n,m,h_b,h_c);
    init(m,n,h_A);
    cudaMemcpy(d_A, h_A, m*n * sizeof(double),cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, n * sizeof(double),cudaMemcpyHostToDevice);
    cudaMemcpy(d_c, h_c, m * sizeof(double),cudaMemcpyHostToDevice);
    matmultvec<<<m/16,16>>>(m, d_A, d_b, d_c);
    cudaDeviceSynchronize();
    cudaMemcpy(h_c, d_c, m * sizeof(double),cudaMemcpyDeviceToHost);
    for (j=0;j<n;j++){    
         printf("%lf ", h_b[j]);
    }
    for (i=0;i<m;i++){
	printf("%lf ", h_c[i]);
    }
    free(h_A);
    free(h_b);
    free(h_c);
    cudaFree(d_A);
    cudaFree(d_b);
    cudaFree(d_c);
}
