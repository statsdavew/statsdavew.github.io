library(bibtex)
source("bib_functions.R")

bib <- read.bib("../bibtex/publications.bib")
outputPubs(bib, filepath = "../../_publications/")


