# Parameters & data
source('./code/param.R')

# User interface setup
ui <- navbarPage("eDrivers",
  # Panel 1 
  tabPanel("St. Lawrence",  
    appUI("STL", layers = layers_stl)
  ),
  
  # Panel 1 
  tabPanel("Scotian shelf",  
    appUI("SS", layers = layers_stl[1:5,])
  ),
)

server = function(input, output, session) {
  # St. Lawrence
  appServer(
    "STL", 
    lng = -65, 
    lat = 48.50, 
    zoom = 6,
    layers = layers_stl,
    rawDrivers = drivers_stl$rawDrivers, 
    hotspots = drivers_stl$hotspots, 
    drivers = drivers_stl$drivers, 
    hot = drivers_stl$hot, 
    dr = drivers_stl$dr
  )
  
  # Scotian Shelf
  appServer(
    "SS", 
    lng = -61.85, 
    lat = 42.94,
    zoom = 6,
    layers = layers_stl,
    rawDrivers = drivers_stl$rawDrivers, 
    hotspots = drivers_stl$hotspots, 
    drivers = drivers_stl$drivers, 
    hot = drivers_stl$hot, 
    dr = drivers_stl$dr
  )
}

shinyApp(ui, server)
