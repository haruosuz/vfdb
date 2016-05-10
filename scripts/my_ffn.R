cat("\n  This R script analyzes FASTA nucleotide of coding regions.\n\n")

# Set Working Directory
#setwd("~/projects/vfdb/")

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
lna <- read.fasta(file = "data/VFDB_setA_nt.fas", seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

cat("# Length of sequences\n")
sapply(lna, length)[1:10]

cat("# GC Content\n")
sapply(lna, GC)[1:10]

cat("# Translate nucleotides into amino acids\n")
getTrans(lna[[6]])

cat("# Get sequence annotations (FASTA headers)\n")
getAnnot(lna[1:2])

# Indexing all elements that match pattern
i <- grep(pattern="Bacillus anthracis", x=getAnnot(lna), ignore.case=TRUE)

# Writing sequence data out as a FASTA file
write.fasta(sequences=getTrans(lna[i]), names=getName(lna[i]), file.out="analysis/sequence.fasta")

# Codon usage
pdf(file="analysis/dotchart.uco.pdf")
uco.eff <- sapply(lna[1:3], uco, index="eff")
global <- rowSums(uco.eff)
dotchart.uco(global, cex=0.7, main="Codon usage")
dev.off()

# Print R version and packages
sessionInfo()

