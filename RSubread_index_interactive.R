getwd()
setwd("/home/jlrifkin/Analyses/Transcriptome/RSubread")


#These two commands are necessary the first time you use RSubread

#if (!require("BiocManager", quietly = TRUE))
  # install.packages("BiocManager")

#BiocManager::install("Rsubread") #Note that this may 
#library(Rsubread)
#BiocManager::install("WGCNA",lib="/nfs/turbo/rsbaucom/lab/SOFTWARE/R/4.2/library", force=TRUE)
library("Rsubread",lib="/nfs/turbo/rsbaucom/lab/SOFTWARE/R/4.2/library")
ref <- system.file("extdata","reference.fa",package="Rsubread") #Demo genome and index, included with the package
buildindex(basename="reference_index",reference=ref) #Note that this will build in the current working directory. Make sure to setwd() to the place you want the index to be!

ipomoea_ref<-"/nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_headings_fixed.faa"

buildindex(basename="Ipomoea_index",reference=ipomoea_ref)
