#Section 1: Microarray Assessment

#1 Using a SummarizedExperiment
#This code chunk constructs a SummarizedExperiment container for expression data on samples taken from different tissues.
#We'll learn more about this container design later on. For now, just follow the instructions below, adding packages to your installation if any are missing, using biocLite(). For example, 
#acquire the tissuesGeneExpression package using biocLite("genomicsclass/tissuesGeneExpression") if you don't already have it.

library(tissuesGeneExpression)
data(tissuesGeneExpression)
library(SummarizedExperiment)
tissSE = SummarizedExperiment(list(rma=e))
colData(tissSE) = DataFrame(tab)
library(hgu133a.db)
sym = mapIds(hgu133a.db, keys=rownames(tissSE), column="SYMBOL", keytype="PROBEID")
nm = mapIds(hgu133a.db, keys=rownames(tissSE), column="GENENAME", keytype="PROBEID")
rowData(tissSE) = DataFrame(symbol=sym, genename=nm) 

grep("H2AX", rowData(tissSE)$symbol, value=TRUE)

#2
par(las=2, mar=c(10,4,2,2))
boxplot(as.numeric(assay(tissSE["205436_s_at",]))~tissSE$Tissue)
