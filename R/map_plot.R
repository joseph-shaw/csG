
#' Plot Map on ggplot with Background Image
#'
#' This function takes a ggplot object and a map name as inputs, and adds a background image of the map to the plot.
#'
#' @param ggplot A ggplot object to which the map will be added as a background image.
#' @param map_name A character string representing the name of the map image file (without the file extension) located in the "img/" directory.
#' @param map_type A character string representing the type of map.
#'
#' @return A ggplot object with the map added as a background image.
#'
#' @examples
#'
#' # Example usage:
#' gg <- ggplot()
#  map_plot(gg)
#'
#' @import ggplot2
#' @import png
#'
#' @export

map_plot <- function(ggplot, map_name, map_type = "dark"){


  map_type <- ifelse(map_type == "original", "", paste0("_", map_type))

  path <- paste0("img/", map_name, map_type, ".png")

  map <- readPNG(path, native = TRUE)

  ggplot+
    background_image(map)+
    scale_x_continuous(breaks = seq(0, 1000, 50))+
    scale_y_continuous(breaks = seq(0, 1000, 50))+
    coord_cartesian(xlim = c(50, 975), ylim = c(50,975))+
    theme(
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      legend.position = "none"
    )

}



































