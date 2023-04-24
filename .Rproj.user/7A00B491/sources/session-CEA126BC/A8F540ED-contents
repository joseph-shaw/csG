#' Plot Grenades on a Map
#'
#' This function plots grenades on a map using ggplot2. It takes a data frame of grenade data, and optional parameters to specify which types of grenades to plot, and the map name.
#'
#' @param data A data frame containing grenade data
#' @param smoke Logical indicating whether to plot smoke grenades (default is TRUE)
#' @param flash Logical indicating whether to plot flashbang grenades (default is TRUE)
#' @param incendiary Logical indicating whether to plot incendiary grenades (default is TRUE)
#' @param molotov Logical indicating whether to plot molotov grenades (default is TRUE)
#' @param he Logical indicating whether to plot HE grenades (default is TRUE)
#' @param map A character string specifying the name of the map to plot the grenades on
#'
#' @return A ggplot2 plot object
#'
#' @examples
#' #data <- parse_round("C:/Users/shaw_/Documents/Consultancy/Guild/JSON/angels-vs-guild.json", 15)
#' #plot_grenades(data, smoke = TRUE, flash = TRUE, incendiary = TRUE, molotov = TRUE, he = TRUE, map = "de_mirage")
#'
#' @import ggplot2
#' @import dplyr


#data <- parse_round("C:/Users/shaw_/Documents/Consultancy/Guild/JSON/angels-vs-guild.json", 15)$grenades

plot_grenades <- function(data, smoke = T, flash = T, incendiary = T, molotov = T, he = T, map){

data <- data$grenades

smoke_grenades <- data %>% filter(grenadeType == "Smoke Grenade")
flash_grenades <- data %>% filter(grenadeType == "Flashbang")
incendiary_grenades <- data %>% filter(grenadeType == "Incendiary Grenade")
molotov_grenades <- data %>% filter(grenadeType == "Molotov")
he_grenades <- data %>% filter(grenadeType == "HE Grenade")


plot <- map_plot(ggplot(data), map_name = map)
  #smoke
  if(smoke){
  plot <- plot+
  geom_segment(
    data = smoke_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      xend = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, throwerY, "y"),
      yend = 1025 - position_transform(map, grenadeY, "y")
    ),
    col = "darkgrey", size = 0.2
  )+
  geom_point(
    data = smoke_grenades,
    aes(
      x = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, grenadeY, "y")
    ),
    shape = 21, size = 6, fill = "lightgrey", alpha = 0.5, col = "white", stroke = 0.2
  )+
  geom_point(
    data = smoke_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      y = 1025 - position_transform(map, throwerY, "y")
    ),
    shape = 21, size = 1, fill = "grey", alpha = 1, col = "white", stroke = 0.2
  )
  }
  # Flash
  if(flash){
    plot <- plot+
  geom_segment(
    data = flash_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      xend = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, throwerY, "y"),
      yend = 1025 - position_transform(map, grenadeY, "y")
    ),
    col = "orange", size = 0.2
  )+
  geom_point(
    data = flash_grenades,
    aes(
      x = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, grenadeY, "y")
    ),
    shape = 21, size = 6, fill = "orange", alpha = 0.5, col = "darkorange", stroke = 0.2
  )+
  geom_point(
    data = flash_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      y = 1025 - position_transform(map, throwerY, "y")
    ),
    shape = 21, size = 1, fill = "orange", alpha = 1, col = "darkorange", stroke = 0.2
  )
  }
  # Incendiary
  if(incendiary){
    plot <- plot+

  geom_segment(
    data = incendiary_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      xend = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, throwerY, "y"),
      yend = 1025 - position_transform(map, grenadeY, "y")
    ),
    col = "red", size = 0.2
  )+
  geom_point(
    data = incendiary_grenades,
    aes(
      x = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, grenadeY, "y")
    ),
    shape = 21, size = 6, fill = "red", alpha = 0.5, col = "darkred", stroke = 0.2
  )+
  geom_point(
    data = incendiary_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      y = 1025 - position_transform(map, throwerY, "y")
    ),
    shape = 21, size = 1, fill = "red", alpha = 1, col = "darkred", stroke = 0.2
  )
  }
  # Molotov
  if(molotov){
    plot <- plot+

  geom_segment(
    data = molotov_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      xend = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, throwerY, "y"),
      yend = 1025 - position_transform(map, grenadeY, "y")
    ),
    col = "green", size = 0.2
  )+
  geom_point(
    data = molotov_grenades,
    aes(
      x = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, grenadeY, "y")
    ),
    shape = 21, size = 6, fill = "green", alpha = 0.5, col = "darkgreen", stroke = 0.2
  )+
  geom_point(
    data = molotov_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      y = 1025 - position_transform(map, throwerY, "y")
    ),
    shape = 21, size = 1, fill = "green", alpha = 1, col = "darkgreen", stroke = 0.2
  )
  }
  if(he){
    plot <- plot+

  # HE grenades
  geom_segment(
    data = he_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      xend = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, throwerY, "y"),
      yend = 1025 - position_transform(map, grenadeY, "y")
    ),
    col = "cyan", size = 0.2
  )+
  geom_point(
    data = he_grenades,
    aes(
      x = position_transform(map, grenadeX, "x"),
      y = 1025 - position_transform(map, grenadeY, "y")
    ),
    shape = 21, size = 6, fill = "cyan", alpha = 0.5, col = "cyan3", stroke = 0.2
  )+
  geom_point(
    data = he_grenades,
    aes(
      x = position_transform(map, throwerX, "x"),
      y = 1025 - position_transform(map, throwerY, "y")
    ),
    shape = 21, size = 1, fill = "cyan", alpha = 1, col = "cyan3", stroke = 0.2
  )
  }
return(plot)

}

