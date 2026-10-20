setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(plotly)


p <- starwars %>% 
  drop_na(height, mass, eye_color) %>% 
  filter(mass < 250) %>% 
  filter(eye_color %in% c("blue",
                          "brown",
                          "black",
                          "pink",
                          "red",
                          "orange")) %>% 
  ggplot(aes(height,
             mass,
             colour = eye_color))+
  geom_jitter(size = 6,
              alpha = 0.6)+
  scale_color_manual(values = c("blue" = "blue",
                                "brown" = "brown",
                                "black" = "black",
                                "pink" = "pink",
                                "red"= "red",
                                "orange" = "orange"))+
  theme_bw()+
  theme(legend.position = c(0.05,0.98),
        legend.justification = c("left","top"))+
  labs(title = "Height, Mass and Eye_colour",
       x = "Height",
       y = "Mass",
       colour = "Eye_colour")

p


#interactive plot

ggplotly(p) 

#3D

trees %>% 
  plot_ly( x = ~Girth,
           y = ~Height,
           z = ~Volume)

plot_ly(z = volcano ,type = "surface")








