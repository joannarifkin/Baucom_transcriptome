for i in "12" "13"



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