#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=SLURM_align_test
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16GB
#SBATCH --time=3-00:00:00
#SBATCH --partition=standard
#SBATCH --output=RSubread_align-%A-%a.log

mkdir -p RSubread_Alignment #Make sure this matches the output directory in the R script

module purge
module load R
module list

R CMD BATCH --no-save RSubread_align_script.R