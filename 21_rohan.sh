#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=rohan
#SBATCH --nodes=1 --ntasks=6
#SBATCH --partition nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-108

# define input files from helper file during genotyping
input_array=$( head -n${SLURM_ARRAY_TASK_ID} rohan_helper.txt | tail -n1 | cut -f1 )
tstv_array=$( head -n${SLURM_ARRAY_TASK_ID} rohan_helper.txt | tail -n1 | cut -f2 )

# define main working directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical

source activate rohan

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/jmanthey/anaconda3/envs/rohan/lib/

/lustre/work/jmanthey/rohan/src/rohan --tstv ${tstv_array} --size 100000 \
--rohmu 1e-05 --cov 6,200 --auto chromosomes.txt -t 6 \
-o ${workdir}/09_roh/${input_array}_roh \
/home/jmanthey/references/Ficedula_albicollis.FicAlb1.5.dna.toplevel.fa \
${workdir}/01_bam_files/${input_array}_final.bam


