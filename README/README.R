source('/home/sukhyun/profile_analysis/R/simul_data.R')


profile_plot(
  profile_sample1, 'group', 'variable', 'value', 'id', dens = T, alpha = 0.3
)
profile_sample1_t <- reshape2::dcast(
  profile_sample1, id + group ~ variable, value.var =  'value'
)
result1 <- profileR::pbg(profile_sample1_t[, 3:8], profile_sample1_t$group)
summary(result1)





profile_plot(
  profile_sample2, 'group', 'variable', 'value', 'id', dens = T, alpha = 0.3
)
profile_sample2_t <- reshape2::dcast(
  profile_sample2, id + group ~ variable, value.var =  'value'
)
result2 <- profileR::pbg(profile_sample2_t[, 3:8], profile_sample2_t$group)
summary(result2)





profile_plot(
  profile_sample3, 'group', 'variable', 'value', 'id', dens = T, alpha = 0.3
)
profile_sample3_t <- reshape2::dcast(
  profile_sample3, id + group ~ variable, value.var =  'value'
)
# data
p3_1 <- profile_sample3[profile_sample3$group == 'group1']
p3_2 <- profile_sample3[profile_sample3$group == 'group2']

# level
p3_list1 <- split(p3_1, p3_1$variable)
p3_list2 <- split(p3_2, p3_2$variable)

p_level <- Map(
  function(x, new) pvalue(x, new),
  x = lapply(p3_list1, function(x) x$value),
  new = lapply(p3_list2, function(x) x$value)
)
unlist(p_level)

# parallel
p3_1_t <- reshape2::dcast(p3_1, id + group ~ variable, value.var =  'value')
p3_2_t <- reshape2::dcast(p3_2, id + group ~ variable, value.var =  'value')

mat1 <- as.matrix(p3_1_t[, 3:8])
mat2 <- as.matrix(p3_2_t[, 3:8])

cmat1 <- contrast_matrix(mat1)
cmat2 <- contrast_matrix(mat2)

parl1 <- mat1 %*% cmat1
parl2 <- mat2 %*% cmat2

p_parallel <- Map(
  function(x, new) pvalue(x, new),
  x = as.data.frame(parl1),
  new = as.data.frame(parl2)
)
names(p_parallel) <- c('x1-x2', 'x2-x3', 'x3-x4', 'x4-x5', 'x5-x6')
p_parallel <- unlist(p_parallel)


knitr::knit('./README/README.Rmd')

