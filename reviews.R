---
title: "Movie Reviews"
author: "Ryan Weber"
date: "February 11, 2018"
output: 
  html_document:
    toc: true
    theme: united
    highlight: tango
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Setup workspace

```{r setup workspace, echo=FALSE}

library(RMySQL)
mydb = dbConnect(MySQL(), user='rweberc', password='Icbtadowop1!', dbname='reviews', host='localhost')
revDf <- dbGetQuery(mydb, "SELECT m.Title, c.FirstName, c.LastName, r.Rating 
  FROM movies as m
  LEFT OUTER JOIN reviews as r
  	ON m.MovieId = r.MovieId
  INNER JOIN critics as c
  	ON r.CriticId = c.CriticId;")

```

## Including Plots


```{r pressure}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
