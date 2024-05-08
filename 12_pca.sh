source activate bcftools

cd /lustre/scratch/jmanthey/11_ethiopia_historical/05_filtered_vcf

# remove sex chromosome and neo sex chromosome (4A in a couple species)
rm *pca_Z.recode.vcf
rm *pca_4A.recode.vcf


grep "#" cossypha_pca_25.recode.vcf > ../06_pca/cossypha.vcf

for i in $( ls cossypha_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/cossypha.vcf; done


grep "#" cristrio_pca_25.recode.vcf > ../06_pca/cristrio.vcf

for i in $( ls cristrio_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/cristrio.vcf; done


grep "#" critrist_pca_25.recode.vcf > ../06_pca/critrist.vcf

for i in $( ls critrist_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/critrist.vcf; done


grep "#" melaenornis_pca_25.recode.vcf > ../06_pca/melaenornis.vcf

for i in $( ls melaenornis_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/melaenornis.vcf; done


grep "#" nectarinia_pca_25.recode.vcf > ../06_pca/nectarinia.vcf

for i in $( ls nectarinia_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/nectarinia.vcf; done


grep "#" sylvia_pca_25.recode.vcf > ../06_pca/sylvia.vcf

for i in $( ls sylvia_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/sylvia.vcf; done


grep "#" turdus_pca_25.recode.vcf > ../06_pca/turdus.vcf

for i in $( ls turdus_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/turdus.vcf; done


grep "#" zosterops_pca_25.recode.vcf > ../06_pca/zosterops.vcf

for i in $( ls zosterops_pca_*.recode.vcf ); do grep -v "^#" $i >> ../06_pca/zosterops.vcf; done



# thin for 5 kbp separation between SNPs

cd /lustre/scratch/jmanthey/11_ethiopia_historical/06_pca



vcftools --vcf cossypha.vcf --thin 5000 --recode --recode-INFO-all --out cossypha

vcftools --vcf cristrio.vcf --thin 5000 --recode --recode-INFO-all --out cristrio

vcftools --vcf critrist.vcf --thin 5000 --recode --recode-INFO-all --out critrist

vcftools --vcf melaenornis.vcf --thin 5000 --recode --recode-INFO-all --out melaenornis

vcftools --vcf nectarinia.vcf --thin 5000 --recode --recode-INFO-all --out nectarinia

vcftools --vcf sylvia.vcf --thin 5000 --recode --recode-INFO-all --out sylvia

vcftools --vcf turdus.vcf --thin 5000 --recode --recode-INFO-all --out turdus

vcftools --vcf zosterops.vcf --thin 5000 --recode --recode-INFO-all --out zosterops




# move to directory
workdir=/lustre/scratch/jmanthey/11_ethiopia_historical
cd ${workdir}/06_pca


# modify the file for compatibility with plink
grep "^#" cossypha.recode.vcf >> cossypha2.vcf
grep -v "^#" cossypha.recode.vcf | awk '$0="scaffold_"$0' >> cossypha2.vcf

# make chromosome map for this vcf
grep -v "#" cossypha2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf cossypha2.vcf  --plink --chrom-map chrom_map.txt --out cossypha 

# convert  with plink
plink --file ${workdir}/06_pca/cossypha --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/cossypha_plink

# run pca on dataset
plink --file ${workdir}/06_pca/cossypha_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/cossypha_plink_pca




# modify the file for compatibility with plink
grep "^#" cristrio.recode.vcf >> cristrio2.vcf
grep -v "^#" cristrio.recode.vcf | awk '$0="scaffold_"$0' >> cristrio2.vcf

# make chromosome map for this vcf
grep -v "#" cristrio2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf cristrio2.vcf  --plink --chrom-map chrom_map.txt --out cristrio 

# convert  with plink
plink --file ${workdir}/06_pca/cristrio --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/cristrio_plink

# run pca on dataset
plink --file ${workdir}/06_pca/cristrio_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/cristrio_plink_pca




# modify the file for compatibility with plink
grep "^#" critrist.recode.vcf >> critrist2.vcf
grep -v "^#" critrist.recode.vcf | awk '$0="scaffold_"$0' >> critrist2.vcf

# make chromosome map for this vcf
grep -v "#" critrist2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf critrist2.vcf  --plink --chrom-map chrom_map.txt --out critrist 

# convert  with plink
plink --file ${workdir}/06_pca/critrist --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/critrist_plink

# run pca on dataset
plink --file ${workdir}/06_pca/critrist_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/critrist_plink_pca





# modify the file for compatibility with plink
grep "^#" melaenornis.recode.vcf >> melaenornis2.vcf
grep -v "^#" melaenornis.recode.vcf | awk '$0="scaffold_"$0' >> melaenornis2.vcf

# make chromosome map for this vcf
grep -v "#" melaenornis2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf melaenornis2.vcf  --plink --chrom-map chrom_map.txt --out melaenornis 

# convert  with plink
plink --file ${workdir}/06_pca/melaenornis --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/melaenornis_plink

# run pca on dataset
plink --file ${workdir}/06_pca/melaenornis_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/melaenornis_plink_pca




# modify the file for compatibility with plink
grep "^#" nectarinia.recode.vcf >> nectarinia2.vcf
grep -v "^#" nectarinia.recode.vcf | awk '$0="scaffold_"$0' >> nectarinia2.vcf

# make chromosome map for this vcf
grep -v "#" nectarinia2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf nectarinia2.vcf  --plink --chrom-map chrom_map.txt --out nectarinia 

# convert  with plink
plink --file ${workdir}/06_pca/nectarinia --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/nectarinia_plink

# run pca on dataset
plink --file ${workdir}/06_pca/nectarinia_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/nectarinia_plink_pca




# modify the file for compatibility with plink
grep "^#" sylvia.recode.vcf >> sylvia2.vcf
grep -v "^#" sylvia.recode.vcf | awk '$0="scaffold_"$0' >> sylvia2.vcf

# make chromosome map for this vcf
grep -v "#" sylvia2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf sylvia2.vcf  --plink --chrom-map chrom_map.txt --out sylvia 

# convert  with plink
plink --file ${workdir}/06_pca/sylvia --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/sylvia_plink

# run pca on dataset
plink --file ${workdir}/06_pca/sylvia_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/sylvia_plink_pca




# modify the file for compatibility with plink
grep "^#" turdus.recode.vcf >> turdus2.vcf
grep -v "^#" turdus.recode.vcf | awk '$0="scaffold_"$0' >> turdus2.vcf

# make chromosome map for this vcf
grep -v "#" turdus2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf turdus2.vcf  --plink --chrom-map chrom_map.txt --out turdus 

# convert  with plink
plink --file ${workdir}/06_pca/turdus --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/turdus_plink

# run pca on dataset
plink --file ${workdir}/06_pca/turdus_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/turdus_plink_pca




# modify the file for compatibility with plink
grep "^#" zosterops.recode.vcf >> zosterops2.vcf
grep -v "^#" zosterops.recode.vcf | awk '$0="scaffold_"$0' >> zosterops2.vcf

# make chromosome map for this vcf
grep -v "#" zosterops2.vcf | cut -f 1 | uniq | awk '{print $0"\t"$0}' > chrom_map.txt

#plink output format
vcftools --vcf zosterops2.vcf  --plink --chrom-map chrom_map.txt --out zosterops 

# convert  with plink
plink --file ${workdir}/06_pca/zosterops --recode12 --allow-extra-chr \
--out ${workdir}/06_pca/zosterops_plink

# run pca on dataset
plink --file ${workdir}/06_pca/zosterops_plink --pca --allow-extra-chr \
--out ${workdir}/06_pca/zosterops_plink_pca


