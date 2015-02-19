############################### INITIAL SETUP #################################
library(UsingR)                                                               #
data(galton)                                                                  #                                                               
                                                                              #
#Get the dataset                                                              #
print("=============GET THE DATASET ON THE SERVER SIDE======================")#
file<-"distributions.csv"                                                     #
#dataset<- read.csv(file,as.is=T,nrows=5)  ## don't want factors
dataset<- read.csv(file,as.is=T)  ## don't want factors, Read ALL             #
                                                                              #
# make sure the 1st colum is in date format of the dataset                    #
if(class(dataset[,1])!= "Date") {dataset[,1]<-as.Date(dataset[,1])}           #
###############################################################################

shinyServer(
  function(input, output) {
    
    output$text1 <- renderText({ 
     paste("You have selected", input$x)
   })
   
   ## this will be a basic plot of 1 column
   output$myPlot <- renderPlot({
     hist(dataset[,input$x], xlab=input$x, col='lightblue',main=paste('Histogram for column:',input$x))
     #mu <- input$mu
     #lines(c(mu, mu), c(0, 200),col="red",lwd=5)
     #mse <- mean((galton$child - mu)^2)
     #text(63, 150, paste("mu = ", mu))
     #text(63, 140, paste("MSE = ", round(mse, 2)))
   })
   
   
   output$myPlot2 <- renderPlot({
     plot(dataset[,1],dataset[,input$x],type="b",
          xaxt = "n",
          main=paste("plot(",names(dataset)[1],",",input$x,")",sep=""),
          col="red",lwd=1,
          xlab="Date",
          ylab=input$x)
     ## TO DO:: axis(1, at=1:length(dataset[,1]), labels=factor(dataset[,1]))
     axis(1, at=dataset[,1][seq(1,length(dataset[,1]),by=round(length(dataset[,1])/10))],
          labels=dataset[,1][seq(1,length(dataset[,1]),by=round(length(dataset[,1])/10))],
          format(dataset[,1], "%Y %b %d"), cex.axis = .7, las = 3)
     #mu <- input$mu
     #lines(c(mu, mu), c(0, 200),col="red",lwd=5)
     #mse <- mean((galton$child - mu)^2)
     #text(63, 150, paste("mu = ", mu))
     #text(63, 140, paste("MSE = ", round(mse, 2)))
   })
   
  }
)