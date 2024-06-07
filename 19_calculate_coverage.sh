#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=bam
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-109

source activate bcftools

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/basenames.txt | tail -n1 )

outname=${basename_array}coverage.txt

# samtools depth sum of aligned sites
samtools depth ${workdir}/01_bam_files/${basename_array}_final.bam  |  awk '{sum+=$3} END { print "Sum = ",sum}' > $outname

# samtools depth mean of all sites
samtools depth -a ${workdir}/01_bam_files/${basename_array}_final.bam  |  awk '{sum+=$3} END { print "Average = ",sum/NR}' >> $outname


