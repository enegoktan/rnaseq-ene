#!/bin/bash
#SBATCH --nodes 1                  
#SBATCH --ntasks 4                    # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 0-01:0              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/a/akermani-cpd/ildem/outputs/fastQC_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/a/akermani-cpd/ildem/outputs/fastQC_%j.err.txt      # File to which STDERR will be written
#SBATCH --account=akermani-cpd



#Load modules 
module purge; module load bluebear
module load bear-apps/2018a
module load FastQC/0.11.5-Java-1.8.0_74
module load MultiQC/1.5-iomkl-2018a-Python-3.6.3



# Checking quality 

cd /rds/projects/a/akermani-cpd/ildem/
mkdir fastqc_results

fastqc test.fastq  -o /rds/projects/a/akermani-cpd/ildem/fastqc_results


# You can put this on a for loop in bash to repeat for each file in the folder 

# The # sign in front of a line in a script makes the line invisible to the BlueBear. The line is ignored. 

#for file in *.fastq
#do
#fastqc ${file}  -o /rds/projects/a/akermani-cpd/ildem/fastqc_results

#multiqc can make a summary of all fastQC results in a folder. just go to the folder and run the command. 
#cd -o /rds/projects/a/akermani-cpd/ildem/fastqc_results
#multiqc
