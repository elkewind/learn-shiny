#......................... load packages.........................
library(tidyverse)
library(leaflet)

#......................... read in data .........................
filtered_lakes <- read_csv("shiny-dashboard/data/lake_data_processed.csv")

#......................... practice filtering....................
lakes_new <- filtered_lakes %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)



#......................... build leaflet.........................
leaflet() %>% 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery") %>% 
  
  # set view of AK
  setView(lng = -152, lat = 70, zoom = 6) %>% 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>% 
  
  # add markers
  addMarkers(data = lakes_new,
             lng = lakes_new$Longitude,
             lat = lakes_new$Latitude,
             popup = paste(
               "Site Name:", lakes_new$Site, "<br>",
               "Elevation:", lakes_new$Elevation, "meters (above SL)", "<br>",
               "Avg Depth:", lakes_new$AvgDepth, "meters", "<br>",
               "Avg Lake Bed Temperature:", lakes_new$AvgTemp, "deg Celsius"
             ))










