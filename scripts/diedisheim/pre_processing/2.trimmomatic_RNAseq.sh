#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 8                 # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 0-04:0              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/2.trimmomatic_RNAseq/trim_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/2.trimmomatic_RNAseq/trim_%j.err.txt      # File to which STDERR will be written


module purge; module load bluebear
module load Trimmomatic/0.39-Java-11
module load FastQC/0.11.9-Java-11
module load MultiQC/1.9-foss-2019b-Python-3.7.4


# Trim in two steps - first take off the adapters, then take off the polyA and the quality.
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/diedisheim/dataset/test_trim

# Clip adapters
# analyse files by sets of five

#sample=*RNA-Seq_1.fastq.gz
# first five
#sample="SRR5998588_GSM2769683_Ctrl_0h_1_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998589_GSM2769684_Ctrl_0h_2_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998590_GSM2769685_Ctrl_0h_3_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998591_GSM2769686_Ctrl_4h_1_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998592_GSM2769687_Ctrl_4h_2_Homo_sapiens_RNA-Seq_1.fastq.gz"
# second five
sample="SRR5998593_GSM2769688_Ctrl_4h_3_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998597_GSM2769692_Ctrl_24h_1_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998598_GSM2769693_Ctrl_24h_2_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998599_GSM2769694_Ctrl_24h_3_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998603_GSM2769698_Ctrl_72h_1_Homo_sapiens_RNA-Seq_1.fastq.gz"
# third five
#sample="SRR5998604_GSM2769699_Ctrl_72h_2_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998605_GSM2769700_Ctrl_72h_3_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998609_GSM2769704_Ctrl_144h_1_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998610_GSM2769705_Ctrl_144h_2_Homo_sapiens_RNA-Seq_1.fastq.gz SRR5998611_GSM2769706_Ctrl_144h_3_Homo_sapiens_RNA-Seq_1.fastq.gz"

for r1 in $sample
do
  r2=$r1
	r2="${r1/RNA-Seq_1/RNA-Seq_TEMP}"
  java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_trimmomatic1.fastq -basein $r1 -baseout $r2 ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/contaminant_list_polyA.fa:3:10:8:6 LEADING:3 TRAILING:3
done

# Clip polyA tails
#sample=*RNA-Seq_TEMP_1P*
sample="SRR5998588_GSM2769683_Ctrl_0h_1_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR5998589_GSM2769684_Ctrl_0h_2_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR5998590_GSM2769685_Ctrl_0h_3_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR5998591_GSM2769686_Ctrl_4h_1_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR5998592_GSM2769687_Ctrl_4h_2_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz"

for r1 in $sample
do
  r2=$r1
	r2="${r1/RNA-Seq_TEMP_1P/RNA-Seq_trimmed}"
  java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_Trimmomatic2.fastq -basein $r1 -baseout $r2 ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/polyA.fa:3:10:8:6 SLIDINGWINDOW:4:15 MINLEN:30
done

#java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_trimmomatic1.fastq  -basein ${file} -baseout ${file}temp.fastq ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/contaminant_list_polyA.fa:3:10:8:6 LEADING:3 TRAILING:3
#java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_Trimmomatic2.fastq  temp_1P.fastq temp_2P.fastq -baseout trimTC${file} ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/polyA.fa:3:10:8:6 SLIDINGWINDOW:4:15 MINLEN:30

#then test the trimmed and clipped file
#gunzip *RNA-Seq_trimmed*

#for file in *RNA-Seq_trimmed*
#do
#  fastqc ${file}  -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/diedisheim/2.trimmed_fastQC
#done

#gzip *
