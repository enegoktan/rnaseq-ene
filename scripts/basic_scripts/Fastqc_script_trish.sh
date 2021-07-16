#!/bin/bash
#SBATCH --nodes 1 
#SBATCH --ntasks 1
#SBATCH --time 0-12:0
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Avrahami/outputs/fastQC_%j.out.txt     
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Avrahami/outputs/fastQC_%j.err.txt  
#SBATCH --qos bbdefault
#SBATCH --mem 30G
#SBATCH --mail-type ALL
#SBATCH --account thomaspz-fa-rna-seq


# Load modules
	module purge; module load bluebear
	module load bear-apps-unsupported/2017a
	module load FastQC/0.11.5-Java-1.8.0_74
	module load bear-apps-unsupported/2018a
	module load MultiQC/1.5-iomkl-2018a-Python-3.6.3
	
# go to directory (nb: change this to the directory that you have saved your fastq files to)
	cd /rds/projects/t/thomaspz-fa-rna-seq/Avrahami/fastqc_results/fastqc_results_3
#perform fastqc
	for file in *.fq
	do
	fastqc ${file} 
	done
