void
matadd(int m, int n, double **A, double **B, double **C) {
    
    int i, j;

    for(i = 0; i < m; i++)
	for(j = 0; j < n; j++)
	    C[i][j] = A[i][j] + B[i][j];
}
void
matmultvec(int m, int n, double **A, double *b, double *c){

	 int i, j;

    for(i = 0; i < m; i++)
	for(j = 0; j < n; j++)
	    c[j] += A[i][j] * b[j];
}
void
matmult(int m, int n, int k, double **A, double **B, double **C){

	int i, j, l;
	
	for(i = 0; i < m; i++)
	for(j = 0; j < n; j++)
	for(l = 0; l < k; l++)
		C[i][j] += A[i][l]*B[l][j];
}