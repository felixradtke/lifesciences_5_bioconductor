#Section 4: Gene Set Analysis Assessment

#Exploring dependence

var(rowMeans(matrix(rnorm(10000 * 10, 0, 1), ncol=10)))
library(MASS)
Sigma = matrix(.7, ncol=10, nrow=10)
diag(Sigma) = 1
mvrnorm(n=1,mu=rep(0,10),Sigma=Sigma)

library(MASS)
Sigma = matrix(.7, ncol=10, nrow=10)
diag(Sigma) = 1
var(rowMeans(matrix(mvrnorm(n=10000,mu=rep(0,10),Sigma=Sigma), ncol=10)))

#Gene set analysis with the roast algorithm
library(GEOquery)
e = getGEO("GSE34313")[[1]]
e$condition = e$characteristics_ch1.2
levels(e$condition) = c("dex24","dex4","control")
table(e$condition)
## Note that with ExpressionSets we can access the phenoData columns directly
## Specifically, note that e$condition is equivalent to pData(e)$condition
names(fData(e))
fData(e)$GO_ID[1:4]
lvls = c("control", "dex4")
es = e[,e$condition %in% lvls]
es$condition = factor(es$condition, levels=lvls)
library(limma)
library(qvalue)
design = model.matrix(~ es$condition)
fit = lmFit(es, design=design)
fit = eBayes(fit)
topTable(fit)[,c(6,7,18,22)]
# Immune response
set.seed(1)
idx = grep("GO:0006955", fData(es)$GO_ID)
length(idx)
r1 = roast(es, idx, design)
r1

set.seed(1)
idx = grep("GO:0045454", fData(es)$GO_ID)
length(idx)
r1 = roast(es, idx, design)
r1

#Inference for multiple gene sets
library(org.Hs.eg.db)
org.Hs.egGO2EG
go2eg = as.list(org.Hs.egGO2EG)
head(go2eg)
govector = unlist(go2eg)
golengths = sapply(go2eg, length)
head(fData(es)$GENE)

idxvector = match(govector, fData(es)$GENE);table(is.na(idxvector))
##This is the organized list of indexes for genes per GO term:
idx = split(idxvector, rep(names(go2eg), golengths));go2eg
##We can see the genes like this:
go2eg[[1]]
fData(es)$GENE[idx[[1]]]
idxclean = lapply(idx, function(x) x[!is.na(x)])
idxlengths = sapply(idxclean, length)
idxsub = idxclean[idxlengths > 10]
length(idxsub)
set.seed(1)
r2 = mroast(es, idxsub, design)
head(r2)

r2[which.max(r2$PropUp),1]



#Filtering gene sets
idxsub = idxclean[idxlengths >= 50]
length(idxsub)
set.seed(1)
r3 = mroast(es, idxsub, design)
head(r3)
size = sapply(idxsub,length)
idxsub2= idxsub[size>=50]
r3 = mroast(es, idxsub2, design)
rownames(r3[which.max(r3$PropUp),])

#Annotation check
library(GO.db)
columns(GO.db)
keytypes(GO.db)
select(GO.db, keys="GO:0000776",columns="TERM") 



