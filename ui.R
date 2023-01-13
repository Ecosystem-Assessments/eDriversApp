# Parameters & data
source('./code/param.R')
source("functions/panelsSTL.R")

# User interface setup
ui <- navbarPage("eDrivers",

  # Panel 1 
  tabPanel("St. Lawrence",  
    bootstrapPage(
      # # Shiny js and css style 
      useShinyjs(),
      withMathJax(),
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "eDrivers.css")
      ),

      div(class="outer",
        # MAP
        leafletOutput(outputId = "mapSTL", width = '80%', height = '100%'),
        checkPanelSTL(),
        infoPanel1STL(),
        infoPanel2STL(),
        infoPanel3STL(),
        warnPanelSTL()
      )
    )
  ),
  
  # Panel 2
  tabPanel("Scotian Shelf",
    div(class="outer",
      leafletOutput(outputId = "mapSS", width = '80%', height = '100%')
    )
  )
)
