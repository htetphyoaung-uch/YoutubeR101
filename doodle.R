data()
rm(list = ls())

library(tidyverse)

data("CO2")
view(CO2)
?CO2

summary(CO2)

CO2 %>% 
  drop_na(conc | uptake) %>% 
  ggplot(aes(conc, uptake, colour= Treatment))+
  geom_point()+
  geom_smooth(method = "lm", se= T, colour= "red")


CO2 %>% 
  drop_na(conc | uptake) %>% 
  ggplot(aes(conc, uptake, colour= Treatment))+
  geom_point()+
  geom_smooth( se= T, colour= "red")

CO2$Type<- factor(CO2$Type)


CO2 %>% 
  drop_na(conc | Type) %>% 
  ggplot(aes(Type, conc))+
  geom_boxplot()

CO2 %>% 
  drop_na(uptake | Type) %>% 
  ggplot(aes(Type, uptake))+
  geom_boxplot()

CO2 %>% 
  drop_na(uptake | Type) %>% 
  ggplot(aes(uptake, group= Type, fill = Type))+
  geom_density(alpha=0.3)
  #theme(legend.background = F)


#Analysis

CO2 %>% 
  drop_na(uptake | Type) %>% 
  mStats::summ(uptake, by= Type)

t.test(CO2$uptake~CO2$Type)

t.test(uptake~Type, data = CO2, var.equal= T)





