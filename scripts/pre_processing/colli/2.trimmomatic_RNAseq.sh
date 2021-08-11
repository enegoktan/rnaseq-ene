#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 8                 # Number of nodes. Ensure that all cores are on one machine
#SBATCH --time 0-04:0              # Runtime in D-HH:MM
#SBATCH -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_out/2.trimmomatic_RNAseq/trim_%j.out.txt      # File to which STDOUT will be written
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/slurm_outputs/slurm_errors/2.trimmomatic_RNAseq/trim_%j.err.txt      # File to which STDERR will be written
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

module purge; module load bluebear
module load Trimmomatic/0.39-Java-11
module load FastQC/0.11.9-Java-11
module load MultiQC/1.9-foss-2019b-Python-3.7.4

# Trim in two steps - first take off the adapters, then take off the polyA and the quality.

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control/unprocessed

# Clip adapters

# Loop them in samples of size 5

sample="SRR9589954_GSM3902469_RNA-seq_Experiment_1_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz SRR9589955_GSM3902470_RNA-seq_Experiment_2_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz SRR9589957_GSM3902472_RNA-seq_Experiment_4_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq SRR9589958_GSM3902473_RNA-seq_Experiment_5_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq"
#sample="SRR9589959_GSM3902474_RNA-seq_Experiment_1_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq SRR9589960_GSM3902475_RNA-seq_Experiment_2_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq SRR9589961_GSM3902476_RNA-seq_Experiment_3_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq SRR9589962_GSM3902477_RNA-seq_Experiment_4_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq SRR9589963_GSM3902478_RNA-seq_Experiment_5_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq"
#sample="SRR9589964_GSM3902479_RNA-seq_Experiment_1_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq SRR9589965_GSM3902480_RNA-seq_Experiment_2_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq SRR9589966_GSM3902481_RNA-seq_Experiment_3_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq SRR9589968_GSM3902483_RNA-seq_Experiment_5_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz"

for r1 in $sample
do
 r2=$r1
 r2="${r1/Homo_sapiens_RNA-Seq_1/Homo_sapiens_RNA-Seq_TEMP}"
 java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_trimmomatic1.fastq -basein $r1 -baseout $r2 ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/contaminant_list_polyA.fa:3:10:8:6 LEADING:3 TRAILING:3
done

# Clip polyA tails

sample="SRR9589954_GSM3902469_RNA-seq_Experiment_1_-_control_condition_2h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589955_GSM3902470_RNA-seq_Experiment_2_-_control_condition_2h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589957_GSM3902472_RNA-seq_Experiment_4_-_control_condition_2h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq SRR9589958_GSM3902473_RNA-seq_Experiment_5_-_control_condition_2h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq"
#sample="SRR9589959_GSM3902474_RNA-seq_Experiment_1_-_control_condition_8h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589960_GSM3902475_RNA-seq_Experiment_2_-_control_condition_8h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589961_GSM3902476_RNA-seq_Experiment_3_-_control_condition_8h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz SRR9589962_GSM3902477_RNA-seq_Experiment_4_-_control_condition_8h_Homo_sapiens_RNA-RNA-Seq_TEMP_1P.fastq.gz SRR9589963_GSM3902478_RNA-seq_Experiment_5_-_control_condition_8h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq.gz"
#sample="SRR9589966_GSM3902481_RNA-seq_Experiment_3_-_control_condition_24h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-RNA-Seq_TEMP_1P.fastq SRR9589968_GSM3902483_RNA-seq_Experiment_5_-_control_condition_24h_Homo_sapiens_RNA-Seq_TEMP_1P.fastq"

for r1 in $sample
do
  r2=$r1
	r2="${r1/Homo_sapiens_RNA-Seq_TEMP_1P/Homo_sapiens_RNA-Seq_trimmed}"
  java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -trimlog Triming_LOG_Trimmomatic2.fastq -basein $r1 -baseout $r2 ILLUMINACLIP:/rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/polyA.fa:3:10:8:6 SLIDINGWINDOW:4:15 MINLEN:30
done

mv *TEMP* /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control/2.processed_trimmomatic
mv *trimmed* /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control/2.processed_trimmomatic


gzip *fastq

# change directory to where the trimmed files are

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/dataset/control/2.processed_trimmomatic

#then quality check the trimmed and clipped file

fastqcsample="SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_trimmed_1P.fastq.gz SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_trimmed_2P.fastq.gz SRR9589965_GSM3902480_RNA-seq_Experiment_2_-_control_condition_24h_Homo_sapiens_RNA-Seq_trimmed_1P.fastq SRR9589965_GSM3902480_RNA-seq_Experiment_2_-_control_condition_24h_Homo_sapiens_RNA-Seq_trimmed_2P.fastq SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-Seq_trimmed_1P.fastq SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-Seq_trimmed_2P.fastq"

for file in $fastqcsample #*RNA-Seq_trimmed*P*
do
  fastqc ${file}  -o /rds/projects/t/thomaspz-fa-rna-seq/Ene/data/colli/2.trimmed_fastQC
done
