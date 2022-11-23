library(data.table)
Global_Cell <- fread("data/Global_Cell.csv")
head(Global_Cell)
Global_Cell$x1 <- rep(1,nrow(Global_Cell))
Global_Cell[Global_Cell$AI==0,"x1"]<-NA
library(raster)
writeRaster(rasterFromXYZ(Global_Cell[,c("x","y","x1")]),"Figures/WorldMap.tif")
