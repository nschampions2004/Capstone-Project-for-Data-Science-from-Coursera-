##Long version of reading in
# de_DE.blogs_locale <- "C:/Users/Kyle.ligon/Desktop/Working Directory/Captstone Project/final/de_DE/de_DE.blogs.txt"
# de_DE.news.txt_locale <- "C:/Users/Kyle.ligon/Desktop/Working Directory/Captstone Project/final/de_DE/de_DE.news.txt"
# de_DE.twitter.txt_locale <- "C:/Users/Kyle.ligon/Desktop/Working Directory/Captstone Project/final/de_DE/de_DE.twitter.txt"
# de_DE.blogs <- read.delim(de_DE.blogs_locale)
# de_DE.news <- read.delim(de.DE.news.txt_locale)
# de_DE.twitter <- read.delim(de.DE.twitter.txt_locale)
##Great for reading all files into R without readLines
#temp = list.files(pattern = "^en*.txt")
#for(i in 1:length(temp)) assign(temp[i], readLines(temp[i]))

twitter <- readLines(file("./final/en_US/en_US.twitter.txt"))
news <- readLines(file("./final/en_US/en_US.news.txt"))
blogs <- readLines(file("./final/en_US/en_US.blogs.txt"))

unlink(c(twitter, news, blogs))

#Question 1
sum(nchar(blogs, type = "bytes"))

#Question 2
nchar(twitter)

#Question 3
max(nchar(blogs))
max(nchar(news))

#Question 4
sum(grepl("love", twitter))
sum(grepl("hate", twitter))

# = 4

#Question 5
grep("biostats", twitter)
#twitter[result ^] = They havent studied for their biostat exam

#Question 6
nchar(grep("A computer once beat me at chess, but it was no match for me at kickboxing", twitter))
#6 6 7 


