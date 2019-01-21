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
    int   *image, *h_image, *d_image;

    width    = 2601;
    height   = 2601;
    max_iter = 400;

    // command line argument sets the dimensions of the image
    if ( argc == 2 ) width = height = atoi(argv[1]);
    
    
    
    
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

    start = omp_get_wtime();
    h_image = (int *)malloc( width * height * sizeof(int));
    cudaMalloc((void**)&d_image,width * height * sizeof(int));
    mandelgpu<<<1,1>>>(width, height, d_image, max_iter);
    cudaDeviceSynchronize();
    cudaMemcpy(h_image,d_image,width * height * sizeof(int),cudaMemcpyDeviceToHost);
    
    writepng("mandelbrot.png", h_image, width, height);
    cudaFree(d_image);
    free(h_image);
    end = omp_get_wtime() - start;
    printf("Wall time gpu: %lf",end);
    //

    return(0);
}
