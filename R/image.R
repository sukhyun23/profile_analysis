source('/home/sukhyun/project/profile_analysis/R/simul_data.R')
source('/home/sukhyun/project/profile_analysis/R/profile_plot.R')
source('/home/sukhyun/project/profile_analysis/R/contrast_matrix.R')

library(magrittr)

profile_plot(
  data = profile_sample1, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = T, color = c('deeppink4', 'dodgerblue2')
)

profile_plot(
  data = profile_sample2, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = T, color = c('dodgerblue2', 'deeppink4')
)

###

profile_plot(
  data = profile_sample5, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = T, color = c('dodgerblue2', 'deeppink4'),
  main = 'Normal'
)
profile_plot(
  data = profile_sample5, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = F, color = c('dodgerblue2', 'deeppink4'),
  main = 'Normal'
)

profile_plot(
  data = profile_sample3, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = T, color = c('dodgerblue2', 'deeppink4'),
  main = 'Outlier : level'
)

profile_plot(
  data = profile_sample4, 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = T, color = c('dodgerblue2', 'deeppink4'),
  main = 'Outlier : parallel'
)

tdat <- reshape2::dcast(profile_sample4, id+group~variable, value.var = 'value')
mat <- as.matrix(tdat[, -c(1,2)])
cmat <- mat %*% contrast_matrix(mat)
profile_plot(
  data = profile_sample4[profile_sample4$variable %in% c('x2', 'x3'), ], 
  group = 'group', variable = 'variable', value = 'value', id = 'id', 
  alpha = 0.3, dens = F, color = c('dodgerblue2', 'deeppink4')
)

dens <- density(cmat[,2][-101])
plot(
  x=dens$x, y=dens$y, 'l', xlim = c(-1.2, 5), 
  xlab = 'x2 - x3', ylab = 'density' 
)
abline(v = cmat[,2][101], col='deeppink4', lwd = 3)
legend('topright', legend = 'test case', pch = 19, col = 'deeppink4')


idx <- profile_sample3$group == 'sample' & profile_sample3$variable == 'x1'
dens <- density(profile_sample3[idx, ]$value)
plot(
  x=dens$x, y=dens$y, 'l', xlim = c(-1.5, 4), 
  xlab = 'x1', ylab = 'density' 
)
idx <- profile_sample3$group != 'sample' & profile_sample3$variable == 'x1'
abline(v = profile_sample3[idx, ]$value, col='deeppink4', lwd = 3)
legend('topright', legend = 'test case', pch = 19, col = 'deeppink4')





