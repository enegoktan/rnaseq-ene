#!/bin/bash
#SBATCH --nodes 1                      #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 12                    #Number of CPUs For STAR choose 8-20.
#SBATCH --time 0-01:00                 #Runtime in D-HH:MM
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/3.STAR_index/StarIndex_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/3.STAR_index/StarIndex_%j.err.txt      # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

#LOAD THE MODULES
module purge; module load bluebear
module load STAR/2.7.2b-GCC-8.3.0

# Go to your directory (not necessary in this script, but a good habit!!)
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene

##### STAR - make genome index ##########
# create a directory to store the index in - STARindex

# Run STAR to generate a genme index
STAR --runThreadN 12 --runMode genomeGenerate --genomeDir /rds/projects/t/thomaspz-fa-rna-seq/Ene/STARindex --genomeFastaFiles /rds/projects/t/thomaspz-fa-rna-seq/Ene/Additional_files/human_genome/Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa --sjdbGTFfile /rds/projects/t/thomaspz-fa-rna-seq/Ene/Additional_files/human_genome/Homo_sapiens.GRCh38.104.gtf --sjdbOverhang 74

# Make sure the --runThreadN is EQUAL to your #SBATCH --ntasks 16
# SLURM will give our script 16 CPUs, so STAR should demand 16.
