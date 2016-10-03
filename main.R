## PACKAGES ##
library(fANCOVA)

## CLEAR ALL ##
rm(list = ls())
gc()
source("NA_replacer.R")
source("EDA.R") 

## DATA LOADING ##
df<-read.csv("data_adam.csv")       # Main dataframe which contains 2005-2016 weekly maize, wheat and soybeans prices

## DATA IMPUTATION ##
#df <- NA_replacer_ARMA(df, c(5,1))   # Replaces NA values using ARIMA predictions
df <- NA_replacer_splines(df)   # Replaces NA values using Splines predictions

## ANALYSIS ##
# analysis[[1]] : Price and Returns plots
# analysis[[2]] : Summaries
# analysis[[3]] : Boxplots
# analysis[[4]] and following : Scatterplots

w <- 12                     # Number of weeks to be aggregated in the boxplots
analysis <- EDA(df, w)      # Runs an Exploratory Data Analysis



