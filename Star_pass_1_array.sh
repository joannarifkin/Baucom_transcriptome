#!/bin/bash



#SBATCH --job-name=STAR_pass_1_Rifkin
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
#SBATCH --array=1-5%2

#module load Bioinformatics
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load trimgalore
mkdir -p ./Trim_galore/
file=$(ls SRR134494*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo $file
trim_galore --fastqc --output_dir Trim_galore --cores 3 $file 



mkdir Sample1_pass1
cd Sample1_pass1

STAR --runThreadN 20 \
--genomeDir /path/to/canFam3STAR \
--readFilesIn /path/to/Sample1_001_R1.fastq.gz,/path/to/Sample1_002_R1.fastq.gz /path/to/Sample1_001_R2.fastq.gz,/path/to/Sample1_002_R2.fastq.gz \
--readFilesCommand zcat  \
--outSAMtype BAM Unsorted