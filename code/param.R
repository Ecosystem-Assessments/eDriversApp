# ~~~~~~~~~~~~~~~~~~~~~~~~~   Libraries   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
library(raster)
library(leaflet)
library(shiny)
library(shinyjs)
library(magrittr)
library(sf)
library(rgdal)
library(dplyr)
library(tidyr)

# ~~~~~~~~~~~~~~~~~~~~~~~~~   DATA   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# source('./texts/layers_stl.R')
# source('./texts/eDrivers.R')
load('./data/drivers_stl.RData')
load('./data/layers_stl.RData')
load('./data/eDrivers.RData')

# ~~~~~~~~~~~~~~~~~~~~~~~~~   FUNCTIONS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
source('./code/histDriver.R')
source('./code/histHotspot.R')
source('./code/cumulIntensity.R')
source('./code/cumulHotspots.R')
source('./code/dataDescription.R')
source('./code/multiDescription.R')

# ~~~~~~~~~~~~~~~~~~~~~~~~~   MODULES   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
source("modules/appUI.R")
source("modules/appServer.R")

# ~~~~~~~~~~~~~~~~~~~~~~~~~   COLORS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Colors
cols <- c(
  '#C7CBCE',
  '#96A3A3',
  '#687677',
  '#222D3D',
  '#25364A',
  '#C77F20',
  '#E69831',
  '#E3AF16',
  '#E4BE29',
  '#F2EA8B'
)

# ~~~~~~~~~~~~~~~~~~~~~~~~~   FONTS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Font
# showtext_auto()
# font_add(family = 'Playfair', regular = 'PlayfairDisplay-Italic.ttf')
# font_add(family = 'Playfair2', regular = 'PlayfairDisplay-BoldItalic.ttf')
# font_add(family = 'Josefin', regular = 'JosefinSla-BoldItalic.ttf')
# font_add_google(name = 'Josefin Slab')
