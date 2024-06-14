options(scipen=999)

popmap <- read.table("popmap_pca.txt", header=T)

##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("cossypha.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- output




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("cristrio.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("critrist.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("melaenornis.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("nectarinia.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("sylvia.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("turdus.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("zosterops.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

# keep impact of variants
impact <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 3)
table(impact)
type_mutation <- sapply(strsplit(snpeff[,8], "\\|"), "[[", 2)

# keep only the raw genotype data
for(a in 10:ncol(snpeff)) { snpeff[,a] <- substr(snpeff[,a], 1, 3) }
# genotypes 
genotypes <- snpeff[,10:ncol(snpeff)]

# potential load
potential_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with potential impact in individual
	a_potential <- length(a_impact[a_impact == "HIGH" | a_impact == "MODERATE"]) / length(a_impact)
	potential_load <- c(potential_load, a_potential)
}


# realized load
realized_load <- c()
for(a in 1:ncol(genotypes)) {
	keep <- genotypes[,a] != "./."
	a_genotypes <- genotypes[keep,a]
	a_impact <- impact[keep]
	
	# keep only non-reference
	a_impact <- a_impact[a_genotypes != "0/0"]
	a_genotypes <- a_genotypes[a_genotypes != "0/0"]
	
	# snps with homozygous derived missense or nonsense
	a_genotypes <- a_genotypes[a_impact != "LOW"]
	a_impact <- a_impact[a_impact != "LOW"]
	
	# realized load
	a_realized <- length(a_genotypes[a_genotypes == "1/1"]) / length(a_impact)
	
	realized_load <- c(realized_load, a_realized)
}

output <- data.frame(id=as.character(colnames(genotypes)), potential_load=as.numeric(potential_load), realized_load=as.numeric(realized_load))

total_output <- rbind(total_output, output)




##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################

# check that popmap and output have same order, if not, reorder
table(total_output$id == popmap$id)
# all TRUE

# add output to popmap
popmap <- cbind(popmap, total_output[,2:3])

# write output table
write.table(popmap, file="_ind_stats_load.txt", quote=F, row.names=F, col.names=T, sep="\t")



