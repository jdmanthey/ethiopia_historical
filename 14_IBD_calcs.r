

library(vegan)
library(ecodist)
library(fossil)
options(scipen=999)

popmap <- read.table("popmap_MRM.txt", header=T)
popmap[,1] <- substr(popmap[,1], 1, nchar(popmap[,1]) - 1)
popmap[,1] <- paste0(substr(sapply(strsplit(popmap[,1], "_"), "[[", 1), 1, 1), "_",
	substr(sapply(strsplit(popmap[,1], "_"), "[[", 2), 1, 1), "_",
	substr(sapply(strsplit(popmap[,1], "__"), "[[", 2), 1, nchar(sapply(strsplit(popmap[,1], "__"), "[[", 2))))

#########################################################
#########################################################
#########################################################
#cossypha
#########################################################
#########################################################
#########################################################
dist_table <- read.table("cossypha_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)



#########################################################
#########################################################
#########################################################
#crithagra striolata
#########################################################
#########################################################
#########################################################
dist_table <- read.table("cristrio_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)




#########################################################
#########################################################
#########################################################
#crithagra tristriata
#########################################################
#########################################################
#########################################################
dist_table <- read.table("critrist_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)




#########################################################
#########################################################
#########################################################
# melaenornis
#########################################################
#########################################################
#########################################################
dist_table <- read.table("melaenornis_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)



#########################################################
#########################################################
#########################################################
# nectarinia
#########################################################
#########################################################
#########################################################
dist_table <- read.table("nectarinia_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)




#########################################################
#########################################################
#########################################################
# sylvia
#########################################################
#########################################################
#########################################################
dist_table <- read.table("sylvia_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)



#########################################################
#########################################################
#########################################################
# turdus
#########################################################
#########################################################
#########################################################
dist_table <- read.table("turdus_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)





#########################################################
#########################################################
#########################################################
# zosterops
#########################################################
#########################################################
#########################################################
dist_table <- read.table("zosterops_distmat.phy", header=F, skip=1, row.names=1)
colnames(dist_table) <- rownames(dist_table)

ind1 <- c()
ind2 <- c()
gen_dist <- c()
geo_dist <- c()
biogeo <- c()
time <- c()
# loop for each row in the distance matrix
for(a in 1:(nrow(dist_table) - 1)) {
	a_rep <- dist_table[(a+1):nrow(dist_table),a]
	a_ind1 <- rep(rownames(dist_table)[a], length(a_rep))
	a_ind2 <- colnames(dist_table)[(a+1):nrow(dist_table)]
	
	# loop for each comparison
	for(b in 1:length(a_ind1)) {
		b_ind1 <- popmap[popmap[,1] %in% a_ind1[b],]
		b_ind2 <- popmap[popmap[,1] %in% a_ind2[b],]
		ind1 <- c(ind1, b_ind1$id)
		ind2 <- c(ind2, b_ind2$id)
		# genetic distance
		gen_dist <- c(gen_dist, a_rep[b])
		
		# geographic distance
		# long1, lat1, long2, lat2
		geo_dist <- c(geo_dist, deg.dist(b_ind1$long, b_ind1$lat, b_ind2$long, b_ind2$lat))
		
		# temporal
		if(popmap[popmap[,1] %in% b_ind1, 3] == popmap[popmap[,1] %in% b_ind2, 3]) {
			time <- c(time, 0)
		} else {
			time <- c(time, 1)
		}
		
		# biogeographic barriers
		if(b_ind1$geography == "choke" & b_ind1$geography == "choke") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "choke" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "central" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 0)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "choke") {
			biogeo <- c(biogeo, 2)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "central") {
			biogeo <- c(biogeo, 1)
		} else if (b_ind1$geography == "east" & b_ind2$geography == "east") {
			biogeo <- c(biogeo, 0)
		}
	}
}
output <- data.frame(ind1=as.character(ind1), ind2=as.character(ind2), gen_dist=as.numeric(gen_dist), 
geo_dist=as.numeric(geo_dist), biogeo=as.numeric(biogeo), time=as.numeric(time))

output_mod <- MRM(output$gen_dist ~ output$geo_dist + output$biogeo + output$time, nperm=100000)
output_mod

varpart_mod <- varpart(output$gen_dist, output$geo_dist, output$biogeo, output$time)
varpart_mod
plot(varpart_mod)







par(mar=c(5,6,1,1))

# make barplots
variance_partition <- read.table("varpart.txt", header=T)
barplot(height=rev(as.numeric(variance_partition[1,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[2,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[3,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[4,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[5,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[6,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[7,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))
barplot(height=rev(as.numeric(variance_partition[8,2:7])), names=rev(colnames(variance_partition)[2:7]), horiz=T, las=1, xlim=c(0,0.55))

















