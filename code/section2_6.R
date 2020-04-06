#Section 2: 
library(airway)
library(HDF5Array)
td = tempfile()
data(airway)
saveHDF5SummarizedExperiment(airway, td)

#1
length(dir(td))

#2 Continuation: components of the saved SummarizedExperiment
X  = readRDS(dir(td, full=TRUE)[2]) 
class(X)

#3 (Error expected)
assay(X[1,1])

#4
library(erma)
hn = genemodel("HNRNPC")
e1 = hn[1]  # first exon in the model
library(GenomicFiles)
library(RNAseqData.HNRNPC.bam.chr14)
gf = GenomicFiles(files=RNAseqData.HNRNPC.bam.chr14_BAMFILES)
gf
rowRanges(gf) = e1
library(GenomicAlignments)
MAP = function(r, f) 
  readGAlignmentPairs(f, param=ScanBamParam(which=r))
ali = reduceByRange(gf, MAP=MAP)
elementNROWS(ali[[1]]) # use [[1]] as there is only one request

#5 Querying BED files to compare epigenomic states of cell types
library(erma)
ermaset = makeErmaSet()
stateProfile(ermaset[,c(4,6,30,31)], "CD28", short=FALSE)
