#Section 3: Assessment on KEGG
library(KEGGREST)

#1 Size of KEGG's human pathway catalog

keggGet("hsa", "pathway")

#2 Obtaining a pathway layout
oo = keggGet("hsa00790", "image")
writePNG(oo, "im.png")



