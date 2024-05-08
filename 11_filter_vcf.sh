#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-30

source activate bcftools

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

# define variables
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )

# max missing = none for PCA and SplitsTree
vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/cossypha_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/cristrio_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/critrist_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/melaenornis_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/nectarinia_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/sylvia_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/turdus_pca_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 1.0 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 \
--recode --recode-INFO-all --out ${workdir}/05_filtered_vcf/zosterops_pca_${region_array}


# max missing = two individuals for load; only biallelic sites
vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/cossypha_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.84 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/cristrio_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/critrist_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/melaenornis_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/nectarinia_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/sylvia_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/turdus_load_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_load/zosterops_load_${region_array}


# max missing = two individuals for heterozygosity; keep invariant
vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/cossypha_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.84 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/cristrio_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/critrist_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/melaenornis_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/nectarinia_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/sylvia_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/turdus_het_${region_array}

vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_het/zosterops_het_${region_array}


