#ifndef __MATADD_H
#define __MATADD_H

void matadd(int m, int n, double **A, double **B, double **C);

void matmultvec(int m, int n, double **A, double *b, double *c);
void matmult(int m, int n, int k, double **A, double **B, double **C);
#endif
