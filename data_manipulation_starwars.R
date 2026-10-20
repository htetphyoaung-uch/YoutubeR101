setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)
data()

view(starwars)

#want to know the BMI of characters by gender

starwars %>% 
  select(height, mass, gender, species) %>% # selecting variables of interest
  na.omit() %>%                             # dropping NAs
  filter(species == "Human") %>%            # filtering human only
  mutate(height = height/100) %>%           # creating new variable
  mutate(BMI = mass/ height^2) %>%          # compute and creating new variable
  group_by(gender) %>%                      # forming groups
  summarise(Average_BMI = mean(BMI))


# selecting and filtering with tol argument

msleep %>% 
  select(name,sleep_total) %>% 
  filter(near(sleep_total,17, tol = 2))

msleep %>% 
  select(name,sleep_total) %>% 
  filter(near(sleep_total,17, tol = 3))








#dataviz 

starwars %>% 
  select(height, mass, gender, species) %>% 
  na.omit() %>%                             
  filter(species == "Human") %>%           
  mutate(height = height/100) %>%           
  mutate(BMI = mass/ height^2) %>%        
  ggplot(aes(gender, BMI))+
  geom_boxplot()
  
starwars %>% 
  select(height, mass, gender, species) %>% 
  na.omit() %>%                             
  filter(species == "Human") %>%           
  mutate(height = height/100) %>%           
  mutate(BMI = mass/ height^2) %>%        
  ggplot(aes(BMI, colour = gender))+
  geom_density()
  
view(msleep)

msleep %>% 
  select(name,sleep_total,brainwt) %>% 
  drop_na(sleep_total,brainwt) %>% 
  mutate(brainwt_ingm = brainwt * 1000) %>% 
  view()

msleep %>% 
  select(name,sleep_total,brainwt) %>% 
  drop_na(sleep_total,brainwt) %>% 
  mutate(brainwt_ingm = brainwt * 1000) %>% 
  ggplot(aes(brainwt_ingm,sleep_total))+
  geom_point()+
  geom_smooth(method = lm)
 

#data wrangling using groupby and summerise
#youtube


library(tidyverse)
?group_by
?summarise


diamonds
glimpse(diamonds)

summarise(diamonds, mean(price)) #same as base r

diamonds %>% 
  group_by(cut) %>% 
  summarise(mean(price))

#labelling and adding columns

diamonds %>% 
  group_by(cut) %>% 
  summarise(avg_price = mean(price),
            avg_carat = mean(carat))

#using num var in groupby 


diamonds %>% 
  group_by(carat > 1) %>% 
  summarise(avg_price = mean(price))

#adding another var

diamonds %>% 
  group_by(carat > 1, cut) %>% 
  summarise(avg_price = mean(price))

diamonds %>% 
  group_by(Big=carat > 1, cut) %>%  #naming 
  summarise(avg_price = mean(price))

# visaualize


diamonds %>% 
  group_by(Big=carat > 1, cut) %>%  
  summarise(avg_price = mean(price)) %>% 
  ggplot(aes(cut, avg_price, fill= Big))+
  geom_col(position = "dodge")

#group by + other

diamonds %>% 
  group_by(cut) %>% 
  mutate(avg_price_by_cut= mean(price))

























  
  