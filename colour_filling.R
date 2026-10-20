setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
view(mpg)

theme_set(theme_minimal())


mpg %>% 
  ggplot(aes(cty,hwy))+
  geom_point()

mpg %>% 
  ggplot(aes(cty,hwy))+
  geom_point(colour= "red")

#all colours supported by R

colours() #there are 657 colours available


#colour vs fill arguments

mpg %>% 
  ggplot(aes(cty))+
  geom_histogram()

mpg %>% 
  ggplot(aes(cty))+
  geom_histogram(colour= "red")


mpg %>% 
  ggplot(aes(cty))+
  geom_histogram(colour= "red",
                 fill= "blue")


# otherwise go to google search "colour picker" and pick a colour you like 
# copy the code for colour you pick and paste at the colour code needed in R


mpg %>% 
  ggplot(aes(cty,hwy))+
  geom_point(colour= "#228199")


