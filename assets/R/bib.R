library(bibtex)
bib <- read.bib("publications.bib")


outputPubs <- function(bib) {
  
  nb <- length(bib)
  for(i in 1:nb) {
    
    ## authors
    n <- length(bib[i]$author)
    authors <- switch(n, 
                      paste(bib[i]$author[1]$family, paste(bib[i]$author[1]$given, collapse = " "), sep = ", "),
                      paste(bib[i]$author[1]$family, paste(bib[i]$author[1]$given, collapse = " "), "and", bib[i]$author[2]$family, paste(bib[i]$author[2]$given, collapse = " "))
    )
    if(is.null(authors)) {
      authors <- paste(bib[i]$author[1]$family, paste(bib[i]$author[1]$given, collapse = " "), sep = ", ")
      for(j in 2:(n-1)) {
        authors <- paste(authors, bib[i]$author[j]$family, paste(bib[i]$author[j]$given, collapse = " "), sep = ", ")
      }
      authors <- paste(authors, " and ", bib[i]$author[n]$family, ", ", paste(bib[i]$author[n]$given, collapse = " "), sep = "")
    }
    
    ## journal
    journal <- switch(bib[i]$bibtype,
                      InProceedings = bib[i]$booktitle,
                      InCollection = bib[i]$booktitle,
                      bib[i]$journal
    )
    
    ## editors
    n <- length(bib[i]$editor)
    editors <- switch(n, 
                      paste(bib[i]$editor[1]$family, paste(bib[i]$editor[1]$given, collapse = " "), sep = ", "),
                      paste(bib[i]$editor[1]$family, paste(bib[i]$editor[1]$given, collapse = " "), "and", bib[i]$editor[2]$family, paste(bib[i]$editor[2]$given, collapse = " "))
    )
    if(n > 2) {
      editors <- paste(bib[i]$editor[1]$family, paste(bib[i]$editor[1]$given, collapse = " "), sep = ", ")
      for(j in 2:(n-1)) {
        editors <- paste(editors, bib[i]$editor[j]$family, paste(bib[i]$editor[j]$given, collapse = " "), sep = ", ")
      }
      editors <- paste(editors, " and ", bib[i]$editor[n]$family, ", ", paste(bib[i]$editor[n]$given, collapse = " "), sep = "")
    }

    ## create md file
    filename <- paste0(bib[i]$key, ".md")
    sink(filename)
    cat("---\n")
    cat("authors:", authors, "\n")
    cat("year:", bib[i]$year, "\n")
    cat("title:", bib[i]$title, "\n")
    cat("journal:", journal, "\n")
    cat("vol:", bib[i]$volume, "\n")
    cat("pages:", bib[i]$pages, "\n")
    cat("editors:", editors, "\n")
    cat("publisher:", bib[i]$publisher, "\n")
    cat("location:", bib[i]$address, "\n")
    cat("doi:", bib[i]$doi, "\n")
    cat("link:", bib[i]$url, "\n")
    cat("---\n")
    cat(bib[i]$note, "\n")
    sink()
  }
}