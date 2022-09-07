#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=STAR_index_Rifkin_ipomoea
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=6
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1GB 
#SBATCH --time=10:00
#SBATCH --partition=standard
#SBATCH --output=STAR_index-%A-%a.log


module use /nfs/turbo/rsbaucom/lab/Lmod #To use the GL version, replace these lines. To use a local version you add to your path, omit them.
module load STAR_module


STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /home/jlrifkin/Analyses/Transcriptome/STAR/Ipomoea_reference \
--genomeFastaFiles /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_headings_fixed.faa \
--sjdbGTFfile /nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_annos1-cds0-id_typename-nu1-upa1-add_chr0.gid58735.gtf \
--genomeSAindexNbases 13 \
--sjdbOverhang 99