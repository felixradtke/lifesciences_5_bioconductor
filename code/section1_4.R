#Section 1: Gene Expression Assessment

library(devtools)
library(tissuesGeneExpression)
data(tissuesGeneExpression)
head(e[,1:5])
table(tissue)

library(SummarizedExperiment)
tissSE = SummarizedExperiment(list(rma=e))
colData(tissSE) = DataFrame(tab)
#1 Localization of expression to tissues
boxplot(e["209169_at",]~tissue,las=2) # las=2 sets the axis label perpendicular
#This gene is expressed in the brain but not the other tissues

#2 Comparing genes for tissue-specificity
IDs = c("201884_at", "209169_at", "206269_at", "207437_at", "219832_s_at", "212827_at")
library(rafalib)
mypar(3,2)
sapply(IDs,function(x){boxplot(e[x,]~tissue,las=2,main=x)})

#3 Discovery of microarray annotation in Bioconductor
#The microarray product used to make the measurements described here is the Affymetirx Human GeneChip HG133A. Search the Bioconductor website and determine which of the following packages provides a connection to gene information:
#A: hgu133a.db

#4 Oligo sequences on affymetrix arrays
library(hgu133aprobe)
head(hgu133aprobe)
#How many oligos are used to interrogate samples for gene GCM1, annotated to probe 206269_at? You will need to work with the Probe.Set.Name field of the hgu133aprobe data.frame.
sum(hgu133aprobe$Probe.Set.Name=="206269_at")

#5
library(hgu133a.db)
sym = mapIds(hgu133a.db, keys=rownames(tissSE), column="SYMBOL", keytype="PROBEID")
nm = mapIds(hgu133a.db, keys=rownames(tissSE), column="GENENAME", keytype="PROBEID")
rowData(tissSE) = DataFrame(symbol=sym, genename=nm)

#To restrict attention to genes with 'phosphatase' in their names, use code like:
  tissSE[ grep("kinase", rowData(tissSE)$genename), ]


