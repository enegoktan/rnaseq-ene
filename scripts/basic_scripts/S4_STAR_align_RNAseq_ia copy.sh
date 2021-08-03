#!/bin/bash
#SBATCH --nodes 1                   #Number of nodes. Ensure that all cores are on one machine  =1
#SBATCH --ntasks 18                    #Number of CPUs For STAR choose 8-20. 
#SBATCH -t 0-10:30:30
#SBATCH -o /rds/projects/a/akermani-cpd/ildem/outputs/StarAlign_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/a/akermani-cpd/ildem/outputs/StarAlign_%j.err.txt      # File to which STDERR will be written
#SBATCH --account=akermani-cpd

#LOAD THE MODULES 
module purge; module load bluebear
module load apps/star-aligner/v2.5.2b

# Go to your directory (not necessary in this script, but a good habit!!)
cd /rds/projects/a/akermani-cpd/student  

  
##### STAR - make genome index ##########
# create a directory to store the index in (already done, so not executing)
# cd /rds/projects/a/akermani-cpd/resource/
#mkdir STARindex

# Run STAR to align 
for file in *.fastq
do
STAR --runThreadN 18 --runMode alignReads  --genomeDir /rds/projects/a/akermani-cpd/resource/STARindex --readFilesIn ${file} --outFileNamePrefix hg38STAR_"${file}" --outFilterMultimapNmax 1 --outReadsUnmapped Alignment_failed --outSAMtype BAM SortedByCoordinate --twopassMode Basic
done 

# Make sure the --runThreadN is EQUAL to your #SBATCH --ntasks 16 
# SLURM will give our script 16 CPUs, so STAR should demand 16. 


