## Create my own data set with more random numbers 
> seq(as.Date("2014-12-01"), as.Date("2014-12-31"), by="days")
[1] "2014-12-01" "2014-12-02" "2014-12-03" "2014-12-04" "2014-12-05" "2014-12-06" "2014-12-07"
[8] "2014-12-08" "2014-12-09" "2014-12-10" "2014-12-11" "2014-12-12" "2014-12-13" "2014-12-14"
[15] "2014-12-15" "2014-12-16" "2014-12-17" "2014-12-18" "2014-12-19" "2014-12-20" "2014-12-21"
[22] "2014-12-22" "2014-12-23" "2014-12-24" "2014-12-25" "2014-12-26" "2014-12-27" "2014-12-28"
[29] "2014-12-29" "2014-12-30" "2014-12-31"
> dd<-seq(as.Date("2014-12-01"), as.Date("2014-12-31"), by="days")
> length(dd)
[1] 31


types of distributions

standard 
posiion

Bernoulli
Binomial
multi-nomials
normal  - most important distribution, and most useful
Posson - this would be second place most important distribution, used to model counts, mean and variance are equal
standard deviation 
mean


## set the distrbutions
> n=365
> p=0.5
> 
  > normalDist<-rnorm(n)
> poissonDist<-rpois(n,1) #lambda=1
> bernoulliDist<-rbern(n,p) #prob = p
> binomialDist<-rbinom(n,1,p) #size=1,prob=p
> multinomDist<-rmultinom(2, n, p) #n=2,size=n,prob=p

## get the dates
dd<-seq(as.Date("2014-01-01"), as.Date("2014-12-31"), by="days")


## MAKE up the dataset

> 
> df <- data.frame(Date = dd, normalDist = normalDist, poissonDist=poissonDist,
                     + bernoulliDist=bernoulliDist,binomialDist=binomialDist,multinomDist=multinomDist)
> 
> dim(df)
[1] 365   7
> head(df) 
Date normalDist poissonDist bernoulliDist binomialDist multinomDist.1 multinomDist.2
1 2014-01-01 -0.2071097           1             0            1            365            365
2 2014-01-02  0.3949326           2             0            1            365            365
3 2014-01-03  1.4592240           2             0            1            365            365
4 2014-01-04 -0.4022046           1             1            0            365            365
5 2014-01-05  1.2277248           0             0            1            365            365
6 2014-01-06  1.0294580           0             1            1            365            365



################HOW TO RUN THE APPLICATION IN rStudio

> dir()
[1] "project"                  "project.Rproj"            "project_workingExampleV1"
[4] "project_workingExampleV2" "project2_slidify"         "quiz1_q4"                
[7] "slidifyTutorial"         
> dir("./project/")
[1] "distributions.csv" "Notes.R"           "server.R"          "textData2.csv"     "ui.R"             
> 
  > runApp("project/")
