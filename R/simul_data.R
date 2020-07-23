# 1. sample ---------------------------------------------------------------
set.seed(1)
n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', n),
  x1 = rnorm(n, 0, 0.3),
  x2 = rnorm(n, 3, 0.3),
  x3 = rnorm(n, 1, 0.3),
  x4 = rnorm(n, 6, 0.3),
  x5 = rnorm(n, 3, 0.4),
  x6 = rnorm(n, 5, 0.4)
)

id <- paste('id', (n+1):(n+n), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', n),
  x1 = rnorm(n, 0.5, 0.4),
  x2 = rnorm(n, 2.5, 0.4),
  x3 = rnorm(n, 6, 0.3),
  x4 = rnorm(n, 5.6, 0.3),
  x5 = rnorm(n, 2.2, 0.2),
  x6 = rnorm(n, 5.6, 0.3)
)

profile_sample1 <- rbind(data1, data2)
profile_sample1 <- reshape2::melt(profile_sample1, c('id', 'group'))



# 2. sample ---------------------------------------------------------------
set.seed(1)
n <- 50
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', n),
  x1 = rnorm(n, 0, 2),
  x2 = rnorm(n, 3, 2),
  x3 = rnorm(n, 1, 2),
  x4 = rnorm(n, 6, 2),
  x5 = rnorm(n, 3, 2),
  x6 = rnorm(n, 5, 2)
)

id <- paste('id', (n+1):(n+n), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', n),
  x1 = rnorm(n, 0+4.2, 2),
  x2 = rnorm(n, 3+4.3, 2),
  x3 = rnorm(n, 1+4.1, 2),
  x4 = rnorm(n, 6+4.6, 2),
  x5 = rnorm(n, 3+4.2, 2),
  x6 = rnorm(n, 5+4.9, 2)
)

profile_sample2 <- rbind(data1, data2)
profile_sample2 <- reshape2::melt(profile_sample2, c('id', 'group'))



# 3. small sample -----------------------------------------------------------
# sample data
set.seed(1)
n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group = rep('sample', n),
  x1 = rnorm(n, 0, 0.5),
  x2 = rnorm(n, 3, 0.6),
  x3 = rnorm(n, 1, 0.6),
  x4 = rnorm(n, 2, 0.3),
  x5 = rnorm(n, 3, 0.4),
  x6 = rnorm(n, 1, 0.5)
)
data2 <- data.frame(
  id = paste('id_', n+1, sep = ''),
  group = c('test'),
  x1 = c(3.5),
  x2 = c(6),
  x3 = c(4.5),
  x4 = c(4),
  x5 = c(6),
  x6 = c(4)
)

profile_sample3 <- rbind(data1, data2)
profile_sample3 <- reshape2::melt(profile_sample3, c('id', 'group'))


# 4. small sample -----------------------------------------------------------
# sample data
set.seed(1)
n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group = rep('sample', n),
  x1 = rnorm(n, 0, 0.5),
  x2 = rnorm(n, 3, 0.6),
  x3 = rnorm(n, 1, 0.6),
  x4 = rnorm(n, 2, 0.3),
  x5 = rnorm(n, 3, 0.4),
  x6 = rnorm(n, 1, 0.5)
)
data2 <- data.frame(
  id = paste('id_', n+1, sep = ''),
  group = c('test'),
  x1 = c(0.2),
  x2 = c(2),
  x3 = c(3),
  x4 = c(2),
  x5 = c(2.5),
  x6 = c(1.2)
)

profile_sample4 <- rbind(data1, data2)
profile_sample4 <- reshape2::melt(profile_sample4, c('id', 'group'))

# 5. small sample -----------------------------------------------------------
# sample data
set.seed(1)
n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group = rep('sample', n),
  x1 = rnorm(n, 0, 0.5),
  x2 = rnorm(n, 3, 0.6),
  x3 = rnorm(n, 1, 0.6),
  x4 = rnorm(n, 2, 0.3),
  x5 = rnorm(n, 3, 0.4),
  x6 = rnorm(n, 1, 0.5)
)
data2 <- data.frame(
  id = paste('id_', n+1, sep = ''),
  group = c('test'),
  x1 = c(0.2),
  x2 = c(3.1),
  x3 = c(0.9),
  x4 = c(2.1),
  x5 = c(2.5),
  x6 = c(1.2)
)

profile_sample5 <- rbind(data1, data2)
profile_sample5 <- reshape2::melt(profile_sample5, c('id', 'group'))

rm(data1, data2)
# dt <- rbind(dt_tr, dt_te)
# dt <- melt(dt, id.vars=c('id', 'group'), variable.name='x')
# dt_tr <- dt[group=='group1', ]
# dt_te <- dt[group=='group2', ]


# 3. sample ---------------------------------------------------------------
# n <- 40
# id <- paste('id', 1:n, sep = '_')
# data1 <- data.frame(
#   id = id, 
#   group=rep('group1', n),
#   x1 = rnorm(n, 0, 0.3),
#   x2 = rnorm(n, 3, 0.2),
#   x3 = rnorm(n, 1, 0.3),
#   x4 = rnorm(n, 6, 0.4),
#   x5 = rnorm(n, 3, 0.4),
#   x6 = rnorm(n, 5, 0.3)
# )
# 
# id <- paste('id', (n+1):(n+n), sep = '_')
# data2 <- data.frame(
#   id = id, 
#   group=rep('group2', n),
#   x1 = rnorm(n, 0+0.2, 0.3),
#   x2 = rnorm(n, 3-0.2, 0.3),
#   x3 = rnorm(n, 1+0.1, 0.4),
#   x4 = rnorm(n, 6+0.2, 0.3),
#   x5 = rnorm(n, 3-0.2, 0.4),
#   x6 = rnorm(n, 5-0.1, 0.3)
# )
# 
# profile_sample3 <- rbind(data1, data2)
# profile_sample3 <- reshape2::melt(profile_sample3, c('id', 'group'))
# 
