# Ths function finds and replaces NA in df and dfs (maize, wheat and soybeans 2005-2016 prices
# and soybeans 1994-2005 prices) using ARIMA models.
# First df column must contain date.

NA_replacer <- function(df, pq=c(1,1)) {
  
  if(!is.data.frame(df)){
    df <- data.frame(df)
  }
  commodity.columns <- colnames(df)[colnames(df)!='Date']
  
  ## NA SEEK & REPLACE ##
  # Models fitting and BIC estimation
  data.frame('Date'=df[,'Date'],
        sapply(df[,commodity.columns], function(column){
          
          ## DATA SCALING ##
          column <- column / 100
          NA.ind <- which(is.na(column))
          min.BIC <- -1
          opt.pq <- c(NA, NA)
          
          for (j in 1:length(NA.ind)) {
            for (p in 1:pq[1]) {
              for (q in 1:pq[2]) {
                bic <- BIC(arima(column[1:NA.ind[j]],c(p,0,q)))
                if(bic < min.BIC){
                  min.BIC <- bic
                  opt.pq <- c(p, q)
                }
              }
            }
            column[NA.ind[j]] <- as.numeric(
              predict(arima(column[1:NA.ind[j]], c(opt.pq[1], 0, opt.pq[2])), n.ahead=1))[1]
          }
          ## DATA RESCALING ##
          column * 100
          })
        )
}




    