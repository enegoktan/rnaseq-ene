#!/bin/bash
#SBATCH --nodes 1                   #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 18                    #Number of CPUs For STAR choose 8-20.
#SBATCH -t 0-10:30:30
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/4.STAR_align/StarAlign_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/4.STAR_align/StarAlign_%j.err.txt      # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

#LOAD THE MODULES
module purge; module load bluebear
module load STAR/2.7.2b-GCC-8.3.0

# Go to your directory (not necessary in this script, but a good habit!!)
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene

##### STAR - make genome index ##########
# create a directory to store the index in (already done, so not executing)
# /rds/projects/t/thomaspz-fa-rna-seq/Ene/STARindex

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control/2.processed_trimmomatic

gzip -d *fastq.gz

sample=*RNA-Seq_trimmed_1P.fastq

# Run STAR to align
for r1 in $sample
do
  r2=$r1
  r2="${r1/RNA-Seq_trimmed_1P/RNA-Seq_trimmed_2P}"
  r3=$r1
  r3="${r1/RNA-Seq_trimmed_1P/RNA-Seq_trimmed}"
  STAR --runThreadN 18 --runMode alignReads --genomeDir /rds/projects/t/thomaspz-fa-rna-seq/Ene/STARindex --readFilesIn $r1 $r2 --outFileNamePrefix h38STAR_"${r3}" --outFilterMultimapNmax 1 --outReadsUnmapped Alignment_failed --outSAMtype BAM SortedByCoordinate --twopassMode Basic
done

# Make sure the --runThreadN is EQUAL to your #SBATCH --ntasks 16
# SLURM will give our script 16 CPUs, so STAR should demand 16.
