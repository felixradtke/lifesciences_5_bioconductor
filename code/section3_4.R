#Section 3: Import/Export assessment

#1 miRNA target sites: pre-GRanges
library(rtracklayer)
data(targets)
class(targets)

#3
library(GenomicRanges)
mtar = with(targets,
            GRanges(chrom, IRanges(start,end), strand=strand,
                    targets=target, mirname=name))
cat(export(mtar[1:5],format = "bed"), sep = "\n")
cat("\n")
cat(export(mtar[1:5], format = "gff3"), sep = "\n")
