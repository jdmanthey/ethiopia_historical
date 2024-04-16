# reference genome from here:
https://ftp.ensembl.org/pub/release-105/fasta/ficedula_albicollis/dna/
# chose this reference because of its compatibility with snpeff

# index reference

source activate bcftools

bwa-mem2 index Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa

java -jar picard.jar CreateSequenceDictionary R=/home/jmanthey/references/Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa O=/home/jmanthey/references/Ficedula_albicollis.FicAlb1.5.dna.toplevel.dict

samtools faidx Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa

# set up directory structure
mkdir 00_fastq_m
mkdir 00_fastq_h
mkdir 01_cleaned_m
mkdir 01_bam_files
mkdir 02_vcf
mkdir 03_vcf
mkdir 03_contam
mkdir 04_vcf
mkdir 05_filtered_vcf
mkdir 06_pca
mkdir 07_splitstree
mkdir 08_het
mkdir 09_roh
mkdir 10_load
mkdir 20_align_script_m
mkdir 21_genotype_script
mkdir 22_filter_script
