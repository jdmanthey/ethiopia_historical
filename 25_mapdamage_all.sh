#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=mapdamage
#SBATCH --partition nocona
#SBATCH --nodes=1 --ntasks=4
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-108

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/basenames.txt | tail -n1 )

# define the reference genome
refgenome=/home/jmanthey/references/Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa

source activate mapdamage

module load  gcc/10.1.0 gsl/2.7 r/4.3.0

# make mapdamage output directory
mkdir ${workdir}/01_bam_files/mapdamage_${basename_array}

# run mapdamage to rescale bam based on damage estimates
mapDamage -i ${workdir}/01_bam_files/${basename_array}_final.bam -r ${refgenome} \
-d ${workdir}/01_bam_files/mapdamage_${basename_array} --merge-reference-sequences 
