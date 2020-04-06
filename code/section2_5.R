#Section 2: DataFrame and SummarizedExperiment assessment


#1 Tabulating sample characteristics
library(erma)
ee = makeErmaSet()
class(colData(ee))
length(names(colData(ee)))  # lots of attributes!
table(ee$ANATOMY)

#2 DataFrame columns of arbitrary type
mydf = colData(ee)[,1:10]
getClass("DataFrame")
mydf$demomat = matrix(0, nr=nrow(mydf), nc=5)
dim(mydf$demomat)
dim(mydf)
dim(data.frame(mydf))








