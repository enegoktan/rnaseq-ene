#!/bin/bash
#SBATCH --nodes 1                  
#SBATCH --ntasks 8                    # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 2-00:0              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/a/akermani-cpd/ildem/outputs/trim_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/a/akermani-cpd/ildem/outputs/trim_%j.err.txt      # File to which STDERR will be written
#SBATCH --account=akermani-cpd
module purge; module load bluebear
module load apps/trimmomatic/v0.32
module load bear-apps/2018a
module load FastQC/0.11.5-Java-1.8.0_74
module load MultiQC/1.5-iomkl-2018a-Python-3.6.3




# Trimming test.fastq

# Trim in two steps - first take off the adapters, then take off the polyA and the quality. 
cd /rds/projects/a/akermani-cpd/ildem/

java -jar ${TMATIC_ROOT}/trimmomatic-0.32.jar SE -trimlog Triming_LOG_trimmomatic1.fastq  test.fastq temp.fastq ILLUMINACLIP:contaminant_list_polyA.fa:3:10:8:6 LEADING:3 TRAILING:3
java -jar ${TMATIC_ROOT}/trimmomatic-0.32.jar SE -trimlog Triming_LOG_Trimmomatic2.fastq  temp.fastq trimTC_test.fastq ILLUMINACLIP:polyA.fa:3:10:8:6 SLIDINGWINDOW:4:15 MINLEN:30


#then test the trimmed and clipped file. 
#mkdir fastqc_results   # use to make a directory if you have not already 

fastqc trimTC_test.fastq -o /rds/projects/a/akermani-cpd/ildem/fastqc_results
