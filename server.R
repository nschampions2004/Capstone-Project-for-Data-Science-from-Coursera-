library(shiny)
shinyServer(
  function(input, output) {
    output$text1 <- renderText({
      #files
      con_blog <- file("./final/en_US/en_US.blogs.txt")
      con_twitter <- file("./final/en_US/en_US.twitter.txt")
      con_news <- file("./final/en_US/en_US.news.txt") 
      #Read them
      blogs <- readLines(con_blog)
      twitter <- readLines(con_twitter)
      news <- readLines(con_news)
      #close the connection
      close(con_blog)
      close(con_news)
      close(con_twitter)
      #clean the training files
      overall <- c(blogs, news, twitter)
      train.overall <- sampleTextData(overall, 0.01)
      train.overall.clean <- cleanTextData(train.overall)
      #make the ngrams
      unigramModel <- generateTDM(train.overall.clean, 1)
      bigramModel <- generateTDM(train.overall.clean, 2)
      trigramModel <- generateTDM(train.overall.clean, 3)
      #ngram list created 
      ngramList <- list(trigramModel, bigramModel, unigramModel)
      #take a text string, predict an output
      TestString <- input$text1
      output <- predict_Backoff(TestString, ngramlist)
    })
    output$text2 <- renderText({input$text2})
    output$text3 <- renderText({input$text3})
  }
)