#!/bin/bash

#SBATCH --job-name=STAR_pass_1_Rifkin
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=12GB
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=%j.log
#SBATCH --error=error_%j.log
#SBATCH --array=1-5%2

#module load Bioinformatics
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load trimgalore

file=$(ls SRR134494*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
#awk '{sub(/.*/, ""); print}' $file
#samplename=$(sed 's/.fastq.gz//' $file)
samplename=${file%fastq.gz}

echo $file
echo $samplename

mkdir -p ./STAR/
mkdir -p ./STAR/Pass1/

STAR --runThreadN 6 \
--genomeDir /home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference \
--readFilesIn $file \
--readFilesCommand zcat \
--outFileNamePrefix ./STAR/Pass1/$samplename \
--outSAMtype BAM Unsorted