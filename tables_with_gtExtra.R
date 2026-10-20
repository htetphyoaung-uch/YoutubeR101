setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())


library(gtExtras)
library(tidyverse)

#create a summary of your data

iris %>% 
  gt_plt_summary()

#insert icon and tables in your data

mtcars %>% 
  group_by(cyl) %>% 
  summarize(Median = round(median(mpg),1),
            Mean = round(mean(mpg),1),
            Distribution = list(mpg)) %>% 
  view()
  
            

mtcars %>% 
  group_by(cyl) %>% 
  summarize(Median = round(median(mpg),1),
            Mean = round(mean(mpg),1),
            Distribution = list(mpg)) %>% 
  gt() %>% 
  gt_plt_dist(Distribution) %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Miles per gallon statistics")







