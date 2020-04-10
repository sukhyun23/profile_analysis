contrast_matrix <- function(x) {
  x_mat <- as.matrix(x)
  p <- ncol(x_mat)
  n <- nrow(x_mat)
  
  cmat <- matrix(0, nrow=p, ncol=p-1)
  idx_mat <- Map(function(x, y) c(x, y), x=1:(p-1), y=(2:p))
  
  for (i in 1:ncol(cmat)) {
    cmat[idx_mat[[i]], i] <- c(1, -1)
  }
  
  cmat
}
