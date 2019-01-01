## generate word cloud dcw 01-01-19

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

text <- readLines("wordcloud_text.txt")
docs <- Corpus(VectorSource(text))
inspect(docs)

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("will","can", "may", "also", "within", "available", "chipman", "qian", "one", "two", "three", "use")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
names(v)[which(names(v) == "bayesian")] <- "Bayesian"
names(v)[which(names(v) == "phd")] <- "PhD"

d <- data.frame(word = names(v),freq=v)
head(d, 30)

d[1, 2] <- d[1, 2] + d[4, 2]
d[4, 2] <- 0
d[3, 2] <- d[3, 2] + d[6, 2]
d[6, 2] <- 0
d[5, 2] <- d[5, 2] + d[9, 2]
d[9, 2] <- 0


jpeg(file = "wordcloud.jpeg", width = 1280, height = 300)
wordcloud(words = d$word, freq = d$freq, min.freq = 6,
          max.words=200, random.order=FALSE, rot.per=0, 
          colors=brewer.pal(8, "Dark2"), fixed.asp = F, scale = c(7, 1))
dev.off()