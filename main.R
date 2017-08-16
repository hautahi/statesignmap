# This program tidies up some of the raw files provided by the NIJ 
# for ease of explanation in blog post

library(dplyr)
library(htmlwidgets)
library(leaflet)

# State coordinates
va <- c(39.261087, -77.762329)
ida<- c(43.543787, -111.045938)
flo<- c(30.997360, -87.260079)
al <- c(31.002856, -87.263769)
ohio<- c(41.731221, -83.532262)
ken<- c(36.642711, -86.244574)
nj <- c(41.054222, -74.065301)
sc <- c(34.483788, -79.337365)
ga <- c(34.982552, -85.458835)
nc <- c(35.473826, -83.920882)
neb<- c(40.064435, -102.051883)
ks <- c(40.002726, -101.933441)
nh <- c(42.884758, -72.544493)
vt <- c(42.892559, -73.276251)
nd <- c(45.945463, -103.391032)
sd <- c(45.945115, -103.391030)
tn <- c(35.124590, -90.069935)
md <- c(39.606196, -75.785715)
dw <- c(39.606239, -75.784473)
la <- c(30.999322, -90.476514)
wy <- c(43.543410, -111.045745)
mi <- c(41.726338, -83.688869)
me <- c(43.794241, -70.985581)

# State Photos
file <- c('http://hautahi.com/images/Virginia.png',
          'http://hautahi.com/images/Idaho.png',
          'http://hautahi.com/images/Florida.png',
          'http://hautahi.com/images/Alabama.png',
          'http://hautahi.com/images/Ohio.png',
          'http://hautahi.com/images/Kentucky.png',
          'http://hautahi.com/images/New_Jersey.png',
          'http://hautahi.com/images/SC.png',
          'http://hautahi.com/images/Georgia.png',
          'http://hautahi.com/images/North_Carolina.png',
          'http://hautahi.com/images/Nebraska.png',
          'http://hautahi.com/images/Kansas.png',
          'http://hautahi.com/images/New_Hampshire.png',
          'http://hautahi.com/images/Vermont.png',
          'http://hautahi.com/images/North_Dakota.png',
          'http://hautahi.com/images/South_Dakota.png',
          'http://hautahi.com/images/Tennessee.png',
          'http://hautahi.com/images/Maryland.png',
          'http://hautahi.com/images/Delaware.png',
          'http://hautahi.com/images/Louisianna.png',
          'http://hautahi.com/images/Wyoming.png',
          'http://hautahi.com/images/Michigan.png',
          'http://hautahi.com/images/Maine.png')

# Create Dataframe
lat <- c(va[1],ida[1],flo[1],al[1],ohio[1],ken[1],nj[1],sc[1],
         ga[1],nc[1],neb[1],ks[1],nh[1],vt[1],nd[1],sd[1],tn[1],
         md[1],dw[1],la[1],wy[1],mi[1],me[1])
lon <- c(va[2],ida[2],flo[2],al[2],ohio[2],ken[2],nj[2],sc[2],
         ga[2],nc[2],neb[2],ks[2],nh[2],vt[2],nd[2],sd[2],tn[2],
         md[2],dw[2],la[2],wy[2],mi[2],me[2])

df=data.frame(lat=lat,lon=lon,file=file)

# Create Icons
icons <- awesomeIcons(icon = "fa-map-signs",
  library     = 'fa', iconColor = 'black'
)

# Plot
m <- leaflet(data=df) %>%
  addProviderTiles("Esri.WorldStreetMap") %>%
  addAwesomeMarkers(~lon,~lat,icon=icons,
                    popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
                    options = popupOptions(closeButton = FALSE,
                                           minWidth = 100,
                                           maxWidth = 100))

# Save
saveWidget(m, file="statesign_map.html")

# --------------- Archive Code --------#

m<-leaflet(data=df) %>%
  addProviderTiles("Esri.WorldStreetMap") %>%
  addMarkers(~lon,~lat,popup=~ paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
                    options = popupOptions(closeButton = F,
                                           minWidth = "auto",
                                           maxWidth = "auto"))


leaflet(data=df) %>%
  addProviderTiles("OpenMapSurfer.Roads") %>%
  addAwesomeMarkers(~lon,~lat,icon=icons,
                    popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
                    options = popupOptions(closeButton = FALSE,
                                           minWidth = 100,
                                           maxWidth = 100))

leaflet(data=df) %>%
  addProviderTiles("OpenMapSurfer.Roads") %>%
  addAwesomeMarkers(~lon,~lat,icon=flag,
             popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
             options = popupOptions(closeButton = FALSE))

leaflet(data=df) %>% addTiles() %>%
  addPopups(~lon,~lat,icon=icons,popup = paste0("<img src = ", file, " height=\"100\" width=\"100\">"),
            options = popupOptions(closeButton = FALSE)
  )

# Alternative open map sources
CartoDB.Positron
Esri.WorldStreetMap
Esri.DeLorme
Esri.WorldImagery
BasemapAT.grau
OpenStreetMap.Mapnik
OpenMapSurfer.Roads
