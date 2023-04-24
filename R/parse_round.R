#' Parse Round Data
#'
#' This function parses the round data from a dataframe and extracts various
#' components such as player coordinates, bomb events, grenades, kills, weapon
#' fires, round details, and damage. The parsed data is returned as a list of
#' dataframes.
#'
#' @param df A dataframe containing the round data.
#' @param round_number The round number to parse.
#'
#' @return A list containing the parsed round data, including player coordinates,
#' bomb events, grenades, kills, weapon fires, round details, and damage.
#'
#' @import ggpubr
#' @import rjson
#' @import tidyverse
#' @import gganimate
#' @import png
#' @import grid
#' @import data.table
#'
#' @examples
#'
#' @export
#'
parse_round <- function(file_path, round_number){

  # Load required libraries
  library(ggpubr)
  library(rjson)
  library(tidyverse)
  library(gganimate)
  library(png)
  library(grid)

  df <- rjson::fromJSON(file = file_path)

  round <- lapply(df$gameRounds, unlist, recursive = F)[[round_number]]

  # Round Details -----------------------------------------------------------

  round_details <- as.data.frame((round[c(1:26, 28)]))  # Extract round details from the round data

  # Bomb Events -------------------------------------------------------------

  bomb_events <- round[grepl("bomb", names(round))]        # Extract bomb events from the round data
  bomb_events <- data.table::rbindlist(bomb_events[2:length(bomb_events)])  # Combine bomb events into a single data table
  plant_tick <- bomb_events$tick[bomb_events$bombAction == "plant"]   # Get tick value of bomb planting event
  plant_sec  <- bomb_events$seconds[bomb_events$bombAction == "plant"]  # Get seconds value of bomb planting event

  if(!is.null(plant_tick)){
    bomb_events <- bomb_events %>%
      mutate(
        time = ifelse(tick > plant_tick, seconds + plant_sec, seconds),  # Adjust time values based on bomb planting event
        round = round_number  # Add round number to the data
      )
  }

  # Player Coordinates ------------------------------------------------------

    frames <- round[grepl("frame", names(round))]


    ctPlayers <- lapply(frames, function(y){
      df = y$ct$players
    })

    tPlayers <- lapply(frames, function(y){
      df = y$t$players
    })

    ticks <- data.table::rbindlist(lapply(frames, function(z){z[2:4]}))


    locations <- rbind(
      cbind(data.table::rbindlist(lapply(ctPlayers, function(z){z[[1]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(ctPlayers, function(z){z[[2]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(ctPlayers, function(z){z[[3]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(ctPlayers, function(z){z[[4]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(ctPlayers, function(z){z[[5]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(tPlayers, function(z){z[[1]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(tPlayers, function(z){z[[2]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(tPlayers, function(z){z[[3]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(tPlayers, function(z){z[[4]][1:25]})), ticks),
      cbind(data.table::rbindlist(lapply(tPlayers, function(z){z[[5]][1:25]})), ticks)
    ) %>%
      group_by(name) %>%
      arrange(tick) %>%
      mutate(
        time = seconds
      )

    if(!is.null(plant_tick)){
      locations <- locations %>%
        mutate(
          time = ifelse(tick > plant_tick, seconds + plant_sec, seconds),
          round = round_number
        )
    }

  # Grenades --------------------------------------------------------------

  grenades <- round[grepl("grenade", names(round))]
  grenades <- data.table::rbindlist(grenades) %>%
    mutate(
      throwtime = throwSeconds,
      destroytime = destroySeconds
    )

  if(!is.null(plant_tick)){
    grenades <- grenades %>%
      mutate(
        throwtime = ifelse(throwTick > plant_tick, throwSeconds + plant_sec, throwSeconds),
        destroytime = ifelse(destroyTick > plant_tick, destroySeconds + plant_sec, destroySeconds),
        round = round_number
      )
  }

  # Kills -------------------------------------------------------------------

  kills <- round[grepl("kill", names(round))]
  kills <- data.table::rbindlist(kills) %>%
    mutate(
      time = seconds
    )

  if(!is.null(plant_tick)){
    kills <- kills %>%
      mutate(
        time = ifelse(tick > plant_tick, seconds + plant_sec, seconds),
        round = round_number
      )
  }


  # Weapon Fires ------------------------------------------------------------

  weapon_fires <- round[grepl("weapon", names(round))]
  weapon_fires <- data.table::rbindlist(weapon_fires) %>%
    mutate(
      time = seconds
    )

  if(!is.null(plant_tick)){
    weapon_fires <- weapon_fires %>%
      mutate(
        time = ifelse(tick > plant_tick, seconds + plant_sec, seconds),
        round = round_number
      )
  }



  # Damage ------------------------------------------------------------------

  damage <- round[grepl("damage", names(round))]
  damage <- data.table::rbindlist(damage) %>%
    mutate(
      time = seconds
    )

  if(!is.null(plant_tick)){
    damage <- damage %>%
      mutate(
        time = ifelse(tick > plant_tick, seconds + plant_sec, seconds),
        round = round_number
      )
  }

  return(
    list(
      locations = locations,
      grenades = grenades,
      kills = kills,
      bomb_events = bomb_events,
      round_details = round_details,
      damage = damage,
      weapon_fires = weapon_fires
    )
  )

}
