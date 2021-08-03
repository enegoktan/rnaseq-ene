module load slurm-interactive #load module
fisbatch_screen --ntasks 8 --time 10:0:0

#mkdir /rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/human_genome # create folder

# change directory to a directory where yu want to save the genome.
# make a separate folder for this as you need to give it as input for STAR

cd /rds/projects/t/thomaspz-fa-rna-seq/Ene/scripts_and_manuals/scripts/Additional_files/human_genome

# download primary assembly
wget http://ftp.ensembl.org/pub/release-104/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa.gz

# download annotation
wget http://ftp.ensembl.org/pub/release-104/gtf/homo_sapiens/Homo_sapiens.GRCh38.104.gtf.gz

gzip -d Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa.gz #unzip
gzip -d Homo_sapiens.GRCh38.104.gtf.gz
