library(ggplot2)
library(dplyr)

setwd("/Users/enegoktan/Desktop/scripts_and_manuals/scripts/differential_expression")

#import the normalised counts
#colli_normalised_counts <- read.csv("/Users/enegoktan/Desktop/data/colli_normalised_counts.csv", row.names = 1, check.names = FALSE)
#diedisheim_normalised_counts <- read.csv("/Users/enegoktan/Desktop/data/diedisheim_normalised_counts.csv", row.names = 1, check.names = FALSE)

###use global data, colli and diedesheim normalised counts first


##colli normalised counts

#bar plot for colli, first plot one gene against all samples
gene_3 <- colli_normalised_counts[3,]
barplot(gene_3, main = "ENSG00000000419 against samples" , las=2, col = "lightblue")

#histogram of all 
hist(log(colli_normalised_counts),
     main = "Distribution of Normalised Counts in Colli")

#average number of counts in the dataset, which is the median

#exclude the 0s, which are for no expression, sort the counts, find the median
sorted_colli_norm <- colli_normalised_counts
sorted_colli_norm[sorted_colli_norm == 0] <- NA
sorted_colli_norm <- sort(sorted_colli_norm)

colli_median <- median(sorted_colli_norm)

#add means to the counts table, include the 0s here
colli_mean_counts <- colli_normalised_counts
colli_mean_counts <- as.data.frame(colli_mean_counts)
colli_mean_counts$mean <- apply(colli_mean_counts, 1, mean)

#create a df with only gene name and mean
colli_gene_names <- row.names(colli_mean_counts)
colli_means <- colli_mean_counts$mean
colli_gene_mean = data.frame(gene=colli_gene_names, mean=colli_means)

#loop through all the means and compare it with median
#if mean larger than the median, write the name and the value
#else, write the name and keep the value as null
colli_temp_gene_name <- vector("list", nrow(colli_gene_mean))
colli_temp_gene_exp <- vector("list", nrow(colli_gene_mean))

i <- 1
for (x in colli_gene_mean[,2]) {
  if (x > colli_median) {
    colli_temp_gene_name[[i]] <- colli_gene_mean[i,1]
    colli_temp_gene_exp[[i]] <- colli_gene_mean[i,2]
    i <- i+1
  } else {
    colli_temp_gene_name[[i]] <- colli_gene_mean[i,1]
    i <- i+1
  }
}

#bind temp lists together
colli_processed_gene_mean <- cbind(colli_temp_gene_name, colli_temp_gene_exp)

#remove gene names for which the mean values are NA
colli_filtered_gene_mean <- colli_processed_gene_mean[!unlist(lapply(colli_processed_gene_mean[,2], is.null))]




##diedisheim normalised counts

#plot one gene in a bar plot
gene_3 <- diedisheim_normalised_counts[3,]
barplot(gene_3, main = "ENSG00000000419 against samples", las=2, col = "lightgreen")

#histogram for all genes and samples
hist(log(diedisheim_normalised_counts), main = "Distribution of Normalised Counts in Diedisheim")

#exclude 0 for no count, sort the counts, find the median
sorted_diedisheim_norm <- diedisheim_normalised_counts
sorted_diedisheim_norm[sorted_diedisheim_norm == 0] <- NA
sorted_diedisheim_norm <- sort(sorted_diedisheim_norm)

diedisheim_median <- median(sorted_diedisheim_norm)

#add mean of samples to the count table, including the 0 instead of NA
diedisheim_mean_counts <- diedisheim_normalised_counts
diedisheim_mean_counts <- as.data.frame(diedisheim_mean_counts)
diedisheim_mean_counts$mean <- apply(diedisheim_mean_counts, 1, mean)

#create a df with only gene name and mean
diedisheim_gene_names <- row.names(diedisheim_mean_counts)
diedisheim_means <- diedisheim_mean_counts$mean
diedisheim_gene_mean = data.frame(gene=diedisheim_gene_names, mean=diedisheim_means)

#loop through all the means and compare it with median
#if mean larger than the median, write the name and the value
#else, write the name and keep the value as null
diedisheim_temp_gene_name <- vector("list", nrow(diedisheim_gene_mean))
diedisheim_temp_gene_exp <- vector("list", nrow(diedisheim_gene_mean))

i <- 1
for (x in diedisheim_gene_mean[,2]) {
  if (x > diedisheim_median) {
    diedisheim_temp_gene_name[[i]] <- diedisheim_gene_mean[i,1]
    diedisheim_temp_gene_exp[[i]] <- diedisheim_gene_mean[i,2]
    i <- i+1
  } else {
    diedisheim_temp_gene_name[[i]] <- diedisheim_gene_mean[i,1]
    i <- i+1
  }
}

#bind temp lists together
diedisheim_processed_gene_mean <- cbind(diedisheim_temp_gene_name, diedisheim_temp_gene_exp)

#remove gene names for which the mean values are NA
diedisheim_filtered_gene_mean <- diedisheim_processed_gene_mean[!unlist(lapply(diedisheim_processed_gene_mean[,2], is.null))]






##merge the datasets with gene names and counts together in one

#rename the gene name columns to the same thing, "gene_id", which is what outer join is going to be by
colnames(colli_processed_gene_mean) <- c("gene_id", "colli_count")
colnames(diedisheim_processed_gene_mean) <- c("gene_id", "diedisheim_count")

#outer join as we want to keep nonmatching rows from both tables
dataset_outer_join <- merge(colli_processed_gene_mean, diedisheim_processed_gene_mean, by = "gene_id", sort = FALSE, all = TRUE)

##put the counts into a venn diagram of colli, colli AND diedisheim, and diedisheim

library(limma)
attach(dataset_outer_join)

#new data type that will be used for the vennCounts function
combined_numeric <- dataset_outer_join

#make the values numerical instead of strings
#change gene_id as row names
#replace NULL with 0 for numerical comparison
row.names(combined_numeric) <- combined_numeric$gene_id
combined_numeric <- select(combined_numeric, -gene_id)
combined_numeric[combined_numeric=='NULL'] <- 0

#make a binary list with 1 for expression 0 for NULL (below median expression) for colli and diedisheim
colli_binary <- vector("list", nrow(combined_numeric))

j <- 1
for (x in combined_numeric[,1]) { #colli_count row
  if (x == 0) {
    colli_binary[[j]] <- 0
    j <- j + 1
  } else {
    colli_binary[[j]] <- 1
    j <- j + 1
  }
}

diedisheim_binary <- vector("list", nrow(combined_numeric)) 

j <- 1
for (x in combined_numeric[,2]) { #diedisheim_count row
  if (x == 0) {
    diedisheim_binary[[j]] <- 0
    j <- j + 1
  } else {
    diedisheim_binary[[j]] <- 1
    j <- j + 1
  }
}


#combine the binary lists for colli and diedisheim in one, to be used in vennCounts
combined_gene_names <- row.names(combined_numeric)
binary_dataset <- cbind(colli_binary, diedisheim_binary)
row.names(binary_dataset) <- combined_gene_names
binary_dataset <- as.matrix(binary_dataset)

str(binary_dataset)

##########
# for (x in binary_dataset[,1]) {
#   x <- as.numeric(x)
# }
# 
# for (x in binary_dataset[,2]) {
#   x <- as.numeric(x)
# }
# 
# binary_dataset <- as.numeric(binary_dataset)
##########

dataset_venncounts <- vennCounts(binary_dataset)






