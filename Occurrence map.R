data <- read.csv("data/cleanedData.csv")

library(leaflet)
library(mapview)
library(webshot2)

data<- read_csv("data/cleanedData.csv")

# Generate occurrence map
map <- leaflet(options = leafletOptions(zoomControl = FALSE)) %>% 
  # The options bit removes the zoom button
  
  # Add base map
  # More options here: https://leaflet-extras.github.io/leaflet-providers/preview/
  addProviderTiles("Esri.WorldTopoMap") %>% 
  
  # Add occurrence points
  addCircleMarkers(data = data,
                   lat = ~decimalLatitude,
                   lng = ~decimalLongitude,
                   radius = 3,
                   color = "coral",
                   fillOpacity = 0.8) %>%
  
  # Add legend/title
  addLegend(position = "topright",
            title = "Species Occurences from GBIF",
            labels = "Columbia torrent salamander",
            colors = "coral")
map
# Save the map
mapshot2(map, file = "output/leafletTest2.png")
