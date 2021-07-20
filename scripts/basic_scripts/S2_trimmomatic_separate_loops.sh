#!/bin/bash
#SBATCH --ntasks 8
#SBATCH --time 1:00:0
#SBATCH --qos bbdefault
#SBATCH --mem 120G
#SBATCH --mail-type ALL
#SBATCH --account thomaspz-fa-rna-seq

# Load modules
	module purge; module load bluebear
	module load bear-apps-unsupported/handbuilt/2017
	module load apps/trimmomatic/v0.32
	module load bear-apps-unsupported/2017a
	
# go to directory
	cd /rds/projects/t/thomaspz-fa-rna-seq/Avrahami/Fastq

#Clip adapters
	sample="SRR12758062_GSM4813679_67788_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758063_GSM4813679_67788_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758064_GSM4813680_67789_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758065_GSM4813680_67789_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758066_GSM4813681_67791_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758067_GSM4813681_67791_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758068_GSM4813682_67792_AEHL151_Homo_sapiens_RNA-Seq.fastq SRR12758069_GSM4813682_67792_AEHL151_Homo_sapiens_RNA-Seq.fastq" 
	
	for r1 in $sample; do
	r2=$r1
	r2="${r1/RNA-Seq/RNA-Seq.1}"
	java -jar ${TMATIC_ROOT}/trimmomatic-0.32.jar SE -trimlog Triming_LOG_trimmomatic1.fastq $r1 $r2 ILLUMINACLIP:contaminant_list_polyA.fa:3:10:8:6 LEADING:3 TRAILING:3
	done

#Clip polyA tails
	sample="SRR12758062_GSM4813679_67788_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758063_GSM4813679_67788_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758064_GSM4813680_67789_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758065_GSM4813680_67789_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758066_GSM4813681_67791_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758067_GSM4813681_67791_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758068_GSM4813682_67792_AEHL151_Homo_sapiens_RNA-Seq.1.fastq SRR12758069_GSM4813682_67792_AEHL151_Homo_sapiens_RNA-Seq.1.fastq" 
	
	for r1 in $sample; do
	r2=$r1
	r2="${r1/RNA-Seq.1/RNA-Seq.2}"
	java -jar ${TMATIC_ROOT}/trimmomatic-0.32.jar SE -trimlog Triming_LOG_Trimmomatic2.fastq $r1 $r2 ILLUMINACLIP:polyA.fa:3:10:8:6 SLIDINGWINDOW:4:15 MINLEN:30
	done
	
