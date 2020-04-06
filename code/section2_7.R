#Section 2: Multiomic TCGA data assessment

#1
library(MultiAssayExperiment)  # verify 1.4.0 at least
library(RaggedExperiment)  # verify 1.2.0 at least
tcga <- download.file("https://s3.amazonaws.com/bcfound-edx/tcgaLAML.rds", "tcgaLAML.rds")
laml = readRDS("tcgaLAML.rds")
