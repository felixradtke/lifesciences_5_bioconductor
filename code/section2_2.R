#Section 2: IRanges assessment
library(IRanges)

#1
ir <- IRanges(101,200,100)
start(ir*2)

#2
narrow(ir,start = 20)

#3
ir+25

#4
ir <- IRanges(start = c(1,11,21), end = c(3,15,27))
width(ir)
sum(width(ir))

#5
library(ph525x)
x <- IRanges(start = c(101,106,201,211,221,301,306,311,351,361,401,411,501),end = c(150,160,210,270,225,310,310,330,390,380,415,470,510))

# find out the range first
range(x)
sum(width(gaps(x)))


#6 Disjoint subranges
disjoin(x)
length(disjoin(x))

#7 Resizing
par(mfrow=c(2,1))
plotRanges(x)
x1 <- resize(x,1)
plotRanges(x1)









