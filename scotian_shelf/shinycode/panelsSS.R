# checkPanelSTL <- function() {
#   # Check box output to select drivers to visualize
#   absolutePanel(
#     id = 'checkPanel1STL',
#     draggable = FALSE,
#     left = '14',
#     top = '130',
#     height = '690px',
# 
#     # Collapse button
#     HTML('<button data-toggle="collapse" data-target="#demo">&nbsp;&#8689;&nbsp;</button>'),
# 
#     # Check all button
#     actionButton("CheckAllSTL", label = '', icon = icon('check-square')),
# 
#     # Uncheck button
#     actionButton("UncheckSTL", label = '', icon = icon('sync')),
# 
#     # Collapsable and selectable driver table
#     tags$div(id = 'demo',  class="collapse in",
#       absolutePanel(
#         id = 'checkPanel2STL',
#         draggable = TRUE,
#         h5('Drivers'),
#         hr(),
# 
#         # Raw vs transformed data choice
#         radioButtons(
#           inputId = 'rawDataSTL',
#            label = '',
#            inline = T,
#            choiceNames = c('Raw data','Transformed'),
#            choiceValues = c('rawData','transformed'),
#            selected = 'transformed'
#         ),
# 
#         # Hotspots vs footprint choice
#         radioButtons(
#           inputId = 'dataTypeSTL',
#           label = '',
#           inline = T,
#           choiceNames = c('Intensity','Hotspots'),
#           choiceValues = c('footprint','hotspots'),
#           selected = 'footprint'
#         ),
# 
#         hr(),
# 
#         # Drivers table
#         checkboxGroupInput(
#           inputId = 'layersTableSTL',
#           label = '',
#           choiceNames = layersSTL$Drivers,
#           choiceValues = layersSTL$FileName
#         )
#       )
#     )
#   )  
# }
# 
# # 
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~ INFORMATION PANEL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # infoPanel1STL <- function() {
# #   conditionalPanel(
# #     condition = 'input.layersTable.length < 1',
# #     absolutePanel(
# #       id = 'infoPanel1',
# #       right = '0',
# #       top = '0',
# #       bottom = '0',
# #       left = '80%',
# #       htmlOutput('eDrivers')
# #     )
# #   )  
# # }
# # 
# # infoPanel2STL <- function() {
# #   conditionalPanel(
# #     condition = 'input.layersTable.length == 1',
# #     absolutePanel(
# #       id = 'infoPanel2',
# #       right = '0',
# #       top = '0',
# #       bottom = '0',
# #       left = '80%',
# #       htmlOutput('dataDescription'),
# #       div(plotOutput('singlePlot', width = '95%', height = '300px'),align = 'center'),
# #       htmlOutput('dataOverview')
# #     )
# #   )
# # }
# # 
# # infoPanel3STL <- function() {
# #   conditionalPanel(
# #     condition = 'input.layersTable.length > 1 && input.rawData == "transformed"',
# #     absolutePanel(
# #       id = 'infoPanel3',
# #       right = '0',
# #       top = '0',
# #       bottom = '0',
# #       left = '80%',
# #       htmlOutput('multiDescription'),
# #       div(
# #         plotOutput('multiPlot', width = '95%', height = '700px'),
# #         align = 'center'
# #       )
# #     )
# #   )
# # }
# # 
# # 
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ WARNING PANEL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# # warnPanelSTL <- function() {
# #   conditionalPanel(
# #     condition = "input.layersTable.length > 1 && input.rawData == 'rawData'",
# #     absolutePanel(
# #       id = 'warningMessage',
# #       top = '50%',
# #       left = '50%',
# #       right = '20%',
# #       bottom = '20%',
# #       htmlOutput('warningMSG')
# #     )
# #   )  
# # }
