#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=snpeff
#SBATCH --nodes=1 --ntasks=2
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-30

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

# define input files from helper file during genotyping
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/cossypha_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/cossypha_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/cossypha_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/cossypha_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/cristrio_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/cristrio_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/cristrio_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/cristrio_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/critrist_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/critrist_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/critrist_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/critrist_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/melaenornis_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/melaenornis_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/melaenornis_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/melaenornis_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/nectarinia_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/nectarinia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/nectarinia_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/nectarinia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/sylvia_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/sylvia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/sylvia_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/sylvia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/turdus_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/turdus_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/turdus_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/turdus_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadb/zosterops_load_${region_array}.recode.vcf > \
${workdir}/10_loadb/zosterops_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadb/zosterops_load_${region_array}.ann.vcf \
> ${workdir}/10_loadb/zosterops_load_${region_array}.ann2.vcf






# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/cossypha_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/cossypha_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/cossypha_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/cossypha_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/cristrio_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/cristrio_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/cristrio_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/cristrio_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/critrist_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/critrist_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/critrist_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/critrist_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/melaenornis_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/melaenornis_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/melaenornis_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/melaenornis_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/nectarinia_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/nectarinia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/nectarinia_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/nectarinia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/sylvia_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/sylvia_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/sylvia_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/sylvia_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/turdus_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/turdus_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/turdus_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/turdus_load_${region_array}.ann2.vcf


# run snpEff for this chromosome for this species
java -Xmx16g -jar ~/snpEff/snpEff.jar FicAlb1.5.105 \
${workdir}/10_loadc/zosterops_load_${region_array}.recode.vcf > \
${workdir}/10_loadc/zosterops_load_${region_array}.ann.vcf

# keep only changes with low, moderate, or high impact
grep '|LOW|\||MODERATE|\||HIGH|' ${workdir}/10_loadc/zosterops_load_${region_array}.ann.vcf \
> ${workdir}/10_loadc/zosterops_load_${region_array}.ann2.vcf

