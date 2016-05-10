cat("\n  This R script analyzes FASTA amino acid.\n\n")

# Set Working Directory
#setwd("~/projects/vfdb/")

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
laa <- read.fasta(file = "data/VFDB_setA_pro.fas", seqtype = c("AA"))

cat("# How many sequences\n")
length(laa)

cat("# Length of sequences\n")
sapply(laa, length)[1:10]

cat("# Protein sequence information\n")
pdf(file="analysis/AAstat.pdf")
AAstat(laa[[6]], plot = TRUE)
dev.off()

# Print R version and packages
sessionInfo()

