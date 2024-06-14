options(scipen=999)

x <- read.table("_ind_stats_load.txt", header=T)


# files to read 
x_files <- list.files(pattern="*het.txt")
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

x <- cbind(x, obs_het)

write.table(x, "_ind_stats_load_het.txt", row.names=F, quote=F, sep="\t")



