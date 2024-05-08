grep "^#C" cossypha_load_24.ann.vcf > cossypha.vcf

for i in $( ls cossypha_load_*.ann2.vcf ); do grep -v "^#" $i >> cossypha.vcf; done


grep "^#C" cristrio_load_24.ann.vcf > cristrio.vcf

for i in $( ls cristrio_load_*.ann2.vcf ); do grep -v "^#" $i >> cristrio.vcf; done


grep "^#C" critrist_load_24.ann.vcf > critrist.vcf

for i in $( ls critrist_load_*.ann2.vcf ); do grep -v "^#" $i >> critrist.vcf; done


grep "^#C" melaenornis_load_24.ann.vcf > melaenornis.vcf

for i in $( ls melaenornis_load_*.ann2.vcf ); do grep -v "^#" $i >> melaenornis.vcf; done


grep "^#C" nectarinia_load_24.ann.vcf > nectarinia.vcf

for i in $( ls nectarinia_load_*.ann2.vcf ); do grep -v "^#" $i >> nectarinia.vcf; done


grep "^#C" sylvia_load_24.ann.vcf > sylvia.vcf

for i in $( ls sylvia_load_*.ann2.vcf ); do grep -v "^#" $i >> sylvia.vcf; done


grep "^#C" turdus_load_24.ann.vcf > turdus.vcf

for i in $( ls turdus_load_*.ann2.vcf ); do grep -v "^#" $i >> turdus.vcf; done


grep "^#C" zosterops_load_24.ann.vcf > zosterops.vcf

for i in $( ls zosterops_load_*.ann2.vcf ); do grep -v "^#" $i >> zosterops.vcf; done

