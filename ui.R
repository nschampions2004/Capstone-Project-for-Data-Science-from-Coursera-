library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Welcome to my Word Predictor"),
  sidebarPanel(
    h3('Type in Your Phrase to Predict the Next Word'),
    textInput(inputId = "text1", label = "Your Phrase Here"),
    submitButton('Submit')
    ), 
  mainPanel(
    h3('Your Three Most Likely Words'),
    p('First Word'),
    textOutput('output'),
    p('Second Word'),
    textOutput('text2'),
    p('Third Word'),
    textOutput('text3')
  )
))