library(data.table)
library(tidyverse)
library(raster)
distri <- fread("~/Desktop/phD/AFEC-X/GrassGang/data/BIEN_poaceae.csv")
distri %>% count(Species,sort = T)

DG<-distri %>% filter(Species=="Dactylis glomerata"|Species=="Poa pratensis"|Species=="Anthoxanthum odoratum") 
arid <- raster("~/Desktop/phD/AFEC-X/GrassGang/data/Aridity/ai_v3_yr.tif")
DG$aridity <- extract(arid,DG[,c("longmid","latmid")])/10000

ggplot(DG,aes(x=Species,y=aridity,color=Species))+geom_violin()+theme_classic()+theme(axis.text.x = element_blank())+ylab("Aridity Index")
ggsave("~/Desktop/phD/AFEC-X/GrassGang/Figures/AridityDistribution.pdf",width=6,height=4,dpi=600,units="in")

