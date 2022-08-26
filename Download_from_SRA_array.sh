#!/bin/bash



#SBATCH --account=rsbaucom0
#SBATCH --job-name=SRA_download_Rifkin_ipomoea
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1GB 
#SBATCH --time=10:00
#SBATCH --partition=standard
#SBATCH --output=SRA_download-%A-%a
#SBATCH --array=1-89%10

	vdb-config --prefetch-to-cwd
	id=$(awk "NR==${SLURM_ARRAY_TASK_ID}" id_list.txt)
	srun echo "SRA ID $id: "
	prefetch $id
	fasterq-dump $id 
	gzip $id.fastq 
