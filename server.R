#setwd("DevelopingDataProducts")
# folder: census-app

#server.R

library(shiny)
attach(arrests)

# Rely on the 'USArrests' dataset in the datasets
# package (which generally comes preloaded).



# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  data <- reactive({ 
    c(mur<-m$mrank[m$State==input$states],
    ast<-a$arank[a$State==input$states],
    urb<-u$urank[u$State==input$states],
    rap<-r$rrank[r$State==input$states]) 
    
  })
   
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