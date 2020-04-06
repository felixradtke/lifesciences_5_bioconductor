#Section 3: Setup and GRanges check

library(ERBS)
class(HepG2)
library(Ranges)

#1
unique(HepG2@ranges)

#2
median(values(HepG2)$signalValue)

#3
i = which.max(mcols(HepG2)$signalValue)
i
seqnames(HepG2[i])

#4
chr = seqnames(HepG2)
table(chr)[16]

#5
median( width(HepG2) )
hist(width(HepG2),nclass=25)
