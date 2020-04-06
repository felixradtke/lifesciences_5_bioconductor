#Section 3: Ontology lookup assessment

#1 Using rols to explore ontologies: a common term
library(rols)
diab = OlsSearch("diabetes")

#1
olsRows(allRows(diab))

#2 Assessing ontology contributions
fulld = olsSearch(allRows(diab))
adf = as(fulld, "data.frame")
sort(table(adf$ontology_name), decreasing=TRUE)[1:10]

#3
library(DT)
datatable(adf)


