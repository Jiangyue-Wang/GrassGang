library(ggplot2)
fake <- data.frame(x=1:10,y=seq(3,9.9,0.7))

ggplot(fake,aes(x=x,y=y))+geom_smooth(method="lm")+theme_classic()+xlab("Aridity index \n Dry → Wet")+ylab("Leaf area / Leaf length")+ylim(min=0,max=10)+theme(axis.text = element_blank(),axis.ticks = element_blank())
ggsave("Figures/Pred1.png",width=3,height=3,dpi=600,units="in")

ggplot(fake,aes(x=x,y=y))+geom_smooth(method="lm")+theme_classic()+xlab("Aridity index \n Dry → Wet")+ylab("NDF / Cellulose")+ylim(min=0,max=10)+theme(axis.text = element_blank(),axis.ticks = element_blank())
ggsave("Figures/Pred2.png",width=3,height=3,dpi=600,units="in")

ggplot(fake,aes(x=x,y=y))+geom_smooth(method="lm")+theme_classic()+xlab("Leaf area / Leaf length")+ylab("Muzzle width")+ylim(min=0,max=10)+theme(axis.text = element_blank(),axis.ticks = element_blank())
ggsave("Figures/Pred3.png",width=3,height=3,dpi=600,units="in")

ggplot(fake,aes(x=x,y=y))+geom_smooth(method="lm")+theme_classic()+xlab("NDF / Cellulose")+ylab("Masseteric fossa")+ylim(min=0,max=10)+theme(axis.text = element_blank(),axis.ticks = element_blank())
ggsave("Figures/Pred4.png",width=3,height=3,dpi=600,units="in")
