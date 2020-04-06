#Section 3: Interactive tables for genomic annotation: assessment

library(Homo.sapiens)
g = genes(Homo.sapiens)
library(ERBS)
data(HepG2)
kp = g[resize(g,1) %over% HepG2]

nn = names(kp)
m = select(Homo.sapiens, keys=nn, keytype="ENTREZID",
           columns=c("SYMBOL", "GENENAME", "TERM", "GO"))
library(DT)
datatable(m)
