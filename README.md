# Exploratory-Data-Analysis on Prices
The aim of this EDA is to underline the major events that characterised Wheat, Maize, Soybeans and Rice prices and volatility evolution.
## Data
Data used are Wheat, Maize, Soybeans and Rice price series taken from GIEWS.
For each commodity the series are composed by 598 weekly prices: a time span of 11 years and 5 months from January 2005 to June 2016.

Wheat price series has 3 NA values as have been counted 5 NA in Maize prices, 9 NA in Soybeans prices and 42 NA in Rice price series. All NA values are replaced using ARMA predictions.
## Analysis description
The analysis is composed by four parts: price and returns plots, whole series summaries, scatterplots and boxplots.
The aim of this description is to give the grasp of the overall series characteristic through a graphical and qualitative approach, therefore price plots will be used to identify the trends, returns and boxplots will underline the periods of high volatility and scatterplots are for relationships amongst the commodities identification.
## Prices and returns
By looking at commodities prices it's possible to notice a big increase in all of them during 2008. For all the commodities but rice this trend started in 2007 in the context of 2007-2008 World Food Price Crisis, then the trend inverted itself at the end of 2008. Rice followed a similar path, but the steady increase in prices started few months later the other commodities.

A second peak in commodity prices started at the end of 2010 but the magnitude as the duration of the high prices context is different for each commodity. Prices in 2011 increased arriving just below 2008 level for wheat, they were at the almost same level for soybeans, they surpassed 2008 prices in case of Maize while rice prices remained relatively low if compared to 2008 levels.
On one hand this high price environment lasted until 2014 for wheat, where prices decreased almost smoothly, and soybeans, on the other hand maize faced an almost sudden price decrease at the end of 2013, although 2011 prices were higher than 2008, and rice prices started decreasing at the very beginning of 2013.

An overall decreasing trend can be noticed starting in first half 2014 on all commodities as for all commodities except wheat a price increase is observed in 2016.

By analyzing returns it's possible to notice that, if compared to 2008 spikes, rice is characterised by less volatility than wheat, maize and soybeans. Moreover returns confirm the overall description given before, in particular for 2016 increasing maize, soybeans and rice prices.
## Box-plots
The box-plots show that rice has a peak in volatility in 2008 while, if compared to the other commodities, it appears less variable than wheat, maize and soybeans in the following times.

Wheat shows great volatility both in 2008, 2011 and following periods. However it has to be underlined the fact that wheat 2011 volatility can be probably compared to maize one, while soybean volatility on the same period seems to be less. Rice on the other hand shows less volatility than wheat, maize and soybeans for the period starting from 2011. Soybean and Rice show greater than wheat and maize volatility in 2016.
##Scatter-plots
All price series show positive correlation with other commodities series.

Heteroskedasticity is particularly evident in Maize-Wheat, Wheat-Soybeans, Wheat-Rice, Maize-Rice, Soybeans-Rice.
## Conclusions
As expected wheat, maize, soybeans and rice prices follow loosely similar trends, but they show very different behaviors around the same patterns. 

Given such differences and available articles it may be of interest to study if scraped articles sentiment is somehow correlated to 2016 Maize, Soybeans and Rice price increase. Moreover it could be interesting to to compare wheat sentiment to wheat steadily decreasing 2016 price.  

