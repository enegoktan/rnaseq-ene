#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 1     # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 0-04:0  # Runtime in D-HH:MM
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/1.fastQC_RNAseq/fastQC_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/1.fastQC_RNAseq/fastQC_%j.err.txt   # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL


# Load modules
module purge; module load bluebear
module load FastQC/0.11.9-Java-11
module load MultiQC/1.9-foss-2019b-Python-3.7.4

# Checking quality

#go to the location of your dataset that will be processed
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control

gunzip *

# loop in bash to repeat for each file in the folder
for file in *.fastq
do
  fastqc ${file} -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/1.fastQC_results
done

gzip *

#multiqc can make a summary of all fastQC results in a folder. just go to the folder and run the command.
#cd -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/1.fastQC_results
#multiqc
