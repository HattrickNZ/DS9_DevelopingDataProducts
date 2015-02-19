############################### INITIAL SETUP #################################
#Get the dataset 
print("=============GET THE DATASET ON THE UI SIDE======================")
file<-"distributions.csv"
#dataset<- read.csv(file,as.is=T,nrows=5)  ## don't want factors, just 5 rows
dataset<- read.csv(file,as.is=T)  ## don't want factors, Read ALL

# make sure the 1st colum is in date format of the dataset
if(class(dataset[,1])!= "Date") {dataset[,1]<-as.Date(dataset[,1])}    

############################### INITIAL SETUP #################################
## do some printing to the screen 
print(paste("dataset read in is: ",file,sep=""))
print(paste("number of rows: ",nrow(dataset),sep=""))
print(paste("number of cols: ",ncol(dataset),sep=""))

colNames<-names(dataset)
print("colNames is: ")
print(colNames)
print("str(dataset): ")
print(str(dataset))

shinyUI(
  
  ##p("this is some text..."),
  pageWithSidebar(
    
    headerPanel("SILLYAPPY"),
    
    sidebarPanel(
      h3("A Look At Distributions"),
      p("This App looks at the distribution provided in the given dataset.Use the dropdown below to select the different columns"),
      br(),
      br(),
      p("In the dropdown below are the columns available from the dataset."),
      selectInput('x','Select a column from the data set:',names(dataset)[-1],names(dataset)[2]),
      br(),
      br(),
      p("The dataset here can be download from ",a("here",href="http://www.rstudio.com/shiny")),
      #TO DO:: p(colNames) # would like to display detais of data set here
      br(),
      br(),
      p("For more details on this see the slidify presentation here ",a("here",href="http://www.rstudio.com/shiny")),
      br(),
      p("All code can be seen here ",a("here",href="http://www.rstudio.com/shiny"))
      
    ),
  
    mainPanel(
      textOutput("text1"),  ##TO DO:: would like to control the format here e.g. h3
      plotOutput('myPlot'),
      plotOutput('myPlot2')
      ##TO DO:: display table of dataframe
    )

  )## end of pageWithSidebar
  

)