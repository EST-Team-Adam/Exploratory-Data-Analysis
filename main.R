## PACKAGES ##

## CLEAR ALL ##

rm(list = ls())



## DATA LOADING ##

df<-read.csv("data_adam.csv")       # Main dataframe which contains 2005-2016 weekly maize, wheat and soybeans prices


## NA ##

BIC_matrix <- matrix(nrow=5,ncol=1,NA)   # Change p,q of ARIMA by changing p rows and q columns of the BIC matrix
source("NA_replacer.r")                  # Replaces NA values using ARIMA predictions
df <- NA_replacer(df,BIC_matrix)



## ANALYSIS ##
# analysis[[1]] : Price and Returns plots
# analysis[[2]] : Summaries
# analysis[[3]] : Boxplots
# analysis[[4]] and following : Scatterplots

w <- 12                     # Number of weeks to be aggregated in the boxplots
source("EDA.r")             # Runs an Exploratory Data Analysis
analysis <- EDA(df,w)






