#!/bin/bash



#SBATCH --job-name=Trim_galore_Rifkin
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=%j.log
#SBATCH --error=error_%j.log
#SBATCH --array=1-89%5

module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load trimgalore
mkdir -p ./Trim_galore/
file=$(ls *.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo $file
trim_galore --fastqc --output_dir Trim_galore --cores 3 $file 