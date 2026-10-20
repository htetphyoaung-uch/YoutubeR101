setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)


fev<- haven::read_sav("FEV.sav")

dim(fev)

glimpse(fev)

mStats::codebook(fev)


fev$Sex

fev$Sex <- as.factor(fev$Sex)

fev$Sex <- factor(fev$Sex,
                  levels = c(0,1),
                  labels = c("Male","Female"))
fev$Sex

fev$Smoke

fev$Smoke <- as.factor(fev$Smoke)

fev$Smoke <- factor(fev$Smoke,
                  levels = c(0,1),
                  labels = c("Not Exposed","Exposed"))

fev$Smoke

is.na(fev$Id)

view(is.na.data.frame(fev))

fivenum(fev$Age_yr)

mean(fev$Age_yr, na.rm = T)

mStats::summ(fev, Age_yr)

raster::modal(fev$Age_yr,na.rm=TRUE)

t.test(fev$Age_yr) # 95%CI for mean



fev %>% 
  ggplot(aes(Age_yr))+
  geom_histogram(bins = 15, fill= "blue")+
 theme_minimal()


fivenum(fev$FEV_ml)

fev %>% 
  ggplot(aes(FEV_ml))+
  geom_boxplot()+
  coord_flip()+
  theme_minimal()

mStats::tab(fev, Sex,Smoke)

mStats::tab(fev, Sex,by= Smoke)


mStats::summ(fev, FEV_ml,Hgt_cm)

mStats::summ(fev, FEV_ml, by= Sex)

mStats::summ(fev, FEV_ml, by= Smoke)


################################################################################

#Q1
# mean diff on sex

fev %>% 
  ggplot(aes(FEV_ml, fill= Sex))+
  geom_boxplot()+
  coord_flip()+
  scale_fill_brewer(palette = "Set2")

#ttest

mStats::summ(fev, FEV_ml, by= Sex)

t.test(FEV_ml~Sex,data=fev,alternative= "greater",var.equal=TRUE)

#Q2

fev <- fev %>% 
  mutate(Age_gp= case_when(Age_yr<=5 ~ "<5", 5<Age_yr & Age_yr<13 ~"6-12", Age_yr>12 ~ ">12"))

fev$Age_gp<- as.factor(fev$Age_gp)

fev$Age_gp

fev$Age_gp <- factor(fev$Age_gp,
                  levels =c("<5","6-12",">12"))

fev$Age_gp


mStats::summ(fev, FEV_ml, by= Age_gp)

myanova1<-aov(FEV_ml~Age_gp,data=fev)
summary(myanova1)
TukeyHSD(myanova1)


#Q3

fev <- fev %>% 
  mutate(FEV_gp= case_when(FEV_ml<=2 ~ "1", FEV_ml>2 ~ "2"))

fev$FEV_gp<- as.factor(fev$FEV_gp)

fev$FEV_gp <- factor(fev$FEV_gp,
                     levels =c(1,2),
                     labels = c("Impaired","Normal"))

fev$FEV_gp

mStats::tab(fev, FEV_gp, by= Smoke)

#Q4

mStats::tab(fev, FEV_gp, by= Age_gp)


#Q5

fev %>% 
  ggplot(aes(FEV_ml,Hgt_cm))+
  geom_point()+
  geom_smooth(method = "lm") + 
  theme(panel.grid.minor = element_line(linetype = "blank"),
    panel.background = element_rect(fill = "antiquewhite"))

# Linear correlation
cor.test(fev$FEV_ml,fev$Hgt_cm,method="pearson") 


#Q6

est1 <- lm(FEV_ml~Age_yr,data=fev) ; est1


#Q7


cd4<- haven::read_sav("CD4_paired.sav")

dim(cd4)
is.na(cd4)

b4<- cd4$Before_CD4
af<- cd4$After_CD4

t.test(af,b4,paired=TRUE)

wilcox.test(af,b4,paired=TRUE)













