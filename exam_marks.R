setwd("c:/docs/youtubeR101")

library(tidyverse)
exam <- readxl::read_excel("Marks.xlsx")

glimpse(exam)
summary(exam)

hist(exam$Marks)
boxplot(exam$Marks)

exam %>% 
  drop_na(Marks) %>% 
  ggplot(aes(Marks))+
  geom_histogram(bins = 15,colour = "green", fill = "Blue")+
  theme_classic()

exam %>% 
  drop_na(Marks) %>% 
  ggplot(aes(Marks))+
  geom_density(colour= "red",fill="green")+
  theme_bw()+
  labs(title = "Density Plot", x = "Exam marks")

exam %>% 
  ggplot(aes(Marks))+
  geom_boxplot()+
  coord_flip()




