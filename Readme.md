Readme
================

# Purpose

The purpose of this readme is to explain the code and structure in
completing the assessment for the first part of the data science course.
This readme outlines the data, packages and codes used and guides the
reader as to how each question of the assessment was answered. Each
question is answered in a separate project.

To get started, the different projects was created for question 1,
question 2 and question 3. The following code was used:

# Question 1

This question addresses some claims a friend made regarding movie
critics that perfectly predict films’ popularity and profitability
amongst audiences. This was not the case during the mid 2000s. This
question tests some of the friend’s theories by addressing three of the
statements she made.

The following packages were used:

``` r
pacman::p_load(tidyverse, ggthemes)
```

## Loading in data

The data for each question has been unzipped and put under the data
folder of each question folder. The data for the first question consists
of a csv file. This file contains information on the name of various
movies, the year during which the movie was released, each movie’s
production studio, its audience score and Rotten Tomatoes score, as well
as the profitability of the movie. The data was loaded as follows:

``` r
MovieData <- read.csv("Question1/data/Movies.csv")
```

## The first statement

The first statement my friend made is: “I firmly remember that Rotten
Tomatoes was always a great review platform - and if a movie had a
rating of more than 80% on Rotten Tomatoes, audiences would rate it
above 85% every time.”

To address this point, I drew a graph that indicates the ratings
audiences gave movies that had a rating of more than 80% on Rotten
Tomatoes. This was done by creating a function called RottenT\_plot that
draws the graph using only the movies that had a Rotten Tomatoes score
above 80%. This function is stored in the code folder of the question 1
folder. This function was then sourced in and the relevant input was
provided to produce the graph.

The movies were grouped into their relative genres to make it easier to
see what the rating of audiences were. This graph indicates that
animation movies that had a rating of more than 80% on Rotten Tomatoes,
had audience scores above 85%. Therefore, for animation movies, my
friend’s statement is true. However, for all the other genres my
friend’s statement is not true since the audience scores were below 85%.
Therefore, my friend’s statement regarding movies having high audience
scores if they have a high Rotten Tomatoes score is incorrect.

``` r
source("Question1/code/RottenT_plot.R")
graph_1 <- RottenT_plot(MovieData, xaxis_size = 5, xaxis_rows = 3)
graph_1
```

![](Readme_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

## The second statement

The second statement my friend made is: “Disney films may not have the
highest grossing numbers, but they’ve always been the most profitable of
all the leading studios.”

To test this statement, a graph containing the profitability of all the
leading studios were drawn to compare the profitability across studios.
This was done by creating a function called Profitability\_plot that
draws a bar plot. NA values for the leading studios are dropped. This
function is stored in the code folder of the question 1 folder. This
function was then sourced in and the relevant input was provided to
produce the graph.

``` r
source("Question1/code/Profitability_plot.R")
graph_2 <- Profitability_plot(MovieData, xaxis_size = 10, xaxis_rows = 10)
graph_2
```

![](Readme_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

This graph indicates that Independent was the most profitable studio
between 2007 and 2011, as it had the highest profitability (just under
120%). Disney’s profitability was around 40% which is much lower than
that of Independent. Therefore, my friend’s second statement is
incorrect.

## The third statement

The third statement my friend made is: “Audiences are always drawn to
the highest grossing films. In fact, I bet the correlation between the
world wide grossing numbers and audience scores would be near 80%.”

To test this statement, the correlation between the world wide grossing
numbers and audience scores was calculated. The code for this is shown
below.

``` r
Corr <- 
  MovieData %>%  
  summarise(Corr = cor(Worldwide.Gross, Audience..score.., method = "spearman", use = "pairwise.complete.obs"))
```

The correlation between world wide grossing numbers and audience scores
is 29.1%, which is far from 80%. My friend’s third statement is
therefore incorrect.

# Question 2

To answer this question, interesting results using the recently released
Forbes Billionaires list is presented.

## Loading in data

The data for the second question consists of multiple csv files. Each
file contains information on a specific country. It indicates the name
and age of the billionaires residing in that country, their net worth,
their rank on the Forbes Billionaires list and the industry in which the
billionaire operates.

Since multiple csv files needs to be loaded, a function is created to
collate and combine all the files. This, however, was unsuccessful as an
error message was provided:

> Error: Can’t combine `Age` <double> and `Age` <character>.

I then searched for a solution to this problem and found
[this](https://www.tidyverse.org/blog/2020/04/dplyr-1-0-0-and-vctrs/)
answer:

I therefore added the mutate to change Age to a character variable.
However, another error popped up:

> Error in mutate(Age = as.character(Age)) : object ‘Age’ not found

I realised that this has to do with the fact that the dataset contain
‘Age’ is not loaded into the function. I therefore tried to insert the
data in the function so that it can pick the Age variable up. I did this
by defining “Datroot =”Question2/data/"" as the function’s input.
However, this still did not work as I received the following error
message:

> Error in UseMethod(“mutate”) : no applicable method for ‘mutate’
> applied to an object of class “character”

I tried to play around with where I placed the mutate and also tried to
search for a solution I could not find one.

The data was loaded as follows (this is commented out to prevent the
Readme from not knitting):

``` r
#source("Question2/code/Data_Collating.R")
#Forbesdata <- Data_Collating(Datroot = "Question2/data/")
```

Due to these errors, I decided to still write out my thinking, even
though I don’t have the code available to create the graphs. The first
graph I would have plotted would be one comparing the number of
billionaires across each country. It would be interesting to see how
many billionaires there are in developing vs developed countries. For
this graph I would use a bar plot for each country on the x axis and on
the y axis I would indicate the number of billionaires listed in that
country. I would therefore group the results by Country.

The second graph I would have plotted would be to compare the average
net worth of billionaires under the age of 30, between 30 and 40,
between 40 and 50, and over the age of 50. I would think that older
billionaires have a higher net worth than younger billionaires, but in
this day and age there are multiple billionaires under 30 so it could be
that my thinking is wrong. For this, I would need to convert the net
worth variable to numeric. I would use: “mutate(NetWorth =
as.numeric(NetWorth))” to do this. Regarding the graph, I would again
use a bar graph with each bar representing the mean net worth of
billionaires in the specific age group. On the y axis the net worth will
be displayed and on the x axis the different age groups will be
displayed. I will therefore have to create new columns using mutate
where I group the people accoridng to their age in the different age
brackets.

# Question 3

For this question, the answers have been presented in a Texevier pdf.

## Loading the data

The data consists of three rds files and one csv file. It is loaded
below:

``` r
BBCData <- read_rds("Question3/data/tweets_bbc.rds")
CNNData <- read_rds("Question3/data/tweets_cnn.rds")
EconData <- read_rds("Question3/data/tweets_eco.rds")
CountryData <- read_csv("Question3/data/Country_list.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   .default = col_character()
    ## )
    ## i Use `spec()` for the full column specifications.
