#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=genotype2
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=4
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-108

source activate bcftools

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/basenames.txt | tail -n1 )

# define the reference genome
refgenome=/home/jmanthey/references/Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa

# filter individual vcf files
bcftools view -i 'MIN(DP)>9' ${workdir}/02_vcf/${basename_array}.vcf.gz > ${workdir}/03_vcfb/${basename_array}.vcf

# bgzip
bgzip ${workdir}/03_vcfb/${basename_array}.vcf

#tabix
tabix ${workdir}/03_vcfb/${basename_array}.vcf.gz

# filter individual vcf files
bcftools view -i 'MIN(DP)>11' ${workdir}/02_vcf/${basename_array}.vcf.gz > ${workdir}/03_vcfc/${basename_array}.vcf

# bgzip
bgzip ${workdir}/03_vcfc/${basename_array}.vcf

#tabix
tabix ${workdir}/03_vcfc/${basename_array}.vcf.gz
