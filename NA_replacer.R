NA_replacer <- function(df,BIC_matrix) {

# Ths function finds and replaces NA in df and dfs (maize, wheat and soybeans 2005-2016 prices
# and soybeans 1994-2005 prices) using ARIMA models.
# First df column must contain date.


## DATA SCALING ##

for (i in 2:dim(df)[2]) {
   df[,i] <- df[,i]/100
}



## MEMORY PRE-ALLOCATION ##

NA_list <- rep(list(NA),dim(df)[2]-1)



## NA SEEK ##

for (i in 2:dim(df)[2]) {
  NA_list[[i-1]] <- which(is.na(df[,i]))
}



## NA REPLACER ##

# Models fitting and BIC estimation
for (i in 2:dim(df)[2]) {
   for (j in 1:length(NA_list[[i-1]])) {
      for (p in 1:dim(BIC_matrix)[1]) {
      for (q in 1:dim(BIC_matrix)[2]) {
         BIC_matrix[p,q] <- BIC(arima(df[1:NA_list[[i-1]][j],i],c(p,0,q)))
      }
      }
      df[NA_list[[i-1]][j],i] <- as.numeric(predict(arima(df[1:NA_list[[i-1]][j],i],c(which(BIC_matrix == min(BIC_matrix), arr.ind = TRUE)[1],0,which(BIC_matrix == min(BIC_matrix), arr.ind = TRUE)[2])),n.ahead=1))[1]
   }
}


## DATA RESCALING ##

for (i in 2:dim(df)[2]) {
   df[,i] <- df[,i]*100
}




return(df)

}




    