#!/bin/bash
#SBATCH --nodes 1                   #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 8                    #Number of CPUs For STAR choose 8-20. 
#SBATCH --time 0-12:00              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/a/akermani-cpd/ildem/outputs/HTseq_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/a/akermani-cpd/ildem/outputs/HTseq_%j.err.txt      # File to which STDERR will be written
#SBATCH --account=akermani-cpd

#LOAD modules 
module purge; module load bluebear
module load apps/htseq/v0.9.1

# Go to your directory 
cd /rds/projects/a/akermani-cpd/student  

# count reads 
htseq-count -m intersection-nonempty -s no -f bam *.bam /rds/projects/a/akermani-cpd/resource/hg38/gencode.v34.annotation.gtf  > HTseq_counts_file_hg38_Genv34.txt

# This will count ALL the bam files in the directory and produce just ONE count file (text format)
# If you run this on a for loop, you will produce one count file per sample, which you would need to "stitch back" 
# So i would recommend that you run all bam files at once producing a single count file/ matrix... 

# -s here is yes or no depending on if your data is stranded or not. Unless specified your data will not be stranded (you pay extra for this). 

# If this is not running, make sure that you dont have any empty bam files in your directory... 

