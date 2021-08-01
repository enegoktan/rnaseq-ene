module load slurm-interactive #load module
fisbatch_screen --ntasks 8 --time 10:0:0

#mkdir  /rds/projects/v/vianaj-genomics-brain-development/MATRICS/reference_files/mouse_genome # create folder


# change directory to a directory where yu want to save the genome. Make a separate folder for this as you need to give it as input for STAR


wget http://ftp.ensembl.org/pub/release-104/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz # download directly from ensemble

gzip -d Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz #unzip
