#' Parse Match Function
#'
#' This function parses a match JSON file and extracts various data elements such as locations, grenades, kills, bomb events, round details, damage, and weapon fires.
#'
#' @param file_path The file path of the match JSON file.
#'
#' @return A list containing the extracted data elements in data frames.
#'
#' @examples
#' file_path <- "C:/Users/shaw_/Documents/Consultancy/Guild/JSON/angels-vs-guild.json"
#' test <- parse_match(file_path = file_path)
#'
#' @importFrom rjson fromJSON
#' @importFrom data.table rbindlist
#'
#' @export

parse_match <- function(file_path){

  match_json <- fromJSON(file = file_path)
  n_rounds <- length(match_json$gameRounds)

  locations <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$locations
  })

  grenades <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$grenades
  })

  kills <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$kills
  })

  bomb_events <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$bomb_events
  })

  damage <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$damage
  })

  weapon_fires <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$weapon_fires
  })

  round_details <- lapply(1:n_rounds, function(i){
    parse_round(match_json, round_number = i)$round_details
  })

  locations  =    as.data.frame(data.table::rbindlist(locations, fill = T))
  grenades =      as.data.frame(data.table::rbindlist(grenades, fill = T))
  kills =         as.data.frame(data.table::rbindlist(kills, fill = T))
  bomb_events =   as.data.frame(data.table::rbindlist(bomb_events, fill = T))
  round_details = as.data.frame(data.table::rbindlist(round_details, fill = T))
  damage =        as.data.frame(data.table::rbindlist(damage, fill = T))
  weapon_fires =  as.data.frame(data.table::rbindlist(weapon_fires, fill = T))

  list(
    locations  =  locations,
    grenades =      grenades,
    kills =         kills,
    bomb_events =   bomb_events,
    round_details = round_details,
    damage =        damage,
    weapon_fires  = weapon_fires
  )

}
