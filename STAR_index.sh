#!/bin/bash



#SBATCH --job-name=STAR_index_Rifkin_ipomoea
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=6
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=10000m 
#SBATCH --time=10:00
#SBATCH --partition=standard
#SBATCH --output=/home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference/test_%j.log
#SBATCH --error=/home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference/error_%j.log


STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference \
--genomeFastaFiles /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea.faa \
--sjdbGTFfile /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_annos1-cds0-id_typename-nu1-upa1-add_chr0.gid58735.gff \
--sjdbOverhang 99