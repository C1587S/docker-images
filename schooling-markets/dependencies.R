# Script containing all R the dependencies for the Schooling Markets project


# dependencies
installations <- function(package) {
  if (!require(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)) {
    install.packages(as.character(package), dependecies = TRUE, repos = "http://cran.us.r-project.org")
    library(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
  }
}

packages <- c('corrr', 
              'data.table',
              'ddpcr',
              'dplyr',
              'easypackages',
              'foreign',
              'GeoRange',
              'geosphere',
              'ggraph',
              'glmnet',
              'haven',
              'htmlwidgets',
              'htmltools',
              'igraph',
              'igraphdata',
              'kableExtra',
              'leaflet',
              'leaflet.extras',
              'linkcomm',
              'maptools', 
              'network',
              'RANN',
              'raster',
              'readr',
              'RColorBrewer', 
              'scales',
              'sjlabelled',
              'sf',
              'shiny',
              'shinydashboard',
              'sp',
              'stringr',
              'tidygraph',
              'formattable',
              'shinydashboard',
              'usethis')

lapply(packages, installations)
