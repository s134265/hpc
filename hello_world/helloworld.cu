#include <stdio.h>


__global__ void printgpu(){
  printf("Hello world! I’m thread %d out of 64 in block %d. My global thread id is %d out of 256.\n", threadIdx.x, blockIdx.x, blockIdx.x*blockDim.x+threadIdx.x);
}


int main()
{
  printgpu<<<4,64>>>();
}