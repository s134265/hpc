#!/bin/bash
#BSUB -J particles
#BSUB -o particles_%J.out
#BSUB -e particles_%J.err
#BSUB -q hpcintro
#BSUB -W 45
#BSUB -R "select[model = XeonGold6126]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -n 1 -R "span[hosts=1]"
 
./run_tunelab.sh