# code for plotting Bananaquit morph ratios
# code by Vicens Vila-Coury, April 2024

library(ggplot2)
library(scatterpie)
library(sf)

grenada_map <- st_read("base_map/grenada_full_4326.shp")
morph_ratio_data <- read.csv("morph_ratio_data.csv")

ggplot() + 
  geom_sf(data = grenada_map) + 
  geom_scatterpie(aes(x = longitude, y = latitude), data = morph_ratio_data, cols=c("black", "yellow"), pie_scale = 1.2, legend_name = "morph") + 
  coord_sf() + 
  scale_fill_manual(values = c("black" = "gray18", "yellow" = "gold")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "white")) + 
  labs(x = "longitude", y = "latitude") + 
  annotate(geom = "text", x = -61.64, y = 12.00, label = "max = # birds \nmin =  # \nmedian = #", hjust = 0, vjust = 0)