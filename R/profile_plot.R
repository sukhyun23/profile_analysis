# data <- profile_sample3
# group <- 'group'
# variable <- 'variable'
# value <- 'value'
# id <- 'id'
# alpha <- 0.3

profile_plot <- function(
  data, group, variable, value, id, alpha = 0.1, dens = F
) {
  linef <- function (data, variable, value, col = 'black', lwd = 1) {
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
    xlab = variable, ylab = value, 
    xlim = c(min(data[[variable]]), max(data[[variable]])+1)
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
      col = color[i], lwd = 8
    )
  }
  
  # density
  density2 <- function(x) {
    if (length(x) == 1) {
      return(list(x=NA, y=NA))
    } else {
      return(density(x))
    }
  }
  suppressWarnings(
    if (dens) {
      for (i in 1:length(data_list)) {
        dens_list <- tapply(
          data_list[[i]]$value, data_list[[i]]$variable, 
          density2, 
          simplify = F
        )
        minmax_list <- tapply(
          data_list[[i]]$value, data_list[[i]]$variable, 
          function(x) c(min(x), max(x)), simplify = F
        )  
        for (j in 1:length(dens_list)) {
          x <- dens_list[[j]]$y
          y <- dens_list[[j]]$x
          x <- tpa::minmax_norm(x, j, (j+0.5))
          y <- tpa::minmax_norm(y, minmax_list[[j]][1], minmax_list[[j]][2])
          lines(x, y, col = color[i])
          polygon(x, y, col = color_alpha[i], border = F)
        }
      }
    }
  )
  
  # legend
  legend('topleft', legend = unique(data$group), pch = 19, col = color)
  invisible(NULL)
}

