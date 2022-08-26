#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=STAR_pass_2_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=6
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=12GB
#SBATCH --time=20:00
#SBATCH --output=STAR_pass_2-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-5%2

#module load Bioinformatics
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load star/2.7.6a-aekjdpr

file=$(ls SRR134494*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
#awk '{sub(/.*/, ""); print}' $file
#samplename=$(sed 's/.fastq.gz//' $file)
samplename=${file%fastq.gz}

echo $file
echo $samplename

mkdir -p ./STAR/
mkdir -p ./STAR/Pass2/

STAR --runThreadN 6 \
--genomeDir /home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference \
--readFilesIn $file \
--readFilesCommand zcat \
--outFileNamePrefix ./STAR/Pass2/$samplename \
--outSAMtype BAM SortedByCoordinate \
--sjdbFileChrStartEnd STAR/SJ.all.tab



