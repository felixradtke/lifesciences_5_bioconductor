#Section 1: Chromosomes and SNPs assessment
library(BSgenome.Hsapiens.UCSC.hg19)

#1 Frequencies of short sequences
chr11seq <- BSgenome.Hsapiens.UCSC.hg19[["chr11"]]
subseq(chr11seq,start=10^6,width=25)
seqs<-c("ATG","TGA","TAA","TAG")
n<-sapply(seqs,function(sq){countPattern(sq,chr11seq)})
n
which.max(n)

#2 Nucleotide frequencies
chr7seq <- BSgenome.Hsapiens.UCSC.hg19[["chr7"]]
alphabetFrequency(chr7seq,as.prob=TRUE)

#3 Locations of SNPs in humans
library("SNPlocs.Hsapiens.dbSNP144.GRCh37")
snps144 = SNPlocs.Hsapiens.dbSNP144.GRCh37
s17 = snpsBySeqname(snps144, "17")
head(s17)

s17_df <- as.data.frame(s17)
s17_df %>% filter(RefSNP_id=="rs73971683")

#4 GWAS: Linking SNP genotypes to disease risk
library(gwascat)
data(ebicat37)
ebicat37
sort(table(ebicat37$CHR_ID),decreasing=TRUE)
table(ebicat37$CHR_ID)
sort(table(ebicat37$CHR_ID),decreasing=TRUE)
sort(table(ebicat37$CHR_ID),decreasing=TRUE)[1]

#5 Counting traits with GWAS hits
mcols(ebicat37)[,"DISEASE/TRAIT"]
head(sort(table(ebicat37$`DISEASE/TRAIT`),decreasing=TRUE))
sort(table(ebicat37$`DISEASE/TRAIT`),decreasing=TRUE)[1]
