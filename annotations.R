setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)
theme_set(theme_minimal())

set.seed(1)

t <- slice_sample(trees, n= 5)


p <- t %>% ggplot(aes(Girth, Height))+
  geom_point()

p

p+ annotate(geom = "text",
            x = 16,
            y = 75,
            label = "Outlier")

p+ annotate(geom = "label",
            x = 16,
            y = 75.5,
            label = "Outlier")










