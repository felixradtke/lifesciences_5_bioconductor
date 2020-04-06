#Section 3: Assessment: Translating between reference builds with liftOver

download.file("http://hgdownload.cse.ucsc.edu/goldenPath/hg19/liftOver/hg19ToHg38.over.chain.gz",
              "hg19ToHg38.over.chain.gz")
library(R.utils)
gunzip("hg19ToHg38.over.chain.gz")
library(ERBS)
data(HepG2)
library(rtracklayer)
ch = import.chain("hg19ToHg38.over.chain") 
nHepG2 = liftOver(HepG2, ch)

#1
start(HepG2[1])-start(nHepG2[1])

nHepG2
