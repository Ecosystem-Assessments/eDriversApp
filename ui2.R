# Parameters & data
source('./code/param.R')

# User interface setup
ui <- bootstrapPage(
useShinyjs(),
withMathJax(),

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CSS STYLE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "eDrivers.css")
),

mainPanel(
  tabsetPanel(
    # Panel 1 
    tabPanel("St. Lawrence",
    
    ),
    
    # Panel 2
    tabPanel("Scotian Shelf",

    )
  ),
  width = 12
)

# Parameters & data
source('./code/param.R')

# User interface setup
ui <- bootstrapPage(
useShinyjs(),
withMathJax(),

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CSS STYLE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "eDrivers.css")
),

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ INTERACTIVE MAP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Map output
leafletOutput(outputId = "map", width = '80%', height = '100%'),
) # End
