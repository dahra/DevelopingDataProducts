#setwd("C:/Users/dahra/Documents/R/WorkingDirectory/DevelopingDataProducts")
setwd("C:/Users/dahra/Documents/R/win-library/3.2/UsingR/shiny")
# folder: arrest-app

#ui.R

library(shiny)
library(plyr)
# Rely on the 'USArrests' dataset in the datasets
# package (which generally comes preloaded).
#library(datasets)

#setwd("DevelopingDataProducts")
arrests <- read.table("arrests-app/data/USArrests.txt", sep="\t",header = TRUE)
states <- levels(arrests$State)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Crimes by State"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("states", "State:", 
                    choices=states),
        hr(),
        helpText("Data from USArrests Dataset.")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("crimePlot") 
        ,
        textOutput("text1")
        ,
        textOutput("text2")
        ,
        textOutput("text3")
        ,
        textOutput("text4")
      )
      

    ) #end of sidebar layout (no comma)

   )#end of fluidpage
)