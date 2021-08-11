#!/bin/bash
#SBATCH --nodes 1                   #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 12                    #Number of CPUs For STAR choose 8-20. 
#SBATCH --time 0-06:00              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/a/akermani-cpd/ildem/outputs/StarIndex_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/a/akermani-cpd/ildem/outputs/StarIndex_%j.err.txt      # File to which STDERR will be written
#SBATCH --account=akermani-cpd

#LOAD THE MODULES 
module purge; module load bluebear
module load apps/star-aligner/v2.5.2b

# Go to your directory (not necessary in this script, but a good habit!!)
cd /rds/projects/a/akermani-cpd/student  

  
##### STAR - make genome index ##########
# create a directory to store the index in 
# cd /rds/projects/a/akermani-cpd/resource/
#mkdir STARindex

# Run STAR to enerate a genme index 
STAR --runThreadN 12 --runMode genomeGenerate --genomeDir /rds/projects/a/akermani-cpd/resource/STARindex --genomeFastaFiles /rds/projects/a/akermani-cpd/resource/hg38/hg38.fa --sjdbGTFfile /rds/projects/a/akermani-cpd/resource/hg38/gencode.v34.annotation.gtf --sjdbOverhang 74  

# Make sure the --runThreadN is EQUAL to your #SBATCH --ntasks 16 
# SLURM will give our script 16 CPUs, so STAR should demand 16. 


