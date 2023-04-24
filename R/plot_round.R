
#library(tidyverse)
#library(zoo)
#
#data <- parse_round("C:/Users/shaw_/Documents/Consultancy/Guild/JSON/angels-vs-guild.json", 1)
#
##plot_round
#
#data$grenades <- data$grenades %>%
#  rename(
#    name = throwerName,
#    team = throwerTeam,
#    time = destroytime,
#  )
#
#
#plotdata <- data$locations %>%
#  full_join(data$grenades, by = c("name", "time", "round", "team")) %>%
#  arrange(time) %>%
#  group_by(name) %>%
#  mutate(
#    x = na.approx(x),
#    y = na.approx(y),
#  ) %>%
#  fill(isAlive, .direction = "down")
#
#
#csgo <- map_plot(ggplot(plotdata), map_name = "de_mirage")+
#  geom_point(
#    #data = data$locations,
#    aes(
#      x = position_transform("de_mirage", x, "x"),
#      y = 1025-position_transform("de_mirage", y, "y"),
#      col = team,
#      group = name,
#      shape = isAlive,
#      fill = team
#    ),
#    size = 2#, alpha = 0.1
#  )+
#  geom_point(
#    #data = data$grenades %>% mutate(time = destroytime),
#    aes(
#      x = position_transform("de_mirage", grenadeX, "x"),
#      y = 1025-position_transform("de_mirage", grenadeY, "y"),
#      #col = team,
#      fill = team,
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
#
#csgo <- csgo +
#  #gganimate::transition_time(time = time)+
#  transition_reveal(along = time)
#
#  gganimate::transition_states(time, transition_length = 2, state_length = 0.5)+
#  shadow_wake(wake_length = 0.01, alpha = FALSE)+
#  ease_aes('linear')
#csgo
#
#animate(csgo, height = 5,
#        width = 5, units = "in", fps = 10, duration = 15, res = 150)
#
#
#anim_save("out/gifs/csgo_example.gif")
#


