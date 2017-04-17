#Measure Time of Script
ptm <- proc.time()


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
library(qdap)
library(tm)
library(SnowballC)
library(wordcloud)
library(ANLP)
library(caret)

#Make training and test sets
overall <- c(blogs, news, twitter)

train.overall <- sampleTextData(overall, 0.01)

write(train.overall, "./train.overall.txt")

train.overall.clean <- cleanTextData(train.overall)

train.overall.clean[[1]]$content[1:5]

unigramModel <- generateTDM(train.overall.clean, 1)

bigramModel <- generateTDM(train.overall.clean, 2)

trigramModel <- generateTDM(train.overall.clean, 3)

quadgramModel <- generateTDM(train.overall.clean, 4)

fifthgramModel <- generateTDM(train.overall.clean, 5)

sixthgramModel <- generateTDM(train.overall.clean, 6)

seventhgramModel <- generateTDM(train.overall.clean, 7)

eighthgramModel <- generateTDM(train.overall.clean, 8)

ninthgramModel <- generateTDM(train.overall.clean, 9)

tenthgramModel <- generateTDM(train.overall.clean, 10)

ngramList <- list(sixthgramModel, fifthgramModel, quadgramModel, trigramModel, bigramModel, unigramModel)
testString <- "ready set"
predict_Backoff(testString, ngramList)



print(proc.time() - ptm)

