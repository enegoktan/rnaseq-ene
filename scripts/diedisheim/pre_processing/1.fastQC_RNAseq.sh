#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 4     # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 0-01:0  # Runtime in D-HH:MM
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/1.fastQC_RNAseq/fastQC_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/1.fastQC_RNAseq/fastQC_%j.err.txt   # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL


#Load modules
module purge; module load bluebear
module load bear-apps/2018a
module load FastQC/0.11.5-Java-1.8.0_74
module load MultiQC/1.5-iomkl-2018a-Python-3.6.3


# Checking quality

#cd /../.. go to the location of your dataset that will be processed
cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control

# mkdir a directory for the output of analysis, if not already present
# file needs to be unzipped before it can be processed
fastqc SRR9589954_GSM3902469_RNA-seq_Experiment_1_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq  -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/1.fastQC_results


# You can put this on a for loop in bash to repeat for each file in the folder

# The # sign in front of a line in a script makes the line invisible to the BlueBear. The line is ignored.

#for file in *.fastq
#do
#fastqc ${file}  -o /rds/projects/a/akermani-cpd/ildem/fastqc_results

#multiqc can make a summary of all fastQC results in a folder. just go to the folder and run the command.
#cd -o /rds/projects/a/akermani-cpd/ildem/fastqc_results
#multiqc
