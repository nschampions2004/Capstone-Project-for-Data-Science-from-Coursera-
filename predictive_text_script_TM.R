#Measure Time of Script
ptm <- proc.time()

library(ggplot2)
library(qdap)
library(tm)
library(SnowballC)
library(wordcloud)
library(ANLP)
library(caret)
library(RWeka)
library(tau)

#Read the data into R
con_blog <- file("./final/en_US/en_US.blogs.txt")
con_twitter <- file("./final/en_US/en_US.twitter.txt")
con_news <- file("./final/en_US/en_US.news.txt") 

blogs <- readLines(con_blog)
twitter <- readLines(con_twitter)
news <- readLines(con_news)

blogs_sample <- sampleTextData(blogs, 0.004)
news_sample <- sampleTextData(news, 0.003)
twitter_sample <- sampleTextData(twitter, 0.003)

close(con_blog)
close(con_news)
close(con_twitter)




#Make training and test sets
overallC <- paste(blogs_sample, news_sample, twitter_sample)
overallC.tau <- overallC
#Making the corpus
overallC <- Corpus(VectorSource(overallC))

#Cleaning the corpus
overallC <- tm_map(overallC, tolower)
overallC <- tm_map(overallC, removePunctuation)
overallC <- tm_map(overallC, removeNumbers)
#removeSpecialChars <- function(x) gsub("[^a-zA-Z0-9]", "", x)
#overallC <- tm_map(overallC, removeSpecialChars)
overallC <- tm_map(overallC, PlainTextDocument)



#Building the ngrams
Bigramtokenizer <- function(x) 
  unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)
Trigramtokenizer <- function(x)
  unlist(lapply(ngrams(words(x), 3), paste, collapse = " "), use.names = FALSE)
unigramtokenizer <- function(x)
  unlist(lapply(ngrams(words(x), 1), paste, collapse = " "), use.names = FALSE)

#tokenizing
unigram <- TermDocumentMatrix(overallC, control = list(tokenize = unigramtokenizer))
bigram <- TermDocumentMatrix(overallC, control = list(tokenize = Bigramtokenizer))
trigram <- TermDocumentMatrix(overallC, control = list(tokenize = Trigramtokenizer))

#removing the sparse terms
unigram <- removeSparseTerms(unigram, 0.999)
bigram <- removeSparseTerms(bigram, 0.999)
trigram <- removeSparseTerms(trigram, 0.99999)

bigram.df <- as.data.frame(inspect(bigram))

#writing the algorithm
findAssocs(bigram, "ready", 0.8)
unigram <- as.data.frame(unigram)




                             











