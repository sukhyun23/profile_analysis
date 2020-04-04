# 1. sample ---------------------------------------------------------------
n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', n),
  x1 = rnorm(n, 0, 0.7),
  x2 = rnorm(n, 3, 0.7),
  x3 = rnorm(n, 1, 0.8),
  x4 = rnorm(n, 6, 0.6),
  x5 = rnorm(n, 3, 0.7),
  x6 = rnorm(n, 5, 0.8)
)

id <- paste('id', (n+1):(n+n), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', n),
  x1 = rnorm(n, 0.5, 0.8),
  x2 = rnorm(n, 2.5, 0.6),
  x3 = rnorm(n, 4, 0.6),
  x4 = rnorm(n, 5.6, 0.5),
  x5 = rnorm(n, 2.2, 0.7),
  x6 = rnorm(n, 5.6, 0.8)
)

profile_sample1 <- rbind(data1, data2)
profile_sample1 <- reshape2::melt(profile_sample1, c('id', 'group'))



# 2. sample ---------------------------------------------------------------
n <- 30
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', n),
  x1 = rnorm(n, 0, 0.7),
  x2 = rnorm(n, 3, 0.7),
  x3 = rnorm(n, 1, 0.8),
  x4 = rnorm(n, 6, 0.6),
  x5 = rnorm(n, 3, 0.7),
  x6 = rnorm(n, 5, 0.8)
)

id <- paste('id', (n+1):(n+n), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', n),
  x1 = rnorm(n, 0+4.2, 0.8),
  x2 = rnorm(n, 3+4.3, 0.6),
  x3 = rnorm(n, 1+4.1, 0.6),
  x4 = rnorm(n, 6+4.6, 0.5),
  x5 = rnorm(n, 3+4.2, 0.7),
  x6 = rnorm(n, 5+4.9, 0.8)
)

profile_sample2 <- rbind(data1, data2)
profile_sample2 <- reshape2::melt(profile_sample2, c('id', 'group'))


# 2. sample ---------------------------------------------------------------
n <- 80
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', n),
  x1 = rnorm(n, 0, 0.7),
  x2 = rnorm(n, 3, 0.7),
  x3 = rnorm(n, 1, 0.8),
  x4 = rnorm(n, 6, 0.6),
  x5 = rnorm(n, 3, 0.7),
  x6 = rnorm(n, 5, 0.8)
)

id <- paste('id', (n+1):(n+n), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', n),
  x1 = rnorm(n, 0+0.2, 0.8),
  x2 = rnorm(n, 3-0.2, 0.6),
  x3 = rnorm(n, 1+0.1, 0.6),
  x4 = rnorm(n, 6+0.2, 0.5),
  x5 = rnorm(n, 3-0.2, 0.7),
  x6 = rnorm(n, 5-0.1, 0.8)
)

profile_sample3 <- rbind(data1, data2)
profile_sample3 <- reshape2::melt(profile_sample3, c('id', 'group'))

rm(data1, data2)