#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=SLURM_index_test
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=20:00
#SBATCH --partition=standard
#SBATCH --output=RSubread_index-%A-%a.log



module load R
R

Rserve(args="--no-save")

library("Rsubread",lib="/nfs/turbo/rsbaucom/lab/SOFTWARE/R/4.2/library")
setwd("/home/jlrifkin/Analyses/Transcriptome/RSubread/test") #directory where you want to run it

ref <- system.file("extdata","reference.fa",package="Rsubread") #Demo genome and index, included with the package
buildindex(basename="reference_index",reference=ref) #Note that this will build in the current working directory. Make sure to setwd() to the place you want the index to be!

ipomoea_ref<-"/nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_headings_fixed.faa"

buildindex(basename="Ipomoea_index",reference=ipomoea_ref)
