appServer <- function(id, lng, lat, zoom,layers, rawDrivers, hotspots, drivers, hot, dr) {
  moduleServer(id, function(input, output, session) {
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    sel <- reactive(input$layersTable) # Selected drivers
    nSel <- reactive(length(sel())) # Number of selected drivers
    type <- reactive(input$dataType) # Selected type of data (footprint vs hotspot)
    trans <- reactive(input$rawData) # Selected type of data (raw vs transformed data)
    uid <- reactive(which(layers$FileName %in% sel())) # ID of selected drivers in data table
    
    # Empty raster
    raster0 <- raster(vals = NA,
                      nrow = 1,
                      ncol = 1,
                      ext = extent(drivers),
                      crs = 3857)

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FUNCTIONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # Loading raster ----------------------------------------------------
    ras <- reactive({
      # Select proper layer depending on user selection
      if (length(sel()) == 0) {
        raster0
      } else if (length(sel()) == 1 && trans() == 'rawData') {
        if(type() == 'footprint') {
          rawDrivers[[sel()]]
        } else {
          hotspots[[sel()]]
        }  } else if (length(sel()) == 1 && trans() == 'transformed') {
        if(type() == 'footprint') {
          drivers[[sel()]]
        } else {
          hotspots[[sel()]]
        }
      } else if (length(sel()) > 1 && trans() == 'rawData') {
        raster0
      } else if (length(sel()) > 1 && trans() == 'transformed') {
        if(type() == 'footprint') {
          sum(drivers[[sel()]], na.rm = T) %>%
          calc(function(x) ifelse(x == 0, NA, x))
        } else {
          sum(hotspots[[sel()]], na.rm = T) %>%
          calc(function(x) ifelse(x == 0, NA, x))
        }
      }
      # crs = "+init=epsg:3857")
    })

    # Raster values ----------------------------------------------------
    vals <- reactive({
      if(nSel() > 0 && trans() == 'transformed') {
        val <- ras() %>%
                maxValue() %>%
                ceiling() %>%
                seq(0, ., by = ./10)
      } else if(nSel() == 1 && trans() == 'rawData') {
        val <- ras() %>%
                maxValue() %>%
                ceiling() %>%
                seq(0, ., by = ./10)
      } else {
        val <- seq(0, 1, by = .1)
      }
    })

    # Colors ----------------------------------------------------
    couleurs <- reactive({
      colorBin(
        palette  = colorRampPalette(cols)(11),
        domain   = values(ras()),
        bin      = vals(),
        na.color = "transparent"
      )
    })

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ INTERACTIVE MAP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # Leaflet
    output$map <- renderLeaflet({
      leaflet() %>%
             addProviderTiles(provider = providers$CartoDB.Positron) %>%
             setView(lng = lng, lat = lat, zoom = zoom) %>%
             addEasyButton(
               easyButton(icon = "fa-globe",
                          title = "Zoom to Level 1",
                          onClick = JS("function(btn, map){ map.setZoom(6); }")))
    })

    # Update map
    observe({
    # Map
      leafletProxy(mapId = "map") %>%
      clearShapes() %>%
      clearControls() %>%
      clearImages() %>%
      addRasterImage(x       = ras(),
                     colors  = couleurs(),
                     opacity = .75,
                     project = FALSE) #%>%
      # setView(lng   = -65, lat   =  48.50, zoom  = 6)

    # Legend
      leafletProxy(mapId = "map") %>%
      addLegend(position  = "bottomright",
                pal       = couleurs(),
                values    = vals(),
                title     = "Map legend",
                opacity   = 1,
                className = "info legend")
    })
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ACTION BUTTONS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # Action button to reset choices
    observe({
       if (input$Uncheck > 0) {
          updateCheckboxGroupInput(session = session,
                                   inputId = 'layersTable',
                                   label = '',
                                   choiceNames = layers$Drivers,
                                   choiceValues = layers$FileName)
       }
     })

    # Action button to select all choices
    observe({
       if (input$CheckAll > 0) {
          updateCheckboxGroupInput(session = session,
                                   inputId = 'layersTable',
                                   label = '',
                                   selected = layers$FileName,
                                   choiceNames = layers$Drivers,
                                   choiceValues = layers$FileName)
       }
     })
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~ INFORMATION PANELS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    output$info_panel <- renderUI({
      if (nSel() < 1) {
        # Platform description
        HTML(eDrivers)
      } else if (nSel() == 1) {
        # Single driver description
        tagList(
          HTML(dataDesc(uid(), layers)),
          div(plotOutput(NS(id,'singlePlot'), width = '95%', height = '300px'),align = 'center'),
          HTML(dataOver(uid(), layers))
        )
      } else if (nSel() > 1) {
        tagList(
          HTML(multiDesc(type())),
          div(
            plotOutput(NS(id,"multiPlot"), width = '95%', height = '700px'),
            align = 'center'
          )          
        )
      }
    })
    
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PLOTS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
    # ~~~~~~~~~~~~~ SINGLE DRIVER ~~~~~~~~~~~~~~ #
    output$singlePlot <- renderPlot({
      if (nSel() == 1) {
        if (type() == 'footprint') histDriver(ras())
        if (type() == 'hotspots') histHotspot(ras())
      }
    })

    # ~~~~~~~~~~~~ MULTIPLE DRIVERS ~~~~~~~~~~~~ #
    output$multiPlot <- renderPlot({
      if (nSel() > 1) {
        if (type() == 'footprint' && trans() == 'transformed') {
          cumulIntensity(sel(), ras(), layers, dr)
        }
        if (type() == 'hotspots'  && trans() == 'transformed') {
          cumulHotspots(sel(), ras(), layers, hot)
        }
      }
    })  

  })
}