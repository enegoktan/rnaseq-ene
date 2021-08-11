#!/bin/bash
#SBATCH --nodes 1                   #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 8                  #Number of CPUs For STAR choose 8-20.
#SBATCH --time 2-0:00              # Runtime in D-HH:MM
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/5.HTseq/HTseq_%j.out.txt    # File to which STDOUT will be written
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/5.HTseq/HTseq_%j.out.txt       # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

#LOAD modules
module purge; module load bluebear
module load HTSeq/0.12.4-foss-2019b-Python-3.7.4

# Go to your directory
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/diedisheim/STAR_analysis

# count reads
htseq-count -m union -s yes -r pos -f bam *.bam /rds/projects/t/thomaspz-fa-rna-seq/Ene/Additional_files/human_genome/Homo_sapiens.GRCh38.104.gtf

# options explained:
# -f is for the format of the input data
# -r is for ordering the alignment of paired-end data, either by <name> or position <pos>
# -m mode for handling reads overlapping more than one feature(gene)
# -s here is yes or no depending on if your data is stranded or not. Unless specified your data will not be stranded (you pay extra for this).


# This will count ALL the bam files in the directory and produce just ONE count file (text format)
# If you run this on a for loop, you will produce one count file per sample, which you would need to "stitch back"
# So i would recommend that you run all bam files at once producing a single count file/ matrix...

# If this is not running, make sure that you dont have any empty bam files in your directory...
