Word Prediction Application
========================================================
author: Kyle Ligon
date: 9.20.2016
autosize: true



========================================================
In order to predict a word based on an input sentence, I completed six specific tasks.  
- Downloaded Achal Shah's "ANLP" Package
- Read my data into R and took a small (1%) sample
- Cleaned the data 
- Created unigrams, bigrams, and trigrams
- Used the Backoff Algorithm in the package in order to successfully select most predictable word
- Created a Shiny App that will take an input statement and return the highest conditionally probable word 

========================================================
In order to use the application simply go to:

https://nschampions2004.shinyapps.io/Captstone_Project/

The process is quite simple:
- Think of a phrase or word you would like to see a prediction for.
- Type that word or phrase into the bar.
- Submit the request.

Backoff Algorithm: An Introduction
=============================================================
The Backoff Algorithm uses a term document matrix of unigram, bigram, and trigrams to find the most probable phrase matching the given input.  This algorithm works in the following way:
Take the example "is the".  Backoff will look at all trigrams that meet the prerequisite words "is the".  Then, it will search the term document matrix for the highest probability word following that conditional bigram.  

The conditional probabilitie of the example would look like this:


P(word | "is the") = P("is the" & word)/P("is the")


Backoff Algorithm: Backing Off
============================================================
However, if there is a lower probabilty in the trigram term document matrix, this algorithm "backs off" to the lower level ngram and calculates the conditional probability of the second phrases.  

In our example, we would see something like this for calculating the conditional probabilities:


P(word | "the") = (P("the" & word)/P("the"))

Summarization
============================================================
Overall, this project was interesting to say the most.  I felt awkward, and, at times, rife with inexperience.  I was surprised that this course dealt so heavily with numerical calculation, data.frames, and statistical inference, and, yet, we finished with a format (words) that I had little experience working with and algorithms that I didn't feel I had the programming skills to write.  I guess, this project mirrors learning to swim by cannonball ejection: if you want to make it badly enough, you'll paddle hard to make it back to shore.  Thank you for your time! 




