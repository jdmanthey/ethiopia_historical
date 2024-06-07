# ethiopia_historical

Collection of scripts to analyze a set of historical and modern genomic sequencing datasets from eight species of Ethiopian highland birds. 



00_setup.sh – Reference genome info, indexing the reference, and setting up directory structure.

01_split_hist_samples.sh – Splits up historical fastq files for parallelized processing.

02_dedup1_hist.sh – Remove duplicates (round 1) from split historical fastq files.

03_cat_hist.sh – Concatenate the output of the previous step for each individual.

04_dedup2_h.sh – Remove duplicates (round 2) from the concatenated fastq files for each individual.

05_merge_hist.sh – Adapter trimming and merging pairs of reads that had small insert sizes.

06_qualtrim_hist.sh – Quality trimming and removal of low complexity reads. 

07_align_hist.sh – Align the historical fastq sequences to the reference genome, process the alignment file, and run mapdamage to correct quality scores in bam files.

08_align_modern.sh – Align the modern fastq sequences to the reference genome and process the sam/bam files.

09_genotype.sh – Genotype with bcftools.

10_merge.sh – Merge the vcf files.

11_filter_vcf.sh – Filter the vcf files for downstream analyses (3 datasets per species).

12_pca.sh – Run PCA with plink for each species.

13_genetic_distances.r – Calculate genetic distances for use in SplitsTree.

14_IBD_calcs.r – Multiple regression of distance matrices and variance partitioning to assess how geographic distances, biogeographic barriers, and time have impacted genetic structure in each species.

15_run_snpeff.sh – Run SnpEff to estimate functional impacts of SNPs.

16_cat_snpeff_output.sh – Concatenate vcf files from SnpEff output and keep only variants that have low, moderate, or high impacts.

17_calc_tstv.sh – Calculate transition to transversion ratios for each species. 

18_cat_het_files.sh – Concatenate vcf files for heterozygosity calculations.

19_calculate_coverage.sh – Measure depth of sequencing coverage from alignments.

20_count_genotypes_for_het.sh – Count the numbers of different genotypes for each individual for calculating observed heterozygosity.

21_rohan.sh – Estimating runs of homozygosity.

