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

mkdir -p ./FastQC/
file=$(ls ./*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
fastqc -o ./FastQC/ $file
