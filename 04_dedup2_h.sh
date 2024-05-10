#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=dedup
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=4
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=48G
#SBATCH --array=1-51

source activate hist_filter

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/basenames_historical.txt | tail -n1 )

# remove duplicates
hts_SuperDeduper -1 ${workdir}/01_working_h/${basename_array}_R1.fastq.gz \
-2 ${workdir}/01_working_h/${basename_array}_R2.fastq.gz \
-L ${basename_array}_dedup.stats -f ${workdir}/01_working_h/${basename_array}_dedup
