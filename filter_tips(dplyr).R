setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)

#filtering tips

view(msleep)

#1

my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(sleep_total>18) #filtering sleep total >18

my_data

#2

my_data2 <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(!sleep_total>18) #  "!" means "opposite" on every argument

my_data2

#3

my_data3 <- msleep %>% 
  select(name,order, bodywt, sleep_total) %>% 
  filter(order== "Primates", bodywt >20) # "," in filter function means "and"

my_data3 

#4

my_data4 <- msleep %>% 
  select(name,order, bodywt, sleep_total) %>% 
  filter(order== "Primates"| bodywt >20) #"|" means "OR"

my_data4

#5

my_data5 <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(name== "Cow" |
           name== "Dog" |
           name== "Goat")

my_data5

#6

my_data6 <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(name %in% c("Cow","Dog","Horse"))

my_data6

#7

my_data7 <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(between(sleep_total, 16,18))

my_data7

#8

my_data8 <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(near(sleep_total, 17, tol = 0.5))

my_data8


#9

my_data9 <- msleep %>% 
  select(name,sleep_total, conservation) %>% 
  filter(is.na(conservation))

my_data9

#10

my_data10 <- msleep %>% 
  select(name,sleep_total, conservation) %>% 
  filter(!is.na(conservation))

my_data10


#11
#changing variable name while selecting
#filter using %in%

starwars %>% 
  select(name, kind = species) %>% 
  filter(kind %in% c("Human","Droid"))






