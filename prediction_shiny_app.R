library(shiny)

ui <- fluidPage(
  pageWithSidebar(
    headerPanel("Welcome to my Word Predictor"),
    sidebarPanel(
      h3('Type in Your Phrase to Predict the Next Word'),
      textInput(inputId = "text1", label = "Your Phrase Here"),
      submitButton('Submit')
    ), 
    mainPanel(
      h3('Your Three Most Likely Words'),
      p('First Word'),
      verbatimTextOutput("text")
    )
  )
)

library(ggplot2)
library(qdap)
library(tm)
library(SnowballC)
library(wordcloud)
library(ANLP)
library(caret)
#files
file_train <- file("./train.overall.txt")
#Read them
overall <- readLines(file_train)
#close the connection
close(file_train)
#clean the training files
overall.clean <- cleanTextData(overall)
#make the ngrams
unigramModel <- generateTDM(overall.clean, 1)
bigramModel <- generateTDM(overall.clean, 2)
trigramModel <- generateTDM(overall.clean, 3)
#ngram list created 
ngramList <- list(trigramModel, bigramModel, unigramModel)


server <- function(input, output) {
  output$text <- renderPrint({
    predict_Backoff(input$text1, ngramList)})
}


shinyApp(ui = ui, server = server)
