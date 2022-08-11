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
#SBATCH --array=1-89%20

	id=$(awk "NR==${SLURM_ARRAY_TASK_ID}" id_list.txt)
	srun echo "SRA ID $id: "
	prefetch $id
	fasterq-dump $id 
	gzip $id.fastq 
