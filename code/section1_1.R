library(usethis)
#Section 1: Gene signature assessment
library(BiocInstaller)
library(genefu)
#1
data(sig.gene70)
dim(sig.gene70)
head(sig.gene70)[,1:6]
sum(is.na(sig.gene70$NCBI.gene.symbol))

#2
index<-grep("kinase",sig.gene70$Description)
sig.gene70$Description[index]
