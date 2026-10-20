setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)

?geom_errorbar

?ToothGrowth
View(ToothGrowth)

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(mean_len = mean(len),
            sd_len = sd(len))

#Point

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(mean_len = mean(len),
            sd_len = sd(len)) %>% 
  ggplot(aes(dose,mean_len))+
  geom_point(size = 3,
             colour ="blue")+
  geom_errorbar(aes(dose,
                    ymin= mean_len - sd_len,
                    ymax= mean_len + sd_len,
                    width = 0.05))+
  labs(title = "Average Tooth Growth between VC Groups",
       x = "Dose",
       y = "Average growth")
  
#Bar

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(mean_len = mean(len),
            sd_len = sd(len)) %>% 
  ggplot(aes(dose,mean_len))+
  geom_bar(stat = "identity",
           fill = "blue",
           alpha = 0.7)+
  geom_errorbar(aes(dose,
                    ymin= mean_len - sd_len,
                    ymax= mean_len + sd_len,
                    width = 0.05))+
  labs(title = "Average Tooth Growth between VC Groups",
       x = "Dose",
       y = "Average growth")





