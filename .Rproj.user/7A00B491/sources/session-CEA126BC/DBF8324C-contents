#' Position Transform Function
#'
#' This function transforms X or Y coordinates based on the map name, starting position, and scale factor obtained from a predefined map data.
#'
#' @param map_name The name of the map for which the transformation is needed.
#' @param position The X or Y coordinate to be transformed.
#' @param axis The axis on which the transformation is to be applied, either "x" or "y".
#'
#' @return The transformed X or Y coordinate based on the map name, starting position, and scale factor.
#'
#' @examples
#' position_transform("de_nuke", position = 2300, axis = "x")
#'
#' @export
#'

position_transform <- function(map_name, position, axis){

  map_data <- rjson::fromJSON(file = "data/map_data.json")

  # Get the starting position and scale for the given map and axis
  start <- map_data[[map_name]][paste0("pos_", axis)]
  scale <- map_data[[map_name]]$scale

  # If the axis is "x", calculate the transformed position
  if(axis == "x"){
    # Subtract the starting position from the given position
    pos <- position - as.numeric(start[1])
    # Divide by the scale factor
    pos <- pos/scale
    # Return the transformed position
    return(pos)
  }

  # If the axis is "y", calculate the transformed position
  else if(axis == "y"){
    # Subtract the given position from the starting position
    pos <- as.numeric(start[1]) - position
    # Divide by the scale factor
    pos <- pos/scale
    # Return the transformed position
    return(pos)
  }
}



