#!/bin/bash



#SBATCH --job-name=FastQC_Rifkin
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=10:00
#SBATCH --partition=standard
#SBATCH --output=%j.log
#SBATCH --error=error_%j.log
#SBATCH --array=1-89%5

module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load fastqc/0.11.9-p6ckgle

mkdir -p ./FastQC/
file=$(ls ./*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
fastqc -o ./FastQC/ $file
