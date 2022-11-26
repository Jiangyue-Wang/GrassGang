setwd("~/Desktop/phD/AFEC-X/Skull/Skull-Grass")
library(tidyverse)
skull <- read_csv("data/skulldata_Grazer.csv")
head(skull)
summary(skull)
skull$log.MZW<-log(skull$MZW)
skull$log.MST<-log(skull$MASSETER)
skull$log.length<-log(skull$SKULLLENGTH)
skull$ai.sqrt<-sqrt(skull$Aridity.Index)
MZWailm<-lm(log.MZW~log.length+ai.sqrt,data=skull)
MZWainew<-data.frame(log.length=mean(skull$log.length),ai.sqrt=seq(0,1.4,0.01))
MZWaipred<-predict(MZWailm,MZWainew,se.fit=T)
MZWainew$pred<-MZWaipred$fit
MZWainew$low<-MZWaipred$fit-1.96*MZWaipred$se.fit
MZWainew$up<-MZWaipred$fit+1.96*MZWaipred$se.fit

p1 <- skull %>% mutate(logMZW=log(MZW),logMST=log(MASSETER),Arid.sqrt=sqrt(Aridity.Index)) %>% ggplot()+aes(y=logMZW,x=Arid.sqrt)+geom_point(colour="#8ecae6")+geom_smooth(data=MZWainew,aes(x=ai.sqrt,y=pred,ymin=low,ymax=up),stat="identity",colour="#ff4d6d")+theme_classic()+xlab("Aridity Index (sqrt) \n Dry → Wet")+ylab("Muzzle Width (log)")+ylim(min=0.5,max=3)+ggtitle("Results")
# ggsave("Figures/MZW.png",width=6,height=4,dpi=600,units="in")

MSTailm<-lm(log.MST~log.length+ai.sqrt,data=skull)
MSTainew<-data.frame(log.length=mean(skull$log.length),ai.sqrt=seq(0,1.4,0.01))
MSTaipred<-predict(MSTailm,MSTainew,se.fit=T)
MSTainew$pred<-MSTaipred$fit
MSTainew$low<-MSTaipred$fit-1.96*MSTaipred$se.fit
MSTainew$up<-MSTaipred$fit+1.96*MSTaipred$se.fit

p2 <- skull %>% mutate(logMZW=log(MZW),logMST=log(MASSETER),Arid.sqrt=sqrt(Aridity.Index)) %>% ggplot()+aes(y=logMST,x=Arid.sqrt)+geom_point(colour="#8ecae6")+geom_smooth(data=MSTainew,aes(x=ai.sqrt,y=pred,ymin=low,ymax=up),stat="identity",colour="#ff4d6d")+theme_classic()+xlab("Aridity Index (sqrt) \n Dry → Wet")+ylab("Masseteric Fossa (log)")+ylim(min=2,max=3.5)+ggtitle("Results")
# ggsave("Figures/MST.png",width=6,height=4,dpi=600,units="in")


p3 <- skull %>% mutate(logMZW=seq(1.45,1.514,0.002),logMST=log(MASSETER),Arid.sqrt=sort(sqrt(Aridity.Index))) %>% ggplot()+aes(y=logMZW,x=Arid.sqrt)+geom_smooth(method = "lm",colour="#ff4d6d")+theme_classic()+xlab("Aridity Index (sqrt) \n Dry → Wet")+ylab("Muzzle Width (log)")+ylim(min=0.5,max=3)+ggtitle("Prediction")
# ggsave("Figures/MZW.png",width=6,height=4,dpi=600,units="in")


p4 <- skull %>% mutate(logMZW=log(MZW),logMST=seq(2.7,2.764,0.002),Arid.sqrt=sort(sqrt(Aridity.Index))) %>% ggplot()+aes(y=logMST,x=Arid.sqrt)+geom_smooth(method = "lm",colour="#ff4d6d")+theme_classic()+xlab("Aridity Index (sqrt) \n Dry → Wet")+ylab("Masseteric Fossa (log)")+ylim(min=2,max=3.5)+ggtitle("Prediction")

library(patchwork)
p1
ggsave("Figures/MZWresults.png",width=4,height=4,dpi=600,units="in")
p3
ggsave("Figures/MZWprediction.png",width=4,height=4,dpi=600,units="in")
p2
ggsave("Figures/MSTresults.png",width=4,height=4,dpi=600,units="in")
p4
ggsave("Figures/MSTprediction.png",width=4,height=4,dpi=600,units="in")



skull_t <- skull %>% mutate(logMZW=log(MZW),logMST=log(MASSETER),Arid.sqrt=sqrt(Aridity.Index))

