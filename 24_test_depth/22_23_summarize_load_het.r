options(scipen=999)

##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("cossypha_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("cristrio_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("critrist_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("melaenornis_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("nectarinia_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("sylvia_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("turdus_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("zosterops_b.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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

# read in previous output from initial runs
x <- read.table("_ind_stats_load_het.txt", header=T)

# check that table and output have same order, if not, reorder
table(total_output$id == x$id)
# all TRUE


# rename output colnames
colnames(total_output) <- c("id", "potential_load_10", "realized_load_10")

# add output to table
x <- cbind(x, total_output[,2:3])







##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
snpeff <- read.table("cossypha_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("cristrio_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("critrist_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("melaenornis_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("nectarinia_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("sylvia_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("turdus_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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
snpeff <- read.table("zosterops_c.vcf", sep="\t", header=T, stringsAsFactors=F, comment.char="$")

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


# check that table and output have same order, if not, reorder
table(total_output$id == x$id)
# all TRUE


# rename output colnames
colnames(total_output) <- c("id", "potential_load_12", "realized_load_12")

# add output to table
x <- cbind(x, total_output[,2:3])



##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################

# diversity 10


# files to read 
x_files <- list.files(pattern="*het_b.txt")
for(a in 1:length(x_files)) {
	a_rep <- read.table(x_files[a], col.names=c("c1", "c2"), fill=T)
	if(a == 1) {
		het_file <- a_rep
	} else {
		het_file <- rbind(het_file, a_rep)
	}
}

# get het info for each individual
obs_het <- c()
for(a in 1:nrow(x)) {
	a_rep <- het_file[match(x$id[a], het_file[,1]):(match(x$id[a], het_file[,1]) + 4),]
	het_sites <- as.numeric(a_rep[a_rep[,2] == "0/1",1])
	total_sites <- as.numeric(a_rep[a_rep[,2] == "0/1",1]) + as.numeric(a_rep[a_rep[,2] == "1/1",1]) + as.numeric(a_rep[a_rep[,2] == "0/0",1])
	obs_het <- c(obs_het, het_sites / total_sites)
}

obs_het_10 <- obs_het

x <- cbind(x, obs_het_10)



# diversity 12


# files to read 
x_files <- list.files(pattern="*het_c.txt")
for(a in 1:length(x_files)) {
	a_rep <- read.table(x_files[a], col.names=c("c1", "c2"), fill=T)
	if(a == 1) {
		het_file <- a_rep
	} else {
		het_file <- rbind(het_file, a_rep)
	}
}

# get het info for each individual
obs_het <- c()
for(a in 1:nrow(x)) {
	a_rep <- het_file[match(x$id[a], het_file[,1]):(match(x$id[a], het_file[,1]) + 4),]
	het_sites <- as.numeric(a_rep[a_rep[,2] == "0/1",1])
	total_sites <- as.numeric(a_rep[a_rep[,2] == "0/1",1]) + as.numeric(a_rep[a_rep[,2] == "1/1",1]) + as.numeric(a_rep[a_rep[,2] == "0/0",1])
	obs_het <- c(obs_het, het_sites / total_sites)
}

obs_het_12 <- obs_het

x <- cbind(x, obs_het_12)




species <- sapply(strsplit(x$id, "__"), "[[", 1)
x <- cbind(x, species)

# write the output
write.table(x, file="_testing_coverage_diversity_load.txt", quote=F, sep="\t", row.names=F)





# plot the results
library(RColorBrewer)
cols <- brewer.pal(8,"Dark2")


species <- unique(x$species)

par(mfrow=c(2,3))
par(mar=c(5,5,1,1))
plot(x$obs_het, x$obs_het_10, pch=19, cex=0.1, col="white", xlab="Obs. Het. Base Dataset (MD = 8)", ylab="Obs. Het. (MD = 10)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$obs_het, a_rep$obs_het_10, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$obs_het, predict(lm(a_rep$obs_het_10 ~ a_rep$obs_het)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$obs_het_10 ~ a_rep$obs_het))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}

plot(x$potential_load, x$potential_load_10, pch=19, cex=0.1, col="white", xlab="Potential Load Base Dataset (MD = 8)", ylab="Potential Load (MD = 10)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$potential_load, a_rep$potential_load_10, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$potential_load, predict(lm(a_rep$potential_load_10 ~ a_rep$potential_load)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$potential_load_10 ~ a_rep$potential_load))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}

plot(x$realized_load, x$realized_load_10, pch=19, cex=0.1, col="white", xlab="Realized Load Base Dataset (MD = 8)", ylab="Realized Load (MD = 10)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$realized_load, a_rep$realized_load_10, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$realized_load, predict(lm(a_rep$realized_load_10 ~ a_rep$realized_load)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$realized_load_10 ~ a_rep$realized_load))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}

plot(x$obs_het, x$obs_het_12, pch=19, cex=0.1, col="white", xlab="Obs. Het. Base Dataset (MD = 8)", ylab="Obs. Het. (MD = 12)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$obs_het, a_rep$obs_het_12, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$obs_het, predict(lm(a_rep$obs_het_12 ~ a_rep$obs_het)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$obs_het_12 ~ a_rep$obs_het))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}

plot(x$potential_load, x$potential_load_12, pch=19, cex=0.1, col="white", xlab="Potential Load Base Dataset (MD = 8)", ylab="Potential Load (MD = 12)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$potential_load, a_rep$potential_load_12, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$potential_load, predict(lm(a_rep$potential_load_12 ~ a_rep$potential_load)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$potential_load_12 ~ a_rep$potential_load))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}

plot(x$realized_load, x$realized_load_12, pch=19, cex=0.1, col="white", xlab="Realized Load Base Dataset (MD = 8)", ylab="Realized Load (MD = 12)")
abline(a=0,b=1, lwd=0.5, lty=2, col="darkgray")
for(a in 1:length(species)) {
	a_rep <- x[x$species == species[a],]
	points(a_rep$realized_load, a_rep$realized_load_12, pch=19, cex=0.6, col=cols[a])
	lines(a_rep$realized_load, predict(lm(a_rep$realized_load_12 ~ a_rep$realized_load)), col=cols[a])
	writeLines(species[a])
	a_sum <- summary(lm(a_rep$realized_load_12 ~ a_rep$realized_load))
	writeLines(paste0("p = ", a_sum$coefficients[2,4]))
}









