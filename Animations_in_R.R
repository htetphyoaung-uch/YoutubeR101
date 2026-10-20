setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(gganimate)
library(babynames)
library(gapminder)
library(viridis)
library(RColorBrewer)


#keep only 3 names

babynames %>% 
  filter(name %in% c("James","Paul","Andrew","John")) %>% 
  filter(sex == "M") %>% 
  ggplot(aes(x = year,
             y = n,
             group = name,
             colour = name))+
  geom_line(linewidth = 1.5)+
  theme_bw()+
  scale_color_viridis(discrete = T)+
  labs(title = "Popularity of American namesin the previous",
       x = "",
       y = "",
       color = "Names")+
  theme(plot.title = element_text(size = 10,
                                  color = "steelblue"))+
  transition_reveal(year)

#save as gif

anim_save("Popular American names.gif")


gapminder %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             size = pop,
             colour = continent))+
  geom_point()+
  scale_x_log10()+
  theme_bw()+
  labs(title = "Year: {frame_time}",
       x = "GDP per Capita",
       y = "Life Expectancy")+
  theme(plot.title = element_text(size = 60,
                                  hjust = 0.5,
                                  colour = "steelblue"))+
  transition_time(year)





