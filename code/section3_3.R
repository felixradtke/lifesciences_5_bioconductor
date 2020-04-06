#Section 3: Gene and transcript model assessment
library(devtools)
install_github("genomicsclass/ph525x")
library(ph525x)
stopifnot(packageVersion("ph525x") >= "0.0.16") # do over if fail 

#1
modPlot("ESR1", useGeneSym=FALSE, collapse=FALSE) 
