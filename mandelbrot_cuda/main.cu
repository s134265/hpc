#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <helper_cuda.h>
#include "mandel.h"
#include "writepng.h"
#include "mandelgpu.h"


int
main(int argc, char *argv[]) {

    int   width, height;
    int	  max_iter;
    //int   *image, 
    int *h_image, *d_image;

    width    = 2601;
    height   = 2601;
    max_iter = 400;

    dim3 dimGrid(width/16+1,height/16+1,1);
    dim3 dimBlock(16,16,1);
    
    
    /*
    double start = omp_get_wtime();
    image = (int *)malloc( width * height * sizeof(int));
    #pragma omp parallel
    {
    mandel(width, height, image, max_iter);
    }
    free(image);
    writepng("mandelbrot.png", image, width, height);
    double end = omp_get_wtime() - start;
    printf("Wall time cpu: %lf",end);
    */
    
    h_image = (int *)malloc( width * height * sizeof(int));
    cudaMalloc((void**)&d_image,width * height * sizeof(int));
    double start = omp_get_wtime();
    mandelgpu<<<dimGrid,dimBlock>>>(width, height, d_image, max_iter);
    cudaDeviceSynchronize();
    cudaMemcpy(h_image,d_image,width * height * sizeof(int),cudaMemcpyDeviceToHost);
    double end = omp_get_wtime() - start;
    writepng("mandelbrot.png", h_image, width, height);
    cudaFree(d_image);
    free(h_image);
    
    printf("Wall time gpu: %lf",end);
    //

    return(0);
}
