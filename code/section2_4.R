#Section 2: Finding Overlaps Assessment
library(GenomicRanges)
library(GenomicFeatures)
library(ERBS)
data(HepG2)
data(GM12878)

#1
start(HepG2)[17]

#2
d = distanceToNearest(HepG2[17],GM12878)
i = subjectHits(d)
start(GM12878[i])

#3 What is the distance between the 17th region of HepG2 and its closest region in GM12878?
d = distanceToNearest(HepG2[17],GM12878)
mcols(d)$distance

#4 Summarizing proximities of nearest regions in a pair of GRanges
d = distanceToNearest(HepG2,GM12878)
mean(mcols(d)$distance < 2000)
