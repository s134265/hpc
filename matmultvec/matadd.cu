__global__ void
matmultvec(int m, double *A, double *b, double *c){

    int i, j;
    i = threadIdx.x+blockIdx.x*blockDim.x;
    for (j=0; j<m; j++){
       c[i] += A[i+j] * b[j];
    }
}
