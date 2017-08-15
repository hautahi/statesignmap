# This program tidies up some of the raw files provided by the NIJ 
# for ease of explanation in blog post

library(dplyr)
library(htmlwidgets)
library(leaflet)

# State coordinates
al=c(31.002856, -87.263769)
vir <- c(39.261087, -77.762329)
kan <- c(39.332593, -102.042054)
ida<-c(43.544034, -111.045157)
flo=c(30.997360, -87.260079)
ohio=c(41.731221, -83.532262)
ken=c(36.642711, -86.244574)

# State Photos
file <- c('http://hautahi.com/images/Virginia.png',
          'http://hautahi.com/images/Kansas.png',
          'http://hautahi.com/images/Idaho.png',
          'http://hautahi.com/images/Florida.png',
          'http://hautahi.com/images/Alabama.png',
          'http://hautahi.com/images/Ohio.png',
          'http://hautahi.com/images/Kentucky.png')

# Create Dataframe
lat <- c(vir[1],kan[1],ida[1],flo[1],al[1],ohio[1],ken[1])
lon <- c(vir[2],kan[2],ida[2],flo[2],al[2],ohio[2],ken[2])
df=data.frame(lat=lat,lon=lon,file=file)

# Plot
icons <- awesomeIcons(
  icon        = "fa-map-signs",
  library     = 'fa',
  iconColor = 'black'
)

flag = makeAwesomeIcon(icon='Flag', library='fa')


greenLeafIcon <- makeIcon(
  iconUrl = "http://flagnations.com/wp-content/uploads/2014/07/new-york-flag.jpg",
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowUrl = "http://flagnations.com/wp-content/uploads/2014/07/new-york-flag.jpg",
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

greenLeafIcon <- makeIcon(
  iconUrl = "ny.png",
  iconWidth = 95, iconHeight = 38,
  iconAnchorX = 22, iconAnchorY = 94
)

m <- leaflet(data=df) %>%
  addProviderTiles("OpenMapSurfer.Roads") %>%
  addAwesomeMarkers(~lon,~lat,icon=icons,
                    popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
                    options = popupOptions(closeButton = FALSE,
                                           minWidth = 100,
                                           maxWidth = 100))

leaflet(data=df) %>%
  addProviderTiles("OpenMapSurfer.Roads") %>%
  addMarkers(~lon,~lat,popup=~ paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
                    options = popupOptions(closeButton = F,
                                           minWidth = "auto",
                                           maxWidth = "auto"))

leaflet(data=df) %>%
  addProviderTiles("OpenMapSurfer.Roads") %>%
  addAwesomeMarkers(~lon,~lat,icon=flag,
             popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
             options = popupOptions(closeButton = FALSE))



leaflet(data=df) %>% addTiles() %>%
  addPopups(~lon,~lat,icon=icons,popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
            options = popupOptions(closeButton = FALSE)
  )

addPopups(-122.327298, 47.597131, content,
          options = popupOptions(closeButton = FALSE)
)

saveWidget(m, file="m.html")

# Alternative open map sources
CartoDB.Positron
Esri.WorldStreetMap
Esri.DeLorme
Esri.WorldImagery
BasemapAT.grau
OpenStreetMap.Mapnik
OpenMapSurfer.Roads


