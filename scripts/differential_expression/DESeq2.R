library(dplyr)
library(BiocManager)
library(DESeq2)

setwd("/Users/enegoktan/Desktop/scripts_and_manuals/scripts/differential_expression")

# import the raw counts to RStudio
colli_raw_counts <- read.delim("/Users/enegoktan/Desktop/HTseq_counts_file_hg38_colli.txt", header = FALSE)
diedesheim_raw_counts <- read.delim("/Users/enegoktan/Desktop/HTseq_counts_file_hg38_diedisheim.txt", header = FALSE)
camunas_soler_raw_counts <- read.csv("/Users/enegoktan/Desktop/genecountsFACS_all.csv", row.names = 1, stringsAsFactors = FALSE)

# rename the columns
names(colli_raw_counts) <- c("gene", "2h_1", "2h_2", "2h_3", "2h_4", "2h_5", "8h_1", "8h_2", "8h_3", "8h_4", "8h_5", "24h_1", "24h_2", "24h_3", "24h_4", "24h_5")
names(diedesheim_raw_counts) <- c("gene", "0h_1", "0h_2", "0h_3", "4h_1", "4h_2", "4h_3", "24h_1", "24h_2", "24h_3", "72h_1", "72h_2", "72h_3", "144h_1", "144h_2", "144h_3")

# change the gene identifiers as columns headers
rownames(colli_raw_counts) <- colli_raw_counts[,1]
colli_raw_counts <- select(colli_raw_counts, -gene)

rownames(diedesheim_raw_counts) <- diedesheim_raw_counts[,1]
diedesheim_raw_counts <- select(diedesheim_raw_counts, -gene)

### using DEseq2 for normalisation ###

## start with Colli dataset

# create a metadata table (annotated), created a matrix, converted to data frame
colli_metadata <- matrix(data = NA, nrow = length(colnames(colli_raw_counts)), ncol = 2)
rownames(colli_metadata) <- colnames(colli_raw_counts)
colnames(colli_metadata) <- c('treatment_time', 'control')

# populate the data
# could be done in the future with a delimiter, look it up later
colli_metadata[,1] <- c(2, 2, 2, 2, 2, 8, 8, 8, 8, 8, 24, 24, 24, 24, 24)
colli_metadata[,2] <- c(1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5)

colli_metadata <- as.data.frame(colli_metadata)
colli_metadata$treatment_time <- factor(colli_metadata$treatment_time)
colli_metadata$control <- factor(colli_metadata$control)

# convert colli count data frame to matrix
colli_count_matrix <- as.matrix(colli_raw_counts)

# run DESeq2 on colli

colli_DESeqDataset <- DESeqDataSetFromMatrix(
  countData = colli_count_matrix,
  colData = colli_metadata,
  design = ~ 1,
  tidy = FALSE,
)

## do the same for the Diedesheim dataset

# create a metadata table (annotated), created a data frame
diedesheim_metadata <- data.frame(treatment_time = c(0, 0, 0, 4, 4, 4, 24, 24, 24, 72, 72, 72, 144, 144, 144),
                                  control = c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3))
rownames(diedesheim_metadata) <- colnames(diedesheim_raw_counts)

# convert diedesheim count data frame to matrix
diedesheim_count_matrix <- as.matrix(diedesheim_raw_counts)

# run DEseq2 on Diedesheim

diedesheim_DESeqDataset <- DESeqDataSetFromMatrix(
  countData = diedesheim_count_matrix,
  colData = diedesheim_metadata,
  design = ~ 1,
  tidy = FALSE,
)










