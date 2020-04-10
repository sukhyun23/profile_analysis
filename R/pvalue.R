pvalue <- function(x, new, DF, plot = F) {
  x_mean <- mean(x)
  x_sd <- sd(x)
  
  if (missing(DF)) {
    DF <- length(x)
  }
  
  new_scaled <- (new - x_mean) / x_sd
  
  p_list <- lapply(new_scaled, function(x) pt(x, df=DF))
  
  if (plot) {
    xd <- density(x)
    plot(xd, main='')
    abline(v = new)
  }
  
  return(unlist(lapply(p_list, function(x) min(c(x, 1-x)))))
}