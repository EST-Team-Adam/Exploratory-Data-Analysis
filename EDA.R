EDA <- function(df,w) {

# This function runs a basic analysis of a given dataframe where Date is
# first column.
# analysis[[1]] : Price and Returns plots
# analysis[[2]] : Summaries
# analysis[[3]] : Boxplots
# analysis[[4]] and following : Scatterplots



## MEMORY PRE-ALLOCATION & DATE ##

df_ret <- as.data.frame(matrix(nrow=dim(df)[1]-1,ncol=dim(df)[2]-1,NA))
colnames(df_ret) <- names(df[,2:dim(df)[2]])
analysis <- rep(list(rep(list(NA),dim(df)[2]-1)),dim(df)[2]+2)
date<-seq(as.Date("2005-01-01"), as.Date("2016-06-14"),length = dim(df)[1])

## RETURNS ##
for (i in 2:dim(df)[2]) {
   df_ret[,i-1] <- diff(df[,i])/df[,i][-length(df[,i])]
}

## PLOTS ##
for (i in 2:dim(df)[2]) {
  for (j in 2:dim(df)[2]) {
      par(mfrow=c(2,1))
        plot(date,df[,i],main=names(df)[i],xlab="Observation", ylab="Price",type="line")
             legend("topleft",lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red"),legend= c("Price","LOESS","Spline"))
             lowpass.spline <- smooth.spline(df[,i], spar = NULL)
             lowpass.loess <- loess.as(1:length(date), df[,i], degree = 1, criterion = c("aicc", "gcv")[2], user.span = NULL)
             lines(date,predict(lowpass.spline, 1:length(date), lwd = 2)$y,type="line",col="red")
             lines(date,predict(lowpass.loess, 1:length(date)),type="line",col="blue")
        plot(date[1:length(date)-1],df_ret[,i-1],main=names(df_ret)[i-1],xlab="Observation", ylab="Returns",type="line")
        analysis[[1]][[i-1]] <- recordPlot()
      analysis[[2]][[i-1]] <- summary(df[,i])
      par(mfrow=c(1,1))
        boxplot(df[,j]~rep(1:ceiling(dim(df)[1]/4), each=w)[1:dim(df)[1]],main=names(df_ret)[j-1], xlab="Observation", ylab="Price")
        analysis[[3]][[j-1]] <- recordPlot()
        plot(df[,i]~df[,j],xlab=names(df)[i], ylab=names(df)[j])
      analysis[[i+2]][[j-1]] <- recordPlot()
 }
}

return(analysis)

}



