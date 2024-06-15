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

# max missing = two individuals for load; only biallelic sites
vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/cossypha_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/cristrio_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/critrist_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/melaenornis_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/nectarinia_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/sylvia_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/turdus_load_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadb/zosterops_load_${region_array}


# max missing = two individuals for load; only biallelic sites
vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/cossypha_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/cristrio_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/critrist_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/melaenornis_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/nectarinia_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/sylvia_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/turdus_load_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --mac 2 --recode --recode-INFO-all \
--out ${workdir}/10_loadc/zosterops_load_${region_array}


# max missing = two individuals for heterozygosity; keep invariant
vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/cossypha_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/cristrio_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/critrist_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/melaenornis_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/nectarinia_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/sylvia_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/turdus_het_${region_array}

vcftools --vcf ${workdir}/04_vcfc/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetc/zosterops_het_${region_array}



# max missing = two individuals for heterozygosity; keep invariant
vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep cossypha.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/cossypha_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep cristrio.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/cristrio_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep critrist.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/critrist_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep melaenornis.txt \
--max-missing 0.83 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/melaenornis_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep nectarinia.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/nectarinia_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep sylvia.txt \
--max-missing 0.80 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/sylvia_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep turdus.txt \
--max-missing 0.87 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/turdus_het_${region_array}

vcftools --vcf ${workdir}/04_vcfb/${region_array}.vcf --keep zosterops.txt \
--max-missing 0.85 --max-alleles 2 --max-maf 0.49 --recode --recode-INFO-all \
--out ${workdir}/08_hetb/zosterops_het_${region_array}

