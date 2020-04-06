#Section 3: AnnotationHub assessment

library(AnnotationHub)
ah = AnnotationHub()
mah = mcols(ah)
names(mah)
sort(table(mah$species), decreasing=TRUE)[1:10]

#1
names(query(query(ah, "HepG2"), "CTCF"))
length(names(query(query(ah, "HepG2"), "CTCF")))
