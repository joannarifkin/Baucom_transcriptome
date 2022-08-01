#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-2:00 		# hours:minutes runlimit after which job will be killed
#SBATCH -c 6 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --mem 16G
#SBATCH --job-name STAR_index_Rifkin_ipomoea		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard err will be written
#SBATCH --mail-user=jlrifkin@umich.edu  
#SBATCH --mail-type=ALL

STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference \
--genomeFastaFiles /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea.faa \
--sjdbGTFfile /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_annos1-cds0-id_typename-nu1-upa1-add_chr0.gid58735.gff \
--sjdbOverhang 99