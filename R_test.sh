#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=SLURM_index_test
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=RSubread_index-%A-%a.log


module purge
module load R
module list
R CMD BATCH R_test.R
#
#myvar <- randnorm(mean=0,sd=1,n=10)
#write(myvar, "file.txt")