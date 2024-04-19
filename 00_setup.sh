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
mkdir 01_split_h
mkdir 01_working_h
mkdir 01_cleaned_h
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
# all the following directories are locations to run jobs and keep logs
mkdir 20_split_h_script
mkdir 21_dedup_h_script
mkdir 22_cat_h_script
mkdir 23_dedup2_h_script
mkdir 24_merge_h_script
mkdir 25_qual_h_script
mkdir 26_align_script_h
mkdir 27_align_script_m
mkdir 28_genotype_script
mkdir 29_merge_script
mkdir 30_filter_script
