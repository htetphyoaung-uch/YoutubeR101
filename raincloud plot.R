setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(tidyquant)
library(ggdist)
library(gghalves)

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  ggdist::stat_halfeye(adjust = .5, width = .3, .width = c(0.5, 1)) + 
  ggdist::stat_dots(side = "left", dotsize = .4, justification = 1.05, binwidth = .1)

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  ggdist::stat_halfeye(adjust = .5, width = .3, .width = c(0.5, 1)) + 
  ggdist::stat_dots(side = "left", dotsize = .4, justification = 1.05, binwidth = .1)+
  coord_flip()

iris %>% 
  ggplot(aes(Species, Sepal.Width, fill= Species)) + 
  ggdist::stat_halfeye(adjust = .5, width = .3, .width = c(0.5, 1)) + 
  ggdist::stat_dots(side = "left", dotsize = .4, justification = 1.05, binwidth = .1)+
  coord_flip()


iris %>% 
  ggplot(aes(Species, Sepal.Width,fill= Species)) + 
  stat_halfeye(adjust = .5, width = .3, .width = c(0.5, 1)) + 
  stat_dots(side = "left", dotsize = .4, justification = 1.05, binwidth = .1)+
  coord_flip()

# with boxplot

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  stat_halfeye(adjust = .5, width = .3, .width = 0, justification = -.3, point_colour = NA) + 
  geom_boxplot(width = .1, outlier.shape = NA) +
  stat_dots(side = "left", dotsize = .3, justification = 1.1, binwidth = .1)


iris %>% 
  ggplot(aes(Species, Sepal.Width,fill=Species)) + 
  stat_halfeye(adjust = .5, width = .3, .width = 0, justification = -.3, point_colour = NA) + 
  geom_boxplot(width = .1, outlier.shape = NA) +
  stat_dots(side = "left", dotsize = .3, justification = 1.1, binwidth = .1)+
  coord_flip() + theme(panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "blank"),
    panel.background = element_rect(fill = "white")) +labs(title = "Raincloud plot", subtitle = "Species with sepal width")


#with boxplot + jitter (on top)

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  stat_halfeye(adjust = .5, width = .7, .width = 0, justification = -.2, point_colour = NA) + 
  geom_boxplot(width = .2, outlier.shape = NA) + 
  geom_jitter(width = .05, alpha = .3)


iris %>% 
  ggplot(aes(Species, Sepal.Width,fill=Species)) + 
  stat_halfeye(adjust = .5, width = .7, .width = 0, justification = -.2, point_colour = NA) + 
  geom_boxplot(width = .2, outlier.shape = NA) + 
  geom_jitter(width = .05, alpha = .3)


#with boxplot + jitter (side by side)

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  stat_halfeye(adjust = .5, width = .3, .width = 0, justification = -.3, point_colour = NA) + 
  geom_boxplot(width = .1, outlier.shape = NA) +
  gghalves::geom_half_point(side = "l", range_scale = .4, alpha = .5)


#with boxplot + barcode (side by side)

iris %>% 
  ggplot(aes(Species, Sepal.Width)) + 
  stat_halfeye(adjust = .5, width = .3, .width = 0, justification = -.3, point_colour = NA) + 
  geom_boxplot(width = .1, outlier.shape = NA) +
  geom_half_point(side = "l", range_scale = 0, shape = 95, size = 15, alpha = .3)










