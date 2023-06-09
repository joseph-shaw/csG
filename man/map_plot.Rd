% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map_plot.R
\name{map_plot}
\alias{map_plot}
\title{Plot Map on ggplot with Background Image}
\usage{
map_plot(ggplot, map_name, map_type = "dark")
}
\arguments{
\item{ggplot}{A ggplot object to which the map will be added as a background image.}

\item{map_name}{A character string representing the name of the map image file (without the file extension) located in the "img/" directory.}

\item{map_type}{A character string representing the type of map.}
}
\value{
A ggplot object with the map added as a background image.
}
\description{
This function takes a ggplot object and a map name as inputs, and adds a background image of the map to the plot.
}
\examples{

# Example usage:
gg <- ggplot()

}
