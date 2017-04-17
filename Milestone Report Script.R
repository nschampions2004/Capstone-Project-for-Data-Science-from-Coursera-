#Measure Time of Script
ptm <- proc.time()
proc.time() - ptm

#Read the data into R
con_blog <- file("./final/en_US/en_US.blogs.txt")
con_twitter <- file("./final/en_US/en_US.twitter.txt")
con_news <- file("./final/en_US/en_US.news.txt") 

blogs <- readLines(con_blog)
twitter <- readLines(con_twitter)
news <- readLines(con_news)

close(con_blog)
close(con_news)
close(con_twitter)


library(ggplot2)
library(tm)
library(SnowballC)
library(wordcloud)

#Creating Maxes and Their Graphs
maxes <- c(max(nchar(twitter)), max(nchar(news)), max(nchar(blogs)))
maxes_titles <- c("twitter", "news", "blogs")
maxes <- data.frame(maxes, maxes_titles)


max_bar <- ggplot(data = maxes, aes(x = factor(maxes_titles),  y = maxes, fill = maxes_titles))
max_bar + geom_bar(stat = "identity") + labs(title = "Maximum Character Counts for the Longest Lines", 
                                             x = "Source", y = "Number of Characters") +
                                             guides(fill = guide_legend(title = "Source"))
#Creating Mean Chars per Entry and Their Graphs
means <- c(mean(nchar(twitter)), mean(nchar(news)), mean(nchar(blogs)))
means <- data.frame(means, maxes_titles)

mean_bar <- ggplot(data = means, aes(x = factor(maxes_titles), y = means, fill = maxes_titles))
mean_bar + geom_bar(stat = "identity") + labs(title = "Mean Character Counts for the Longest Lines",
                                               x = "Source", y = "Number of Characters") + 
                                              guides(fill = guide_legend(title = "Source"))

#Creating the word cloud of each document
blogsCorpus <- Corpus(VectorSource(blogs))
blogsCorpus <- tm_map(blogsCorpus, PlainTextDocument)
blogsCorpus <- tm_map(blogsCorpus, removePunctuation)
blogsCorpus <- tm_map(blogsCorpus, removeWords, c('the', 'this', stopwords('english')))
blogsCorpus <- tm_map(blogsCorpus, stemDocument)
wordcloud(blogsCorpus, max.words = 20, random.order = FALSE)

twitterCorpus <- Corpus(VectorSource(twitter))
twitterCorpus <- tm_map(twitterCorpus, PlainTextDocument)
twitterCorpus <- tm_map(twitterCorpus, removePunctuation)
twitterCorpus <- tm_map(twitterCorpus, removeWords, c('the', 'this', stopwords('english')))
twitterCorpus <- tm_map(twitterCorpus, stemDocument)
wordcloud(twitterCorpus, max.words = 20, random.order = FALSE)
                                               
newsCorpus <- Corpus(VectorSource(news))
newsCorpus <- tm_map(newsCorpus, PlainTextDocument)
newsCorpus <- tm_map(newsCorpus, removePunctuation)
newsCorpus <- tm_map(newsCorpus, removeWords, c('the', 'this', stopwords('english')))
newsCorpus <- tm_map(newsCorpus, stemDocument)
wordcloud(news, max.words = 20, random.order = FALSE)


