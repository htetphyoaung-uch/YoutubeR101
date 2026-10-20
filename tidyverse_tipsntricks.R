setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

#tips of tidyverse

#install packages

library(tidyverse)
library(lubridate)

#install.packages("nycflights13")

library(nycflights13)

view(flights)

#tip 1 Create a new column in a count or group by

flights %>% 
  mutate(long_flights = (air_time >= 6*60)) %>% 
  view()


flights %>% 
  count(long_flights = (air_time >= 6*60))




#tip 2 Sample randomly shuffle from dada set by slice_sample


flights %>% 
  slice_sample(n=10) #sampling 10 random observations


flights %>% 
  slice_sample(prop = 0.01) #slicing 1% of sample




#tip 3 Creating a date column by specifying date month year

flights %>% 
  select(year, month, day) %>% 
  mutate(date= make_date(year,month, day))





#tip 4 if you have a column of string with numbers in it you can extract with 
# parse_number function

example <- tibble(number_col = c("gswqq1.33","$#$555.66","hgsfe!@@12.66"))

example %>% 
  mutate(number_col= parse_number(number_col))




#tip 5 Selecting columns(Variables) by starts_with, ends_with function

flights %>% 
  select(starts_with("dep_"), everything())

flights %>% 
  select(ends_with("hour"))


flights %>% 
  select(ends_with("hour"), everything())


flights %>% 
  select(contains("dep"))



#tip 6 case_when function to create or change a column when conditions are met

flights %>% 
  mutate(origin= case_when(
    origin== "EWR"~"Newwark International Airport",
    origin== "JFK"~"John F. Kennedy Int'l Airport",
    origin== "LGA"~"LaGuardia Airport"))


















