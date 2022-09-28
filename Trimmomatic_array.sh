#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trimmomatic_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1GB
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=STAR_pass_2-%A-%a.log
#SBATCH --array=1-89%5

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load trimmomatic
module list
mkdir -p ./Trimmomatic/
file=$(ls *.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo $file
TrimmomaticSE -threads 8 $file /Trimmomatic/trimmed_$file ILLUMINACLIP:TruSeq2-SE:2:30:10 LEADING:3 TRAILING:3 MAXINFO:50:0.5 MINLEN:36 
