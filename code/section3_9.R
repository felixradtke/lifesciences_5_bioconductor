#Section 3 GSEABase assessment

#1 Recurrent genes in set collections
library(GSEABase)
glioG = getGmt(system.file("gmt/glioSets.gmt", package="ph525x"))

tt = table(unlist(lapply(1:47, function(x) geneIds(glioG [[ x ]] ))))

#2 Counting non-recurrent genes
tt_df <- as.data.frame(tt)
sum(tt_df$Freq == 1)
