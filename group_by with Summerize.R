setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)

view(msleep)
names(msleep)


msleep %>% 
  drop_na(sleep_rem, vore) %>% 
  group_by(vore) %>% 
  summarise("Average Total Sleep" = mean(sleep_total),
            "Maximum REM Sleep" = max(sleep_rem)) %>% 
  view()










