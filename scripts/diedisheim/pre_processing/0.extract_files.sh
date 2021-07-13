#!/bin/bash
#SBATCH --ntasks 1
#SBATCH --time 05:00:0
#SBATCH -e /rds/projects/t/thomaspz-fa-rna-seq/Ene/project/outputs/extract.err.txt
#SBATCH --qos bbdefault
#SBATCH --mail-type ALL

set -e

module purge; module load bluebear

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/project/diedisheim

#!/usr/bin/env bash
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998593/SRR5998593_1.fastq.gz -o SRR5998593_GSM2769688_Ctrl_4h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998593/SRR5998593_2.fastq.gz -o SRR5998593_GSM2769688_Ctrl_4h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998588/SRR5998588_1.fastq.gz -o SRR5998588_GSM2769683_Ctrl_0h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998588/SRR5998588_2.fastq.gz -o SRR5998588_GSM2769683_Ctrl_0h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998589/SRR5998589_1.fastq.gz -o SRR5998589_GSM2769684_Ctrl_0h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998589/SRR5998589_2.fastq.gz -o SRR5998589_GSM2769684_Ctrl_0h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998590/SRR5998590_1.fastq.gz -o SRR5998590_GSM2769685_Ctrl_0h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998590/SRR5998590_2.fastq.gz -o SRR5998590_GSM2769685_Ctrl_0h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998592/SRR5998592_1.fastq.gz -o SRR5998592_GSM2769687_Ctrl_4h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998592/SRR5998592_2.fastq.gz -o SRR5998592_GSM2769687_Ctrl_4h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998591/SRR5998591_1.fastq.gz -o SRR5998591_GSM2769686_Ctrl_4h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998591/SRR5998591_2.fastq.gz -o SRR5998591_GSM2769686_Ctrl_4h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/007/SRR5998597/SRR5998597_1.fastq.gz -o SRR5998597_GSM2769692_Ctrl_24h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/007/SRR5998597/SRR5998597_2.fastq.gz -o SRR5998597_GSM2769692_Ctrl_24h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998594/SRR5998594_1.fastq.gz -o SRR5998594_GSM2769689_FGF2_4h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998594/SRR5998594_2.fastq.gz -o SRR5998594_GSM2769689_FGF2_4h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998600/SRR5998600_1.fastq.gz -o SRR5998600_GSM2769695_FGF2_24h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998600/SRR5998600_2.fastq.gz -o SRR5998600_GSM2769695_FGF2_24h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/005/SRR5998595/SRR5998595_1.fastq.gz -o SRR5998595_GSM2769690_FGF2_4h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/005/SRR5998595/SRR5998595_2.fastq.gz -o SRR5998595_GSM2769690_FGF2_4h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998599/SRR5998599_1.fastq.gz -o SRR5998599_GSM2769694_Ctrl_24h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998599/SRR5998599_2.fastq.gz -o SRR5998599_GSM2769694_Ctrl_24h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998598/SRR5998598_1.fastq.gz -o SRR5998598_GSM2769693_Ctrl_24h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998598/SRR5998598_2.fastq.gz -o SRR5998598_GSM2769693_Ctrl_24h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/006/SRR5998596/SRR5998596_1.fastq.gz -o SRR5998596_GSM2769691_FGF2_4h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/006/SRR5998596/SRR5998596_2.fastq.gz -o SRR5998596_GSM2769691_FGF2_4h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998603/SRR5998603_1.fastq.gz -o SRR5998603_GSM2769698_Ctrl_72h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998603/SRR5998603_2.fastq.gz -o SRR5998603_GSM2769698_Ctrl_72h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998601/SRR5998601_1.fastq.gz -o SRR5998601_GSM2769696_FGF2_24h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998601/SRR5998601_2.fastq.gz -o SRR5998601_GSM2769696_FGF2_24h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998604/SRR5998604_1.fastq.gz -o SRR5998604_GSM2769699_Ctrl_72h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998604/SRR5998604_2.fastq.gz -o SRR5998604_GSM2769699_Ctrl_72h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998602/SRR5998602_1.fastq.gz -o SRR5998602_GSM2769697_FGF2_24h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998602/SRR5998602_2.fastq.gz -o SRR5998602_GSM2769697_FGF2_24h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/005/SRR5998605/SRR5998605_1.fastq.gz -o SRR5998605_GSM2769700_Ctrl_72h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/005/SRR5998605/SRR5998605_2.fastq.gz -o SRR5998605_GSM2769700_Ctrl_72h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998610/SRR5998610_1.fastq.gz -o SRR5998610_GSM2769705_Ctrl_144h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/000/SRR5998610/SRR5998610_2.fastq.gz -o SRR5998610_GSM2769705_Ctrl_144h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/006/SRR5998606/SRR5998606_1.fastq.gz -o SRR5998606_GSM2769701_FGF2_72h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/006/SRR5998606/SRR5998606_2.fastq.gz -o SRR5998606_GSM2769701_FGF2_72h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998608/SRR5998608_1.fastq.gz -o SRR5998608_GSM2769703_FGF2_72h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/008/SRR5998608/SRR5998608_2.fastq.gz -o SRR5998608_GSM2769703_FGF2_72h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/007/SRR5998607/SRR5998607_1.fastq.gz -o SRR5998607_GSM2769702_FGF2_72h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/007/SRR5998607/SRR5998607_2.fastq.gz -o SRR5998607_GSM2769702_FGF2_72h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998609/SRR5998609_1.fastq.gz -o SRR5998609_GSM2769704_Ctrl_144h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/009/SRR5998609/SRR5998609_2.fastq.gz -o SRR5998609_GSM2769704_Ctrl_144h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998612/SRR5998612_1.fastq.gz -o SRR5998612_GSM2769707_FGF2_144h_1_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/002/SRR5998612/SRR5998612_2.fastq.gz -o SRR5998612_GSM2769707_FGF2_144h_1_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998611/SRR5998611_1.fastq.gz -o SRR5998611_GSM2769706_Ctrl_144h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/001/SRR5998611/SRR5998611_2.fastq.gz -o SRR5998611_GSM2769706_Ctrl_144h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998614/SRR5998614_1.fastq.gz -o SRR5998614_GSM2769709_FGF2_144h_3_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/004/SRR5998614/SRR5998614_2.fastq.gz -o SRR5998614_GSM2769709_FGF2_144h_3_Homo_sapiens_RNA-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998613/SRR5998613_1.fastq.gz -o SRR5998613_GSM2769708_FGF2_144h_2_Homo_sapiens_RNA-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR599/003/SRR5998613/SRR5998613_2.fastq.gz -o SRR5998613_GSM2769708_FGF2_144h_2_Homo_sapiens_RNA-Seq_2.fastq.gz
