setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)

#data 
library(gapminder)

view(gapminder)

summary(gapminder)

?filter

#1. Filter()
#logical operaters
# Australian data from whole dataset

australia <- gapminder %>% 
  filter(country=="Australia")

#countries with life expectancy more than 80

life80 <- gapminder %>% 
  filter(lifeExp>80)
view(life80)

#2. arrange() reorder rows(ie.observations)
#highest gdp per cap

gapminder %>% 
  arrange(gdpPercap) #lowest to highest (ascending order)


gapminder %>% 
  arrange(desc(gdpPercap)) #highest to lowest

head(gapminder %>% arrange(desc(gdpPercap)))

#3. select() selecting variables

gap_small <- gapminder %>% 
  select(year, country, gdpPercap)

gap_reorder <- gapminder %>% 
  select(year,country,everything()) # select function can also reorder vars

#combine operations

gap_small_97 <- gap_small %>%  
  filter(year == 1997)

#the strength of pipeing %>% ***

same1997 <-gapminder %>% 
  select(year,country,gdpPercap) %>% 
  filter(year==1997)


# Quiz ... 2002 lifeexp for Eritrea

gapminder %>% select(country,year, lifeExp) %>% 
  filter(country=="Eritrea", year==2002)


#4. mutate() creating new var

gap_gdp <- gapminder %>% 
  mutate(gdp= gdpPercap*pop,
         gdpMil= gdp/ 10^6)


#5. summarise

gapminder %>% 
  summarise(mean(lifeExp))

#6. group_by ... diff into catagorical var


gapminder %>% 
  group_by(continent) %>% 
  summarise(mean(lifeExp)) # mean lifeexp for continent



gapminder %>% 
  filter(year==2007) %>% 
  group_by(continent) %>% 
  summarise(mean(lifeExp))

#Quiz.... max lifeExp ever recorded for each country

gapminder %>% 
  group_by(country) %>% 
  summarise(MaxLE= max(lifeExp))


gapminder %>% 
  group_by(country) %>% 
  summarise(MaxLE= max(lifeExp)) %>% 
  arrange(MaxLE)


gapminder %>% 
  group_by(country) %>% 
  summarise(MaxLE= max(lifeExp)) %>% 
  arrange(desc(MaxLE))


# filtering tips Youtube R101

library(tidyverse)

view(msleep)

my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(sleep_total>18)


my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(!sleep_total>18)  # ! sign means not


my_data <- msleep %>% 
  select(name,order,bodywt,sleep_total) %>% 
  filter(order=="Primates",bodywt>20) 

my_data <- msleep %>% 
  select(name,order,bodywt,sleep_total) %>% 
  filter(order=="Primates"| bodywt>20) 


my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(name=="Cow"|
           name=="Dog"|
           name=="Goat") 

my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(name %in% c("Cow","Dog","Goat")) 



my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(between(sleep_total,16,18))



my_data <- msleep %>% 
  select(name,sleep_total) %>% 
  filter(near(sleep_total,17,tol = 0.5))



my_data <- msleep %>% 
  select(name,conservation,sleep_total) %>% 
  filter(is.na(conservation))


my_data <- msleep %>% 
  select(name,conservation,sleep_total) %>% 
  filter(!is.na(conservation))





