#........................dashboardHeader.........................
# dashboardHeader ----

header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) #END dashboarHeader




#........................dashboardSidebar........................
# dashboardSidebar ----
sidebar <- dashboardSidebar(
  
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) #END sidebarMenu
  
) # END dashboardSidebar




#..........................dashboardBody.........................
# dashboardBody ----
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
      
      # left-hand column
      column(width = 6,
             
             box(width = NULL,
                 
                 "background info here"
                 
                 ), # END left-box
             
             ), # END left-column
      
      # right-hand column
      column(width = 6,
             
             # top fluid row ----
             fluidRow(
               
               box(width = NULL,
                   
                   "Data citation"
                   
                   ) # END box
               
             ), # END top fluid row
             
             # second fluiRow ----
             fluidRow(
               
               # disclaimer box ----
               box(width = NULL,
                   
                   "disclaimer here"
                   
               ) # END disclaimer box
               
             ) # END second fluidRow
             
             ) # END right-hand column
      
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4, 
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInput ----
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meteres above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation)))
                  
                  ), # END input box
              
              # leaflet box ----
              box(width = 8,
                  
                  title = tags$strong("Monitored lakes within Fish Creek Watershed"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") %>% 
                    withSpinner(type = 1, color = "#742361")
                  
                  ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItem
  
) # END dashboardBody



#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)