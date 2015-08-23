#server.R

#setwd("C:/Users/dahra/Documents/R/win-library/3.2/UsingR/shiny")
# folder: shiny

library(devtools)
library(shinyapps)
library(shiny)
library(htmlwidgets)
#attach(arrests)

arrests <- read.table("arrests-app/data/USArrests.txt", sep="\t",header = TRUE)

attach(arrests)

states <- levels(arrests$State)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a barplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a barplot of 4 Crime types per state
  #  3) It also shows calculated crime rank of the state 
  
  
  # Fill in the spot we created for a plot
  output$crimePlot <- renderPlot({
    
    # Render a barplot
    b <- as.numeric(arrests[State==input$states,2:5])
    barplot(b, 
            horiz=TRUE, 
            las=1, 
            cex.names=.75, 
            border=NA, 
            names.arg=names(arrests[,2:5]), 
            main=input$states, 
            xlim=c(0,max(arrests$Assault)),
            col=c("red","orange","blue","black")
    )
    
    
  })  #end of plot output
  
  ##TEXT OUTPUT
  
  output$text0 <- renderText({ 
    
    paste("State Rank Out of 50 States (high ranks = high crime)")
    
  })
  
  output$text1 <- renderText({ 
    
    m <- cbind(arrange(arrests,arrests[,2],State),mrank=c(1:nrow(arrests)))
    mur<-m$mrank[m$State==input$states]
    paste("Ranking Murder: ",mur)
    
  })
  
  
  output$text2 <- renderText({ 
    
    a <- cbind(arrange(arrests,arrests[,3],State),arank=c(1:nrow(arrests)))
    ast<-a$arank[a$State==input$states]
    paste("Ranking Assault: ",ast)
    
  })
  
  
  output$text3 <- renderText({ 
    
    u <- cbind(arrange(arrests,arrests[,4],State),urank=c(1:nrow(arrests)))
    urb<-u$urank[u$State==input$states]
    paste("Ranking Urban Pop: ",urb)
    
  })
  
  
  output$text4 <- renderText({ 
    
    r <- cbind(arrange(arrests,arrests[,5],State),rrank=c(1:nrow(arrests)))
    rap<-r$rrank[r$State==input$states]
    paste("Ranking Rape: ",rap)
    
  })
  
}) #end of Shiny Server function