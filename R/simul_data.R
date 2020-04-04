vignette()

library(profileR)
library(reshape2)  

n <- 100
id <- paste('id', 1:n, sep = '_')
data1 <- data.frame(
  id = id, 
  group=rep('group1', 100),
  x1 = rnorm(100, 0, 1),
  x2 = rnorm(100, 3, 1),
  x3 = rnorm(100, 1, 1),
  x4 = rnorm(100, 6, 1),
  x5 = rnorm(100, 3, 1),
  x6 = rnorm(100, 5, 1)
)

id <- paste('id', (n+1):(n+100), sep = '_')
data2 <- data.frame(
  id = id, 
  group=rep('group2', 100),
  x1 = rnorm(100, 1, 1),
  x2 = rnorm(100, 2, 1),
  x3 = rnorm(100, 4, 1),
  x4 = rnorm(100, 3, 1),
  x5 = rnorm(100, 3, 1),
  x6 = rnorm(100, 5, 1)
)
data1 %>% head()
data2 %>% head()

data <- rbind(data1, data2)
data <- reshape2::melt(data, c('id', 'group'))
data %>% head()


group <- 'group'
variable <- 'variable'
value <- 'value'
id <- 'id'

profile_plot <- function(data, group, varialbe, value, alpha = 0.1) {
  linef <- function (data, varialbe, value, col = 'black', lwd = 1) {
    lines(data[[variable]], data[[value]], col = col, lwd = lwd)
    invisible(NULL)
  }
  
  x_label <- as.character(data[[variable]])
  if (is.character(data[[variable]])) {
    data[[variable]] <- as.numeric(as.factor(data[[variable]]))
  } else if (is.factor(data[[variable]])) {
    data[[variable]] <- as.numeric(data[[variable]])
  }
  
  data_list <- split(data, data[[group]])
  
  # lines
  color <- suppressWarnings(
    RColorBrewer::brewer.pal(length(data_list), 'Set1')
  )
  color <- color[1:length(data_list)]
  
  color_alpha <- c()
  plot(
    data[[variable]], data[[value]], type='n', xaxt = 'n',
    xlab = variable, ylab = value
  )
  axis(1, labels = unique(x_label), at = unique(data[[variable]]))
  for (i in 1:length(data_list)) {
    rgb_value <- col2rgb(color[i])
    color_alpha[i] <- 
      rgb(rgb_value[1], rgb_value[2], rgb_value[3], max = 255, 
          alpha = (100 - (1-alpha)*100) * 255 / 100)
    by(
      data_list[[i]], data_list[[i]][[id]], 
      function(x) linef(x, variable, value, col = color_alpha[i])
    )
  }
  
  # mean
  x_tmp <- unique(data_list[[i]]$variable)
  for (i in 1:length(data_list)) {
    lines(
      x_tmp, 
      tapply(data_list[[i]]$value, data_list[[i]]$variable, mean),
      col = color[i], lwd = 3.5
    )
  }
  
  # legend
  legend('topright', legend = unique(data$group), pch = 19, col = color)
  invisible(NULL)
}

profile_plot(data, 'group', 'variable', 'value', 0.1)

library(dplyr)
data[data$spouse == 'Husband' & data$variable == 1,]$value %>% mean



color[2]


by(data, data[[group]], function(x) linef(x, variable, value))

plot(
  data_list[[1]]$variable,
  data_list[[1]]$value,
  type = 'l'
)

lines(
  data[data[group] == 'Husband' & data[variable] == 'item1', ]$variable,
  data[data[group] == 'Husband' & data[variable] == 'item1', ]$value
)

data[data$variable == 1, ]

mod <- pbg(spouse[, 1:4], spouse[, 5], profile.plot = TRUE)
           