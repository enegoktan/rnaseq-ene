#!/bin/bash
#SBATCH --ntasks 1
#SBATCH --time 02:00:0
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/project/outputs/extract.err.txt
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

set -e

module purge; module load bluebear

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/project/colli

#!/usr/bin/env bash
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589962/SRR9589962_1.fastq.gz -o SRR9589962_GSM3902477_RNA-seq_Experiment_4_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589962/SRR9589962_2.fastq.gz -o SRR9589962_GSM3902477_RNA-seq_Experiment_4_-_control_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589963/SRR9589963_1.fastq.gz -o SRR9589963_GSM3902478_RNA-seq_Experiment_5_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589963/SRR9589963_2.fastq.gz -o SRR9589963_GSM3902478_RNA-seq_Experiment_5_-_control_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589966/SRR9589966_1.fastq.gz -o SRR9589966_GSM3902481_RNA-seq_Experiment_3_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589966/SRR9589966_2.fastq.gz -o SRR9589966_GSM3902481_RNA-seq_Experiment_3_-_control_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589965/SRR9589965_1.fastq.gz -o SRR9589965_GSM3902480_RNA-seq_Experiment_2_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589965/SRR9589965_2.fastq.gz -o SRR9589965_GSM3902480_RNA-seq_Experiment_2_-_control_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589967/SRR9589967_1.fastq.gz -o SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589967/SRR9589967_2.fastq.gz -o SRR9589967_GSM3902482_RNA-seq_Experiment_4_-_control_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589964/SRR9589964_1.fastq.gz -o SRR9589964_GSM3902479_RNA-seq_Experiment_1_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589964/SRR9589964_2.fastq.gz -o SRR9589964_GSM3902479_RNA-seq_Experiment_1_-_control_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589968/SRR9589968_1.fastq.gz -o SRR9589968_GSM3902483_RNA-seq_Experiment_5_-_control_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589968/SRR9589968_2.fastq.gz -o SRR9589968_GSM3902483_RNA-seq_Experiment_5_-_control_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589969/SRR9589969_1.fastq.gz -o SRR9589969_GSM3902484_RNA-seq_Experiment_1_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589969/SRR9589969_2.fastq.gz -o SRR9589969_GSM3902484_RNA-seq_Experiment_1_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589954/SRR9589954_1.fastq.gz -o SRR9589954_GSM3902469_RNA-seq_Experiment_1_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589954/SRR9589954_2.fastq.gz -o SRR9589954_GSM3902469_RNA-seq_Experiment_1_-_control_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589955/SRR9589955_1.fastq.gz -o SRR9589955_GSM3902470_RNA-seq_Experiment_2_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589955/SRR9589955_2.fastq.gz -o SRR9589955_GSM3902470_RNA-seq_Experiment_2_-_control_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589956/SRR9589956_1.fastq.gz -o SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589956/SRR9589956_2.fastq.gz -o SRR9589956_GSM3902471_RNA-seq_Experiment_3_-_control_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589957/SRR9589957_1.fastq.gz -o SRR9589957_GSM3902472_RNA-seq_Experiment_4_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589957/SRR9589957_2.fastq.gz -o SRR9589957_GSM3902472_RNA-seq_Experiment_4_-_control_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589958/SRR9589958_1.fastq.gz -o SRR9589958_GSM3902473_RNA-seq_Experiment_5_-_control_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589958/SRR9589958_2.fastq.gz -o SRR9589958_GSM3902473_RNA-seq_Experiment_5_-_control_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589959/SRR9589959_1.fastq.gz -o SRR9589959_GSM3902474_RNA-seq_Experiment_1_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589959/SRR9589959_2.fastq.gz -o SRR9589959_GSM3902474_RNA-seq_Experiment_1_-_control_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589960/SRR9589960_1.fastq.gz -o SRR9589960_GSM3902475_RNA-seq_Experiment_2_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589960/SRR9589960_2.fastq.gz -o SRR9589960_GSM3902475_RNA-seq_Experiment_2_-_control_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589961/SRR9589961_1.fastq.gz -o SRR9589961_GSM3902476_RNA-seq_Experiment_3_-_control_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589961/SRR9589961_2.fastq.gz -o SRR9589961_GSM3902476_RNA-seq_Experiment_3_-_control_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589971/SRR9589971_1.fastq.gz -o SRR9589971_GSM3902486_RNA-seq_Experiment_3_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589971/SRR9589971_2.fastq.gz -o SRR9589971_GSM3902486_RNA-seq_Experiment_3_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589970/SRR9589970_1.fastq.gz -o SRR9589970_GSM3902485_RNA-seq_Experiment_2_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589970/SRR9589970_2.fastq.gz -o SRR9589970_GSM3902485_RNA-seq_Experiment_2_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589974/SRR9589974_1.fastq.gz -o SRR9589974_GSM3902489_RNA-seq_Experiment_1_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/004/SRR9589974/SRR9589974_2.fastq.gz -o SRR9589974_GSM3902489_RNA-seq_Experiment_1_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589977/SRR9589977_1.fastq.gz -o SRR9589977_GSM3902492_RNA-seq_Experiment_4_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/007/SRR9589977/SRR9589977_2.fastq.gz -o SRR9589977_GSM3902492_RNA-seq_Experiment_4_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589976/SRR9589976_1.fastq.gz -o SRR9589976_GSM3902491_RNA-seq_Experiment_3_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/006/SRR9589976/SRR9589976_2.fastq.gz -o SRR9589976_GSM3902491_RNA-seq_Experiment_3_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589973/SRR9589973_1.fastq.gz -o SRR9589973_GSM3902488_RNA-seq_Experiment_5_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589973/SRR9589973_2.fastq.gz -o SRR9589973_GSM3902488_RNA-seq_Experiment_5_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589975/SRR9589975_1.fastq.gz -o SRR9589975_GSM3902490_RNA-seq_Experiment_2_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/005/SRR9589975/SRR9589975_2.fastq.gz -o SRR9589975_GSM3902490_RNA-seq_Experiment_2_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589972/SRR9589972_1.fastq.gz -o SRR9589972_GSM3902487_RNA-seq_Experiment_4_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589972/SRR9589972_2.fastq.gz -o SRR9589972_GSM3902487_RNA-seq_Experiment_4_-_Interferon-alpha_condition_2h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589978/SRR9589978_1.fastq.gz -o SRR9589978_GSM3902493_RNA-seq_Experiment_5_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/008/SRR9589978/SRR9589978_2.fastq.gz -o SRR9589978_GSM3902493_RNA-seq_Experiment_5_-_Interferon-alpha_condition_8h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589979/SRR9589979_1.fastq.gz -o SRR9589979_GSM3902494_RNA-seq_Experiment_1_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/009/SRR9589979/SRR9589979_2.fastq.gz -o SRR9589979_GSM3902494_RNA-seq_Experiment_1_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589980/SRR9589980_1.fastq.gz -o SRR9589980_GSM3902495_RNA-seq_Experiment_2_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/000/SRR9589980/SRR9589980_2.fastq.gz -o SRR9589980_GSM3902495_RNA-seq_Experiment_2_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589982/SRR9589982_1.fastq.gz -o SRR9589982_GSM3902497_RNA-seq_Experiment_4_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/002/SRR9589982/SRR9589982_2.fastq.gz -o SRR9589982_GSM3902497_RNA-seq_Experiment_4_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589981/SRR9589981_1.fastq.gz -o SRR9589981_GSM3902496_RNA-seq_Experiment_3_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/001/SRR9589981/SRR9589981_2.fastq.gz -o SRR9589981_GSM3902496_RNA-seq_Experiment_3_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589983/SRR9589983_1.fastq.gz -o SRR9589983_GSM3902498_RNA-seq_Experiment_5_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR958/003/SRR9589983/SRR9589983_2.fastq.gz -o SRR9589983_GSM3902498_RNA-seq_Experiment_5_-_Interferon-alpha_condition_24h_Homo_sapiens_RNA-Seq_2.fastq.gz
