ReadMe.md

For course project for Developing Data Products in the Data Science on courseera.org

#How to run 

```
> library(shiny)
> 
> dir()
[1] "project"                 "slidify_part_of_project"
> library(shiny)
> runApp("project/")
```


# Creating my distributions dataset

```
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

> write.csv(df,file="distributions.csv",row.names=F)

```

#Useful Links
working shiny app
Slidify presentation
