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
#SBATCH --output=STAR_index-%A-%a.log
#SBATCH --array=1-2

	vdb-config --prefetch-to-cwd
	prefetch SRR13449524 
	fasterq-dump SRR13449524 
	gzip SRR13449524.fastq 
