#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=SLURM_index_test
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=4GB
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=RSubread_index-%A-%a.log



module load R
R

R CMD BATCH --no-save RSubread_index_script.R