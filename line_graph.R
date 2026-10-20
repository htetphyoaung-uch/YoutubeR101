setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)
data()

view(Orange)
?Orange

Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference))+
  geom_point()

Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth()

Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth(method = "lm")

Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth(method = "lm", se = F)

#facet wrap by type of tree


Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title = "Tree age and circumfrence")
  
# line graph 

Orange %>% 
  filter(Tree != "2" &
         Tree != "1") %>% 
  ggplot(aes(age, circumference, colour = Tree))+
  geom_point(size = 5, alpha = 0.3)+
  geom_line(linewidth = 2, alpha = 0.5)+
  theme_minimal()+
  scale_color_brewer(palette = "Set2")
  labs(title = "Tree age and circumfrence")
  
  
  
  





