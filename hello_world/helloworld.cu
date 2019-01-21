#include <stdio.h>
#include <helper_cuda.h>

__global__ void printgpu(){
  printf("Hello world! I’m thread %d out of %d in block %d. My global thread id is %d out of %d.\n", threadIdx.x+1, blockDim.x ,blockIdx.x, blockIdx.x*blockDim.x+threadIdx.x+1,gridDim.x*blockDim.x);
}


int main(int argc, char *argv[])
{
  int blockSize = atoi(argv[1]);
  int blocks = atoi(argv[2]);
  printgpu<<<blocks,blockSize>>>();
  cudaDeviceSynchronize();
}