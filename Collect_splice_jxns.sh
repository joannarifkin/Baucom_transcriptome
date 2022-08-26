#!/bin/bash

mkdir -p /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass1/pass1SJ
for i in /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass1/*.SJ.out.tab
do 
	awk '{ if ($7 >= 3) print $0}' $i > $i.filtered
	mv $i.filtered /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass1/pass1SJ/
done
cat /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/Pass1/pass1SJ/*.SJ.out.tab.filtered > /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Transcriptome_fitness_expression/STAR/SJ.all.tab
