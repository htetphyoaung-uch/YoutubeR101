setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(sf)
library(ggthemes)
library(rnaturalearth)


#load the data set

world <- ne_countries(scale = "medium",
                      returnclass = "sf")

view(world)


world %>% 
  ggplot(aes(fill = income_grp))+
  geom_sf()+
  labs(title = "World map by income group",
       fill = "Income Group")+
  scale_fill_viridis_d()+
  theme_map()+
  theme(legend.position = "right",
        legend.title = element_text(face = "bold"),
        plot.title = element_text(size = 50,
                                  colour = "steelblue",
                                  vjust = 0.5,
                                  face = "bold"))




world %>% 
  filter(region_un == "Africa") %>% 
  ggplot()+
  geom_sf(aes(fill = pop_est/1e6,
              colour = "white",
              lwd = 0.3))+
  labs(title = "Africa by population size",
       fill = "Population\n(millions)")+
  theme_map()+
  theme(legend.position = "top")















