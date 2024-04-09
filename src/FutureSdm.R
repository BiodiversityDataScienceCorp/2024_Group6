#### Start Future SDM ########


# 6. Get Future Climate Projections

# CMIP6 is the most current and accurate modeling data
# More info: https://pcmdi.llnl.gov/CMIP6/

futureClimateRaster <- cmip6_world("CNRM-CM6-1", "585", "2061-2080", var = "bioc", res=2.5, path="data/cmip6")
futureClimateRaster <- rast(futureClimateRaster)
# 7. Prep for the model


names(futureClimateRaster)=names(currentClimRasterStack)


geographicAreaFutureC6 <- crop(futureClimateRaster, extent(currentClimRasterStack))


# 8. Run the future SDM

rhyacotritonFutureSDM <- raster::predict(rhyacotritonCurrentSDM, geographicAreaFutureC6)


# 9. Plot the future SDM


rhyacotritonFutureSDMDf <- as.data.frame(rhyacotritonFutureSDM, xy=TRUE)


xmax <- max(rhyacotritonFutureSDMDf$x)
xmin <- min(rhyacotritonFutureSDMDf$x)
ymax <- max(rhyacotritonFutureSDMDf$y)
ymin <- min(rhyacotritonFutureSDMDf$y)


ggplot() +
  geom_polygon(data = wrld, mapping = aes(x = long, y = lat, group = group),
               fill = "grey75") +
  geom_raster(data = rhyacotritonFutureSDMDf, aes(x = x, y = y, fill = maxent)) + 
  scale_fill_gradientn(colors = terrain.colors(10, rev = T)) +
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax), expand = F) +
  scale_size_area() +
  borders("state") +
  borders("world", colour = "black", fill = NA) + 
  labs(title = "Future SDM of Rhyacotriton cascadae Under CMIP6 Climate Conditions",
       x = "longitude",
       y = "latitude",
       fill = "Env Suitability") +
  theme(legend.box.background=element_rect(),legend.box.margin=margin(5,5,5,5)) 

ggsave("output/rhyacotritonFutureSdm.jpg",  width = 8, height = 6)



##### END FUTURE SDM ######