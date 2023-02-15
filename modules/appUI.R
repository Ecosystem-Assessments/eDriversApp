appUI <- function(id, layers) {
  ns <- NS(id)

  tagList(
    useShinyjs(),
    withMathJax(),
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "eDrivers.css")),
    div(class="outer",
      leafletOutput(outputId = ns("map"), width = '80%', height = '100%'),
      # Check box output to select drivers to visualize
      # --- start
      absolutePanel(
        id = 'checkPanel1',
        draggable = FALSE,
        left = '14',
        top = '130',
        height = '690px',

        # Collapse button
        HTML('<button data-toggle="collapse" data-target="#demo">&nbsp;&#8689;&nbsp;</button>'),

        # Check all button
        div(class = "CheckAll",
          actionButton(
            ns("CheckAll"), 
            label = '', 
            icon = icon('check-square')
          )
        ),

        # Uncheck button
        div(class = "Uncheck",
          actionButton(
            ns("Uncheck"), 
            label = '', 
            icon = icon('sync')
          )
        ),

        # Collapsable and selectable driver table
        tags$div(id = 'demo',  class="collapse in",
          absolutePanel(
            id = 'checkPanel2',
            draggable = TRUE,
            h5('Drivers'),
            hr(),

            # # Raw vs transformed data choice
            # div(class = "rawData",
            #   radioButtons(
            #     inputId = ns('rawData'),
            #      label = '',
            #      inline = T,
            #      choiceNames = c('Raw data','Transformed'),
            #      choiceValues = c('rawData','transformed'),
            #      selected = 'transformed' 
            #   )
            # ),
            
            br(),
            # Hotspots vs footprint choice
            div(class = "dataType", 
              radioButtons(
                inputId = ns('dataType'),
                label = '',
                inline = T,
                choiceNames = c('Intensity','Hotspots'),
                choiceValues = c('footprint','hotspots'),
                selected = 'footprint'
              )            
            ),


            hr(),

            # Drivers table
            div(class = "layersTable",
              checkboxGroupInput(
                inputId = ns('layersTable'),
                label = '',
                choiceNames = layers$Drivers,
                choiceValues = layers$FileName
              )
            )
          )
        )
      )
      # --- end  
    ), 
    
    # Information panels
    absolutePanel(
      id = 'infoPanel1',
      right = '0',
      top = '50',
      bottom = '0',
      left = '80%',
      uiOutput(ns("info_panel"))
    )
  )
}

