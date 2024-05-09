#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=het
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=48G

rm *het_Z.recode.vcf
rm *het_4A.recode.vcf

grep "^#CHROM" cossypha_het_25.recode.vcf > cossypha.vcf

for i in $( ls cossypha_het_*.recode.vcf ); do grep -v "^#" $i >> cossypha.vcf; done


grep "^#CHROM" cristrio_het_25.recode.vcf > cristrio.vcf

for i in $( ls cristrio_het_*.recode.vcf ); do grep -v "^#" $i >> cristrio.vcf; done


grep "^#CHROM" critrist_het_25.recode.vcf > critrist.vcf

for i in $( ls critrist_het_*.recode.vcf ); do grep -v "^#" $i >> critrist.vcf; done


grep "^#CHROM" melaenornis_het_25.recode.vcf > melaenornis.vcf

for i in $( ls melaenornis_het_*.recode.vcf ); do grep -v "^#" $i >> melaenornis.vcf; done


grep "^#CHROM" nectarinia_het_25.recode.vcf > nectarinia.vcf

for i in $( ls nectarinia_het_*.recode.vcf ); do grep -v "^#" $i >> nectarinia.vcf; done


grep "^#CHROM" sylvia_het_25.recode.vcf > sylvia.vcf

for i in $( ls sylvia_het_*.recode.vcf ); do grep -v "^#" $i >> sylvia.vcf; done


grep "^#CHROM" turdus_het_25.recode.vcf > turdus.vcf

for i in $( ls turdus_het_*.recode.vcf ); do grep -v "^#" $i >> turdus.vcf; done


grep "^#CHROM" zosterops_het_25.recode.vcf > zosterops.vcf

for i in $( ls zosterops_het_*.recode.vcf ); do grep -v "^#" $i >> zosterops.vcf; done

