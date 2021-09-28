#  Cargamos las Librerias ----------------------------------------------------------
require(pacman)
pacman::p_load(raster, ggplot2, ggspatial, colorspace, ggpubr, RColorBrewer, sf, tmap)
#----------------------------------------------------------
Cobe            <- raster("Raster/Puma/Puma_concolor.asc")
#----------------------------------------------------------

map <- tm_shape(Cobe) + 
  tm_raster(style = "quantile", n = 8, title = "Histograma \n(data distribucion)",
            palette = colorRampPalette( c("#33911F","#6BB04C","#9FCF6F","#DFF0A9","#F9DAA3","#EC9662","#D65931","#B91313"))(8) , 
            legend.show = T, legend.hist = T, legend.hist.z=0)+
  tm_scale_bar(width = 0.25, text.size = 0.5, text.color = "darkgoldenrod1", color.dark = "lightsteelblue4", 
               position = c("left", "bottom"), lwd = 1, color.light= "white")+
  tm_compass(type = "8star", position = c("right", "top")) +
  tm_style("cobalt")+
  tm_layout(title = "Mapa de \ndistribucion", legend.title.size=.8,legend.text.size = 0.5,
            legend.position = c(0.75, 0.05),
            legend.hist.width = 0.2,
            legend.hist.height = 0.2, 
            title.color  = "white",
            title.size = .8,
            legend.title.color = "white",
            legend.text.color = "white",
            bg.color="#022140",
            legend.stack = 'horizontal',
            legend.format=list(fun=function(x) formatC(x, digits=3, format="f"), text.separator= "-"),
            legend.bg.color = "#416076",
            panel.labels = c("R y RStudio con paquete Tmap"),
            panel.label.color = "darkslateblue",main.title.position = "center",
            main.title = "Mapa de Distribucion potencial de Puma concolor. Mapa:R", main.title.size = 0.8, fontface="bold")+
  tm_credits("Gorky Florez Castillo", position = c(0.3, .005), col = "white", fontface="bold")+
  tm_logo(c("https://www.r-project.org/logo/Rlogo.png",
            system.file("img/tmap.png", package = "tmap")),height = 3, position = c(0.75, 0.30))+
  tm_xlab("Longitude")+
  tm_ylab("Latitude")+
  tm_grid(col = "grey90",ticks = T, labels.col = "black")
tmap_save(map , "Mpas/Distribucion potencial de Puma concolor.png", dpi = 1200, height = 10)
