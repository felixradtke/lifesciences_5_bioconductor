#Section 2: GRanges Assessment

#1 Understanding strand orientation with resize
library(IRanges)
library(ph525x)
library(GenomicRanges)
x = GRanges("chr1", IRanges(c(1,101),c(50,150)), strand=c("+","-"))
ranges(x)
plotGRanges = function(x) plotRanges(ranges(x))
par(mfrow=c(2,1))
plotGRanges(x)
x1 = resize(x,1)
plotGRanges(x1)

#2 Intersecting transcripts with basic operations
x = GRanges("chr1", IRanges(c(101,201,401,501),c(150,250,450,550)), strand="+")
y = GRanges("chr1", IRanges(c(101,221,301,401,541),c(150,250,350,470,550)), strand="+")
par(mfrow=c(2,1))
plotGRanges(x)
plotGRanges(y)
GRangesList(x,y)
c(x,y)
dis = disjoin(c(x,y))
both = dis %over% x & dis %over% y
sum(width(dis[both]))

#3 Subregions that distinguish transcripts
not =! (dis %over% x & dis %over% y)
sum(width(dis[not]))

#4 The role of strand labeling in range operations
z = GRanges("chr1", IRanges(c(101,201,401,501),c(150,250,450,550)), strand="-")
sum(x %over% z)














