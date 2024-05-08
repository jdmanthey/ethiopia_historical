# calculate ts/tv 

source activate bcftools

cd /lustre/scratch/jmanthey/11_ethiopia_historical/06_pca

vcftools --vcf cossypha.vcf --TsTv-summary
# output: 2.45

vcftools --vcf cristrio.vcf --TsTv-summary
# output: 2.288

vcftools --vcf critrist.vcf --TsTv-summary
# output: 2.107

vcftools --vcf melaenornis.vcf --TsTv-summary
# output: 2.387

vcftools --vcf nectarinia.vcf --TsTv-summary
# output: 2.601

vcftools --vcf sylvia.vcf --TsTv-summary
# output: 2.297

vcftools --vcf turdus.vcf --TsTv-summary
# output: 2.619

vcftools --vcf zosterops.vcf --TsTv-summary
# output: 2.519


