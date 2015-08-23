#ui.R

#setwd("C:/Users/dahra/Documents/R/win-library/3.2/UsingR/shiny")
# folder: shiny

library(devtools)
library(shinyapps)
library(shiny)
library(plyr)
library(htmlwidgets)


arrests <- read.table("arrests-app/data/USArrests.txt", sep="\t",header = TRUE)

attach(arrests)

states <- levels(arrests$State)


# Define UI for application that draws a barplot
# Use a fluid Bootstrap layout
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Crimes by State (1973)"),
  
  # Sidebar with a select input for US States
  sidebarLayout(
    sidebarPanel(
      selectInput("states", "Select a State:", 
                  choices=states),
      hr(),
      helpText("Data from USArrests Dataset.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("crimePlot") 
      ,
      textOutput("text0")
      ,
      textOutput("text1")
      ,
      textOutput("text2")
      ,
      textOutput("text3")
      ,
      textOutput("text4")
    )
  )
))