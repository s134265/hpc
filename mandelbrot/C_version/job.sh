#!/bin/bash
#BSUB -J mandel
#BSUB -o ../meta_logs/mandel_%J.out
#BSUB -e ../meta_logs/mandel_%J.err
#BSUB -q hpcintro
#BSUB -W 600
#BSUB -R "select[model = XeonGold6126]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -n 24 -R "span[hosts=1]"

LOGEXT=dat


rm -r mandel
mkdir mandel



for t in 1 2 4 8 16 24; do
	OMP_NUM_THREADS=$t ./mandelbrot | grep -v CPU >> mandel/mandel.$LOGEXT

done

