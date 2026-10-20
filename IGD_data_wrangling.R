setwd("c:/docs/youtubeR101")
rm(list=ls())

library(tidyverse)

#data manipulation/ wrangling

igd<-haven::read_sav("IGD_data.sav")

dim(igd)
names(igd)

mStats::codebook(igd)

#age 

is.na(igd$Age)

igd %>% 
  ggplot(aes(Age))+
  geom_boxplot(fill="cyan")+
  coord_flip()

#sex

igd$Sex

igd$Sex <- as.factor(igd$Sex)

igd$Sex<-factor(igd$Sex,
                levels=c(1,2),
                labels=c("Male", "female"))

#academic year

igd$Academic_year

igd$Academic_year <- as.factor(igd$Academic_year)

igd$Academic_year<-factor(igd$Academic_year,
                levels=c(1,2,3,4),
                labels=c("First year", "Second year","Third year","Final year"))

#living status

igd$Living_status

igd$Living_status <- as.factor(igd$Living_status)

igd$Living_status<-factor(igd$Living_status,
                          levels=c(1,2,3,4),
                          labels=c("With family/Relatives", "University Dormitory",
                                   "Private Hostel","Other"))

#average expanse

options(scipen=999) #to turn off scientific notation ie. 3e+05

igd %>% 
  ggplot(aes(Average_expense))+
  geom_density(fill="darkgray")

#marital

igd$Marital_status

igd$Marital_status <- as.factor(igd$Marital_status)

igd$Marital_status <-factor(igd$Marital_status,
                levels=c(1,2),
                labels=c("Single", "Married"))

#habit of playing games

igd$Play_E_Games

igd$Play_E_Games <- as.factor(igd$Play_E_Games)

igd$Play_E_Games <-factor(igd$Play_E_Games,
                            levels=c(1,2),
                            labels=c("Yes", "No"))

# platform used for playing

library(ufs)

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  multiResponse(c("Platform_PC","Platform_Console","Platform_Phone"))

#Reason for playing

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  multiResponse(c("Reason_1","Reason_2","Reason_3","Reason_4"))


igd$Preferred_G_type

igd$Preferred_G_type <- as.factor(igd$Preferred_G_type)

igd$Preferred_G_type <-factor(igd$Preferred_G_type,
                            levels=c(1,2,3,4,5),
                            labels=c("Simulation/ Strategy", "RPG","Sports/ Training",
                                     "Shooting/ Action","Puzzle/ Arcade"))

#playing online multiplayer games

igd$Play_online_games

igd$Play_online_games <- as.factor(igd$Play_online_games)

igd$Play_online_games <-factor(igd$Play_online_games,
                              levels=c(1,2,3),
                              labels=c("Sometimes", "Always","Never"))

#IGD Questions

igd$C_1 <- as.factor(igd$C_1)

igd$C_1 <-factor(igd$C_1,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))


igd$C_2 <- as.factor(igd$C_2)

igd$C_2 <-factor(igd$C_2,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))

igd$C_3 <- as.factor(igd$C_3)

igd$C_3 <-factor(igd$C_3,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))


igd$C_4 <- as.factor(igd$C_4)

igd$C_4 <-factor(igd$C_4,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))


igd$C_5 <- as.factor(igd$C_5)

igd$C_5 <-factor(igd$C_5,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))

igd$C_6 <- as.factor(igd$C_6)

igd$C_6 <-factor(igd$C_6,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))

igd$C_7 <- as.factor(igd$C_7)

igd$C_7 <-factor(igd$C_7,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))


igd$C_8 <- as.factor(igd$C_8)

igd$C_8 <-factor(igd$C_8,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))

igd$C_9 <- as.factor(igd$C_9)

igd$C_9 <-factor(igd$C_9,
                 levels=c(1,2,3,4,5),
                 labels=c("Never", "Rarely","Sometimes","Often","Very Often"))

library(rio)

export(igd,"igd_clean.rds")




igd %>% 
  ggplot(aes(IGD_score))+
  geom_histogram()


igd %>% 
  drop_na(IGD_score) %>%  #removing NAs from IGD score
  ggplot(aes(Academic_year, IGD_score, fill= Academic_year))+
  geom_boxplot()+
  theme(legend.position = "")

  
 
  
  
  
  
  
  


