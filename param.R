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
# St. Lawrence
load('./st_lawrence/data/rawDrivers.RData')
load('./st_lawrence/data/drivers.RData')
load('./st_lawrence/data/hotspots.RData')
load('./st_lawrence/data/dr.RData')
load('./st_lawrence/data/hot.RData')

# Scotian shelf
load('./scotian_shelf/data/rawDriversSS.RData')
load('./scotian_shelf/data/driversSS.RData')
load('./scotian_shelf/data/hotspotsSS.RData')
load('./scotian_shelf/data/drSS.RData')
load('./scotian_shelf/data/hotSS.RData')

# ~~~~~~~~~~~~~~~~~~~~~~~~~   FUNCTIONS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# St. Lawrence
source('./st_lawrence/code/histDriver.R')
source('./st_lawrence/code/histHotspot.R')
source('./st_lawrence/code/cumulIntensity.R')
source('./st_lawrence/code/cumulHotspots.R')


# ~~~~~~~~~~~~~~~~~~~~~~~~~   SHINY CODE   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# St. Lawrence
source('./st_lawrence/shinycode/panelsSTL.R')
source('./st_lawrence/shinycode/serverSTL.R')

# Scotian shelf
source('./scotian_shelf/shinycode/panelsSS.R')
source('./scotian_shelf/shinycode/serverSS.R')

# ~~~~~~~~~~~~~~~~~~~~~~~~~   TEXTS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# St. Lawrence
source('./st_lawrence/texts/driversList.R')
source('./st_lawrence/texts/eDrivers.R')
source('./st_lawrence/texts/dataDescription.R')
source('./st_lawrence/texts/multiDescription.R')

# ~~~~~~~~~~~~~~~~~~~~~~~~~   RASTER0   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
prj <- "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs"
raster0 <- raster(vals = NA,
                  nrow = 1,
                  ncol = 1,
                  ext = extent(drivers),
                  crs = prj)


# ~~~~~~~~~~~~~~~~~~~~~~~~~   PARAMETERS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
layers <- driversList
nDr <- nrow(layers)

# # Insert checkboxes in table
# layers$checkbox <- sprintf('<input type="checkbox" name="%s" value="%s"/>',
#                            layers$FileName,
#                            1:nDr)

# Colors
cols <- c('#C7CBCE','#96A3A3','#687677','#222D3D','#25364A','#C77F20','#E69831','#E3AF16','#E4BE29','#F2EA8B')


# ~~~~~~~~~~~~~~~~~~~~~~~~~   FONTS   ~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Font
# showtext_auto()
# font_add(family = 'Playfair', regular = 'PlayfairDisplay-Italic.ttf')
# font_add(family = 'Playfair2', regular = 'PlayfairDisplay-BoldItalic.ttf')
# font_add(family = 'Josefin', regular = 'JosefinSla-BoldItalic.ttf')
# font_add_google(name = 'Josefin Slab')
