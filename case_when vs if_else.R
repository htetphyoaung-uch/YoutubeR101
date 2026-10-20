setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(gtExtras)

starwars %>% 
  select(name,hair_color, species) %>% 
  head(10) %>% 
  #add table formatting
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid",
                    fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown",
                    fill = "brown")


#if_else

starwars %>% 
  select(name,hair_color, species) %>% 
  mutate(hair_color = if_else(
    is.na(hair_color) &
    species == "Droid",
    "no hair",
    hair_color)) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid",
                    fill = "steelblue")


#case_when

starwars %>% 
  select(name,hair_color, species) %>% 
  mutate(hair_color = case_when(
    is.na(hair_color) &
      species == "Droid" ~ "no hair",
    hair_color == "brown" ~ "pink",
    TRUE ~ hair_color)) %>% 
  head(10) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid",
                    fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "pink",
                    fill = "pink")









