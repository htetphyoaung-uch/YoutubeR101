setwd("c:/docs/youtubeR101")
rm(list=ls())

igd<- readRDS("igd_clean.rds")

dim(igd)
names(igd)


mStats::codebook(igd)

library(tidyverse)

glimpse(igd)
#age
is.na(igd$Age)
sum(is.na(igd$Age))

fivenum(igd$Age)


igd %>% 
  ggplot(aes(Age))+
  geom_boxplot(fill="cyan")+
  coord_flip()+
  theme_minimal()


igd %>% 
  ggplot(aes(Age))+
  geom_histogram(bins= 10)+
  theme_minimal()


mStats::tab(igd, Sex, Academic_year, Living_status, Marital_status, Play_E_Games)

#pie chart for sex
library(ggpie)

dat1 <- igd %>%
  count(Sex)%>%
  arrange(desc(Sex)) %>%
  mutate(percent = round(n*100/sum(n),1),
         lab_pos = cumsum(percent)-0.5*percent)

dat1$label <- paste(dat1$Sex,"\n",round(dat1$percent),"%",sep="")
dat1

ggplot(dat1,
       aes(x = "",
           y = percent,
           fill = Sex)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  geom_text(aes(y = lab_pos, label = label),
            color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  scale_fill_brewer(palette = "Set2")+ 
  theme_void()+
  theme(legend.position = "FALSE")


#Academic year

igd %>% 
  ggplot(aes(Academic_year, fill= Academic_year))+
  geom_bar()+
  scale_fill_brewer(palette = "Set2")+ 
  theme(legend.position = "FALSE")

#living status

igd %>% 
  ggplot(aes(Living_status, fill= Living_status))+
  geom_bar()+
  theme_minimal()+
  theme(legend.position = "FALSE")


igd %>% 
  ggplot(aes(Living_status, fill= Living_status))+
  geom_bar()+
  facet_wrap(~Academic_year)+
  scale_fill_brewer(palette = "Set2")+ 
  theme(legend.position = "FALSE")

#Average expense 

igd %>% 
  ggplot(aes(Average_expense))+
  geom_density()

options(scipen=999) #to turn off scientific notation ie. 3e+05

igd %>% 
  ggplot(aes(Average_expense))+
  geom_density()

igd %>% 
  ggplot(aes(Average_expense, Sex, fill=Sex))+
  geom_boxplot()+
  coord_flip()+
  labs(y="",
       x="Avg Expense",
       title = "Expense by Sex")+
  theme(legend.position = "FALSE")

igd %>% 
  ggplot(aes(Average_expense,fill=Living_status))+
  geom_boxplot()+
  coord_flip()+
  facet_wrap(~Living_status)+
  theme(legend.position = "F")

mStats::tab(igd, Marital_status)


mStats::tab(igd, Play_E_Games)


# platform used for playing

library(ufs)

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  multiResponse(c("Platform_PC","Platform_Console","Platform_Phone"))

#Reason for playing

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  multiResponse(c("Reason_1","Reason_2","Reason_3","Reason_4"))


igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  ggplot(aes(Preferred_G_type))+
  geom_bar(fill="steelblue")
  






est1 <- lm(IGD_score~Weekends_time,igd);est1
summary(est1)




igd %>% 
  drop_na(IGD_score) %>% 
  ggplot(aes(IGD_score))+
  geom_histogram()


igd %>% 
  drop_na(IGD_score) %>%  #removing NAs from IGD score
  ggplot(aes(Academic_year, IGD_score, fill= Academic_year))+
  geom_boxplot()+
  theme(legend.position = "")


igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  ggplot(aes(IGD_score, Weekdays_time))+
  geom_point()+
  geom_smooth()

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  ggplot(aes(IGD_score, Weekends_time))+
  geom_point()+
  geom_smooth() + theme(panel.grid.major = element_line(linetype = "blank"),
    panel.grid.minor = element_line(linetype = "dashed"),
    panel.background = element_rect(fill = "gray90",
        linetype = "dashed"), plot.background = element_rect(fill = "white")) +
  labs(title = "Scatter plot on time and score",
    subtitle = "UOCH")

igd %>% 
  filter(Play_E_Games=="Yes") %>% 
  ggplot(aes(IGD_score, Weekends_time, 
             colour=Sex, 
             size= Gaming_Cost))+
  scale_fill_brewer(palette = "Set2")+
  geom_point()+
  geom_smooth(method="lm")







