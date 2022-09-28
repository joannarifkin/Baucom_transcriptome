

#These two commands are necessary the first time you use RSubread

#if (!require("BiocManager", quietly = TRUE))
# install.packages("BiocManager")

#BiocManager::install("Rsubread") #Note that this may 

# Load the RSubread library
library("Rsubread",lib="/nfs/turbo/rsbaucom/lab/SOFTWARE/R/4.2/library")

getwd()
setwd("/scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/RSubread") #Set the working directory to the place you want to put the output


#Note that the regular expression here takes a different from from the one in the STAR command. Regex syntax in R is often a little tricky. 

reads <- list.files( path = "/scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression", pattern = "SRR134494.*.fastq.gz$", full.names = TRUE)

# reads <- list.files( path = "/scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression", pattern = "SRR1344949[56].fastq.gz$", full.names = TRUE)    #Example for just two files


samplenames<-unlist(lapply((strsplit(reads,("\\/|\\."))), '[[', 7)) #Pull just the SRR* part of each filename - you'll need to change this for your riles


align(index="/home/jlrifkin/Analyses/Transcriptome/RSubread/Ipomoea_index",readfile1=reads,input_format="gzFASTQ",output_format="BAM",nthreads=4, output_file = paste("/scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/Alignments/",samplenames,".subread.bam",sep=""), useAnnotation = TRUE, annot.ext="/nfs/turbo/rsbaucom/lab/IP_genome_COGE/Ipomoea_purpurea_annos1-cds0-id_typename-nu1-upa1-add_chr0.gid58735.gtf", isGTF = TRUE)
#Adjust paths to match your sample
