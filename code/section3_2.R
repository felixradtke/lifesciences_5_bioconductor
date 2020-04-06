#Section 3: Genes as GRanges Assessment

library(Homo.sapiens)
ghs = genes(Homo.sapiens)

#1 What genome build was used here?
genome(ghs)
#How many genes?
length(ghs)

#2 Sorting genes into chromosomes: What is the chromosome with the most genes?
which.max( table( seqnames( ghs ) ))

#3
w = width( ghs )
hist( w )
hist( log10(w))

#4
median(w)
