#include <stdio.h>


__global__ void printgpu{
  printf("Hello world! I’m thread %d out of 64 in block %d. My global thread id is %d out of 256.\n", blockIdx.x, blockDim.x, blockIdx.x*blockDim.x)
  return 0;
}


int main()
{
  printgpu<<<4,64>>>;
}