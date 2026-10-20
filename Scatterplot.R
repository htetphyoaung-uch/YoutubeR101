setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)
library(modeldata)

view(penguins)

penguins %>%
  ggplot(aes(bill_length_mm, flipper_length_mm)) +
  geom_point()

#adding smoothing line

penguins %>%
  ggplot(aes(bill_length_mm, flipper_length_mm)) +
  geom_point()+
  geom_smooth()

#linear model smoothing line

penguins %>%
  ggplot(aes(bill_length_mm, flipper_length_mm)) +
  geom_point()+
  geom_smooth(method = "lm")

#Removing SE

penguins %>%
  ggplot(aes(bill_length_mm, flipper_length_mm)) +
  geom_point()+
  geom_smooth(method = "lm",
              se = FALSE)

#Changing aesthetics

penguins %>%
  ggplot(aes(flipper_length_mm, bill_length_mm)) +
  geom_point(size =2,                                 #size of point
             shape = "square",                        #shape
             colour = "blue",                         #colour changing
             alpha = 0.5)+                            #transparancy
  geom_smooth(method = "lm",
              se = FALSE)

#layering to suspecious factor

penguins %>%
  ggplot(aes(flipper_length_mm, 
             bill_length_mm,
             colour = island)) +
  geom_point()

penguins %>%
  ggplot(aes(flipper_length_mm, 
             bill_length_mm,
             colour = island)) +
  geom_point()+
  scale_color_brewer(palette = "Dark2") #colourblind friendly


penguins %>%
  ggplot(aes(flipper_length_mm, 
             bill_length_mm,
             colour = species)) +
  geom_point()+
  scale_color_brewer(palette = "Dark2")


penguins %>%
  ggplot(aes(flipper_length_mm, 
             bill_length_mm,
             colour = species)) +
  geom_point()+
  geom_smooth(method = "lm",
              se = FALSE)+
  scale_color_brewer(palette = "Dark2")

#final tuning graphic visuals

penguins %>%
  ggplot(aes(flipper_length_mm, 
             bill_length_mm,
             colour = species)) +
  geom_point()+
  geom_smooth(method = "lm",
              se = FALSE)+
  scale_color_brewer(palette = "Dark2")+
  labs( x = "Flipper length",
        y = "Bill length",
        title = "Penguin measurements",
        colour = "Species")+
  theme_minimal()





