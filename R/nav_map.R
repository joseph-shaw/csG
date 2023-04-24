#nav map

#map <- read.csv("data/nav_info.csv") %>%
#  filter(
#    mapName == "de_mirage"
#  )
#
#
#my_image <- readPNG("img/de_mirage_wt.png", native = TRUE)
#my_image <- readPNG("img/de_mirage_light - flipped.png", native = TRUE)
#
#test$grenades$time <- test$grenades$destroytime
#
#csgo <- ggplot(map)+
#  #annotation_custom(g, xmin=0, xmax=1030, ymin=0, ymax=1030)+
#  background_image(my_image)+
#  #geom_rect(
#  #  data = map,
#  #  aes(
#  #    xmin = position_transform("de_mirage", southEastX, "x"),
#  #    ymin = position_transform("de_mirage", southEastY, "y"),
#  #    xmax = position_transform("de_mirage", northWestX, "x"),
#  #    ymax = position_transform("de_mirage", northWestY, "y")
#  #  ),
#  #  fill = "white", alpha = 0.5
#  #)+
#  geom_point(
#    data = test$locations,
#    aes(
#      x = position_transform("de_mirage", x, "x"),
#      y = 1025-position_transform("de_mirage", y, "y"),
#      col = team,
#      group = name,
#      shape = isAlive
#    ),
#    size = 2,       fill = "white" #, alpha = 0.1
#  )+
#  geom_point(
#    data = as.data.frame(test$grenades),
#    aes(
#      x = position_transform("de_mirage", grenadeX, "x"),
#      y = 1025-position_transform("de_mirage", grenadeY, "y"),
#      #col = team,
#      fill = throwerTeam,
#      #group = destroyTick,
#      #shape = isAlive
#    ),
#    size = 12, col = "white" , alpha = 0.5
#  )+
#  scale_shape_manual(values = c(4, 21))+
#  scale_x_continuous(breaks = seq(0, 1000, 50))+
#  scale_y_continuous(breaks = seq(0, 1000, 50))+
#  coord_cartesian(xlim = c(50, 975), ylim = c(50,975))+
#  theme(
#    axis.text = element_blank(),
#    axis.ticks = element_blank(),
#    axis.title = element_blank(),
#    legend.position = "none"
#  )
#csgo
#
##csgo +
##  gganimate::transition_time(time = time)+
##  ease_aes('linear', interval = 0.001)
##
##
##animate(csgo, height = 5,
##        width = 5, units = "in", fps = 10, duration = 15, res = 150)
##
##
##anim_save("out/gifs/csgo_example.gif")
#
#
#
#
#
