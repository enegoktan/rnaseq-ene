library(dplyr)
library(BiocManager)
library(DESeq2)

setwd("/Users/enegoktan/Desktop/scripts_and_manuals/scripts/differential_expression")

#this script uses the global variables created in "2.negbinom.R" script

#merge the datasets with gene names and counts together in one

#rename the gene name columns to "gene_id", which is what outer join is going to be by
colnames(colli_processed_gene_mean) <- c("gene_id", "colli_count")
colnames(diedisheim_processed_gene_mean) <- c("gene_id", "diedisheim_count")

#outer join as we want to keep nonmatching rows from both tables
dataset_outer_join <- merge(colli_processed_gene_mean, diedisheim_processed_gene_mean, by = "gene_id", sort = FALSE, all = TRUE)


#put the counts into a venn diagram of colli, colli AND diedisheim, and diedisheim

#new data that will be used for the vennCounts function
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



#read the data for the Venn diagrams 
binary_datasets<-read.csv("Users/enegoktan/Desktop/data/binary_dataset.csv")

##Venn diagram for those genes where the expression = 0
attach(binary_datasets)
Colli_zero<-(colli_binary==0)
Diedsheim_zero<-(diedisheim_binary==0)
c1<-cbind<-cbind(Colli_zero, Diedsheim_zero)
a<- vennCounts(c1)
a
vennDiagram(a)

##Venn diagram for those genes where the expression = 1
attach(binary_datasets)
Colli<-(colli_binary>=1)
Diedsheim<-(diedisheim_binary>=1)
c2<-cbind<-cbind(Colli, Diedsheim)
b<- vennCounts(c2)
b
vennDiagram(b)