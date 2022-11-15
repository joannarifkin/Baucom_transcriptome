#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=STAR_pass_2_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=6
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=12GB
#SBATCH --time=20:00
#SBATCH --output=STAR_pass_2-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-5%2


file=$(ls /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass2/SRR134494*.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)


module purge
module load Bioinformatics
module load picard-tools/2.8.1
module list 

echo $file


PicardCommandLine FixMateInformation 
PicardCommandLine MarkDuplicates 
PicardCommandLine AddOrReplaceReadGroups 
/scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass2
do


java -jar /nfs/turbo/rsbaucom/lab/SOFTWARE/picard/build/libs/picard.jar SortSam \
	  I=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/5-21-21_Pass2_$i\Aligned.out.bam \
	  O=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/tmp1_$i.bam \
	  SORT_ORDER=coordinate \
	  VALIDATION_STRINGENCY=LENIENT



java -jar /nfs/turbo/rsbaucom/lab/SOFTWARE/picard/build/libs/picard.jar MarkDuplicates \
      I=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/tmp1_$i.bam \
      O=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/tmp2_$i.bam \
      M=$i\marked_dup_metrics.txt \
	  REMOVE_DUPLICATES=true \
	  VALIDATION_STRINGENCY=LENIENT

rm tmp1_$i
	  
java -jar /nfs/turbo/rsbaucom/lab/SOFTWARE/picard/build/libs/picard.jar AddOrReplaceReadGroups \
      I=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/tmp2_$i.bam \
      O=/ohta/joanna.rifkin/Alignments/STAR/GeorgeFlower/HiC/AnalysisReady_$i.bam \
	  VALIDATION_STRINGENCY=LENIENT \
	  RGID=1$i \
      RGLB=lib1$i \
      RGPL=illumina$i \
      RGPU=unit1$i \
      RGSM=sample$i

rm tmp2_$i
  
done 