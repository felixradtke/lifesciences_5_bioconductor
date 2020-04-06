#Section 4: Inference Assessment

library(devtools)
install_github("genomicsclass/maPooling")

library(Biobase)
library(maPooling)
data(maPooling)
pd=pData(maPooling)
pooled=which(rowSums(pd)==12)
individuals=which(rowSums(pd)==1)
##remove replicates
individuals=individuals[-grep("tr",names(individuals))]
pool = exprs(maPooling)[,pooled] 
indiv = exprs(maPooling)[,individuals]
strain = ifelse(grepl("a",rownames(pData(maPooling))),0,1)
g_pool = strain[pooled]
g_indiv = strain[individuals]

#1
library(genefilter)
tech<-rowSds(pool[, g_pool == 1])
bio<-rowSds(indiv[, g_indiv == 1])
mean(bio>tech)
## we can also make a plot
plot(tech,bio)
abline(0,1,col=2)

#2 Two-sample tests, genome-wide, with FDR
library(genefilter)
pvals<-rowttests(pool,factor(g_pool))$p.value
library(qvalue)
qvals = qvalue(pvals)$qvalues
sum(qvals<0.05)

#3 Can the claims based on pooled data be confirmed?
library(genefilter)
pvals<-rowttests(pool,factor(g_pool))$p.value
library(qvalue)
qvals = qvalue(pvals)$qvalues
index=which(qvals<0.05)
pvals2<-rowttests(indiv[index,],factor(g_indiv))$p.value
mean(pvals2>0.05)

#4 Application of the moderated t-test
library(genefilter)
library(qvalue)
pvals = rowttests(indiv,factor(g_indiv))$p.value
qvals = qvalue(pvals)$qvalue
library(limma)
X = model.matrix(~g_indiv)
fit = lmFit(indiv,X)
eb = eBayes(fit)
pvals2= eb$p.value[,2]
qvals2 = qvalue(pvals2)$qvalue
mean(qvals2[index]<0.05)







