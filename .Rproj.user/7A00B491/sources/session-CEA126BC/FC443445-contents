




#map_name <- "de_mirage"
#
## read and plot map -------------------------------------------------------
#
#df <- fromJSON(file = "C:/Users/shaw_/Documents/Consultancy/Guild/JSON/angels-vs-guild.json")
#map_data <- fromJSON(file = "data/map_data.json")
#
#my_image <- readPNG(paste0("img/", map_name, "_wt.png"), native = TRUE)
#
#
#map <- read.csv("data/nav_info.csv") %>%
#  filter(
#    mapName == map_name
#  )
#
#test <- parse_round(
#  df,
#  round_number = 5
#)
#
#locs <- lapply(1:36, function(i){
#  parse_round(df, round_number = i)$locations
#})
#
#locs <- data.table::rbindlist(locs, fill = T)
#
#
#grenades <- lapply(1:36, function(i){
#  parse_round(df, round_number = i)$grenades
#})
#
#grenades <- data.table::rbindlist(grenades, fill = T)
#
#
#ggplot(map)+
#  background_image(my_image)+
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
#    size = 12, col = "black" , alpha = 0.2
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
#
#
#
#
#
#ggplot(map)+
#  background_image(my_image)+
#  geom_point(
#    data = grenades[grenades$throwerTeam == "Angels",],
#    aes(
#      x = position_transform(map_name, grenadeX, "x"),
#      y = 1025-position_transform(map_name, grenadeY, "y"),
#      #col = team,
#      fill = grenadeType,
#      col = throwerTeam ,
#      #group = destroyTick,
#      #shape = isAlive
#    ),
#    size = 5, alpha = 0.2, shape = 21
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
#
#
#
#
#
#starts <- locs %>%
#  filter(
#    time < 10,
#    side == "CT",
#    team == "Angels",
#    name == "meo"
#  ) %>%
#  arrange(round, time) %>%
#  mutate(
#    frame = 1:n()
#  )
#
#csgo <- ggplot(starts)+
#  background_image(my_image)+
#  geom_point(
#    aes(
#      x = position_transform("de_mirage", x, "x"),
#      y = 1025-position_transform("de_mirage", y, "y"),
#      #fill = name,
#      #col = name,
#      group = paste(round, name, side),
#      #shape = isAlive
#    ),
#    size = 1, alpha = 1, shape = 21, fill = "black"
#  )+
#  scale_x_continuous(breaks = seq(0, 1000, 50))+
#  scale_y_continuous(breaks = seq(0, 1000, 50))+
#  coord_cartesian(xlim = c(50, 975), ylim = c(50,975))+
#  theme(
#    axis.text = element_blank(),
#    axis.ticks = element_blank(),
#    axis.title = element_blank(),
#    legend.position = "none"
#  )+
#  gganimate::transition_time(time = frame)+
#  ease_aes('linear', interval = 0.1)+
#  shadow_trail(distance = 0.05, max_frames = 4)
#
#animate(csgo, height = 3,
#        width = 3, units = "in", fps = 10, duration = 15, res = 150)
#
#
#+
#  geom_smooth(
#    aes(
#      x = position_transform("de_mirage", x, "x"),
#      y = 1025-position_transform("de_mirage", y, "y"),
#      col = name,
#      group = paste(round, name, side),
#      #shape = isAlive
#    )
#  )+
#  #scale_shape_manual(values = c(4, 21))+
#  scale_x_continuous(breaks = seq(0, 1000, 50))+
#  scale_y_continuous(breaks = seq(0, 1000, 50))+
#  coord_cartesian(xlim = c(50, 975), ylim = c(50,975))+
#  theme(
#    axis.text = element_blank(),
#    axis.ticks = element_blank(),
#    axis.title = element_blank(),
#    legend.position = "none"
#  )
#
#
#
#









