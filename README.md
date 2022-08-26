# Baucom_transcriptome

Files for reference-based analysis of transcriptome data

Outline.txt - an outline of steps and options. Start here.

# Downloading / obtaining sequence
 		Downloading_and_obtaining_sequence.txt 
 		Download_from_SRA_array.sh will download a list of files from the SRA. 
		Download_from_SRA.sh will download a single file / project (projects may include many files)
		id_list.txt - sample SRA ID list for download

#2. QC reads (after 1)
		QC.txt
		FastQC_array.sh
		

#3. Trim reads (after 1 and 2)
 		Trimming.txt
 		Trim_Galore_array.sh
		Trimmomatic_array.sh


#4. Prepare your resources: find your genome, find your annotation (if using), choose your aligner, update your alignment software, and index your genome (before or after 1)
 		Downloading_and_obtaining_sequence.txt
		Index_genome.txt
 		STAR_index.sh

#5. Align your reads!
		Alignment.txt
		Star_pass_1_array.sh
		Star_pass_2_array.sh
