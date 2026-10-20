setwd("c:/docs/youtubeR101")
rm(list=ls())

slt<- readRDS("slt_clean2.rds")

library(tidyverse)

dim(slt)
names(slt)

mStats::codebook(slt)

fivenum(slt$age)

slt %>% 
  ggplot(aes(age))+
  geom_boxplot()+
  coord_flip() + theme(panel.grid.major = element_line(linetype = "dotted"),
    panel.grid.minor = element_line(linetype = "dotted"),
    plot.title = element_text(face = "bold"),
    panel.background = element_rect(fill = "khaki"),
    plot.background = element_rect(fill = "white")) +labs(title = "Age Distribution", subtitle = "SLT study in Magway")

slt %>% 
  ggplot(aes(age))+
  geom_histogram(bins = 20)

slt <- slt %>% 
  mutate(agegp= case_when(age<40 ~ "<40",40<=age & age<60 ~ "40-60", age>=60 ~ ">60"))

slt$agegp <- as.factor(slt$agegp)

slt$agegp

mStats::tab(slt, sex)

#pie chart for sex
library(ggpie)

dat1 <- slt %>%
  count(sex)%>%
  arrange(desc(sex)) %>%
  mutate(percent = round(n*100/sum(n),1),
         lab_pos = cumsum(percent)-0.5*percent)

dat1$label <- paste(dat1$sex,"\n",round(dat1$percent),"%",sep="")
dat1

ggplot(dat1,
       aes(x = "",
           y = percent,
           fill = sex)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  geom_text(aes(y = lab_pos, label = label),
            color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  theme_void()+
  theme(legend.position = "FALSE")

mStats::tab(slt, edu)

slt %>% 
  ggplot(aes(edu))+
  geom_bar(fill="black")

#notes on mutate function{dplyr}
#if you want to create new factor variable from a factor -> use mutate(recode()) function
#if you want to create new factor variable from a numeric var -> use mutate(case_when() ) function


slt <- slt %>% 
  mutate(edugp= recode(edu,"Illiterate"="low","Read and write"="low","Primary school"="low",
                       "Middle school"="low",
                       "High school"="high","University/ Graduate"="high"))

slt$edugp

#edu status by gender

slt %>% 
  ggplot(aes(x=edu,fill=sex))+
  geom_bar(position="dodge")

mStats::tab(slt, occupation)

slt %>% 
  ggplot(aes(x=occupation,fill=sex))+
  geom_bar(position="dodge")

#income

options(scipen=999) #to turn off scientific notation ie. 3e+05

#religion

table(slt$religion)

slt <- slt %>% 
  mutate(religiongp= recode(religion,"Christian"="other","Hinduism"="other","Islam"="other"))

table(slt$religiongp)

#income

slt %>% 
  ggplot(aes(income))+
  geom_density()

median(slt$income)

slt<-slt %>% 
  mutate(incomegp = case_when(income<300000 ~ "low", income>= 300000 ~ "high"))

is.factor(slt$incomegp)

slt$incomegp <-  as.factor(slt$incomegp)


mStats::tab(slt, sex,edu,occupation, by= incomegp)

#SLT status

slt$SLT_status

slt$SLT_status<- as.factor(slt$SLT_status)

slt$SLT_status <- factor(slt$SLT_status,
                         levels = c(1,2),
                         labels = c("current user","non-user"))


mStats::tab(slt, agegp,sex,edugp,occupation, incomegp, marital,religiongp,SLTinFamily,
            SLTinFriends, by= SLT_status)


fivenum(slt$knowledge_score)

slt %>% 
  select(knowledge_score) %>% 
  na.omit() %>% 
  ggplot(aes(knowledge_score,alpha= 0.1))+
  geom_density()


slt %>% 
  select(knowledge_score,attitude_score,sex) %>% 
  na.omit() %>% 
  ggplot(aes(knowledge_score,attitude_score, color= sex))+
  geom_point()+
  geom_smooth(method = lm)

slt %>% 
  select(knowledge_score,attitude_score,income,sex) %>% 
  na.omit() %>% 
  ggplot(aes(knowledge_score,attitude_score, size= income,color= sex))+
  geom_point()

aovsexk<- aov(knowledge_score~sex, slt)
summary(aovsexk)

slt$knowledge_level<- as.factor(slt$knowledge_level)

slt$knowledge_level <- factor(slt$knowledge_level,
                         levels = c(0,1),
                         labels = c("Low","High"))

mStats::tab(slt, agegp,sex,edugp,occupation, incomegp, marital,religiongp,SLTinFamily,
            SLTinFriends, by= knowledge_level)

mStats::tab(slt, knowledge_level,by= SLT_status)


slt$attitude_level<- as.factor(slt$attitude_level)

slt$attitude_level <- factor(slt$attitude_level,
                              levels = c(0,1),
                              labels = c("Low","High"))

mStats::tab(slt, agegp,sex,edugp,occupation, incomegp, marital,religiongp,SLTinFamily,
            SLTinFriends, by= attitude_level)

mStats::tab(slt, attitude_level,by= SLT_status)

mStats::tab(slt, knowledge_level,by=attitude_level)

slt %>% 
  filter(SLT_status=="current user") %>% 
  ggplot(aes(duration))+
  geom_density()

slt %>% 
  filter(SLT_status=="current user") %>% 
  ggplot(aes(start_age))+
  geom_boxplot()

slt %>% 
  filter(SLT_status=="current user") %>% 
  ggplot(aes(start_age))+
  geom_boxplot()+
  facet_wrap(~sex)+
  coord_flip()


slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(reason)

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(form)

slt %>% 
  filter(SLT_status=="current user") %>%
  ggplot(aes(cost))+
  geom_boxplot()

slt %>% 
  filter(SLT_status=="current user") %>%
  ggplot(aes(cost))+
  geom_density()

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(everyday_use)

slt %>% 
  filter(SLT_status=="current user") %>%
  ggplot(aes(times_per_day))+
  geom_histogram()

slt %>% 
  filter(SLT_status=="current user") %>%
  ggplot(aes(times_per_day,sex))+
  geom_violin()+
  coord_flip()

#wish to quit
library(ggpie)

dat2 <- slt %>% 
  drop_na(wish_to_quit) %>%    # can't use na.omit()
  count(wish_to_quit)%>%
  arrange(desc(wish_to_quit)) %>%
  mutate(percent = round(n*100/sum(n),1),
         lab_pos = cumsum(percent)-0.5*percent)

dat2$label <- paste(dat2$wish_to_quit,"\n",round(dat2$percent),"%",sep="")
dat2

ggplot(dat2,
       aes(x = "",
           y = percent,
           fill = wish_to_quit)) +
  geom_bar(width = 1,
           stat = "identity",
           color = "black") +
  geom_text(aes(y = lab_pos, label = label),
            color = "black") +
  coord_polar("y",
              start = 0,
              direction = -1) +
  theme_void()+
  theme(legend.position = "FALSE")+
  labs(title = " Wish To Quit Tobacco in Current users")





slt %>% 
  select(yes_why) %>% 
  na.omit() %>% 
  mStats::tab()

slt %>% 
  select(yes_why) %>% 
  drop_na() %>% 
  mStats::tab()

slt %>% 
  select(no_why) %>% 
  na.omit() %>% 
  mStats::tab()

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(difficult)

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(stop_a_week)

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(seek_help)

slt %>% 
  filter(SLT_status=="current user") %>%
  mStats::tab(consel)

a <-slt %>% 
  select(C1) %>% 
  na.omit() %>% 
  ggplot(aes(C1))+
  geom_bar()


mStats::tab(slt,C1)


b <-slt %>% 
  select(C2) %>% 
  na.omit() %>% 
  ggplot(aes(C2))+
  geom_bar()

library(ggridges)
library(patchwork)
library(viridis)
library(hrbrthemes)

(a|b)+
  plot_annotation()



#filling colours

colors() # there are 657 varity of colours avialable

slt %>% 
  select(C1,SLTinFamily) %>% 
  drop_na() %>% 
  ggplot(aes(C1))+
  geom_bar()+
  facet_wrap(~SLTinFamily)

slt %>% 
  select(SLT_consumption,occupation) %>% 
  drop_na() %>% 
  ggplot(aes(SLT_consumption))+
  geom_bar(fill="skyblue3")+
  facet_wrap(~occupation)+
  theme(legend.position = "")

  
slt %>% 
  ggplot(aes(income))+
  geom_histogram(fill= "tomato3")+
  facet_wrap(~edu)+
  theme(legend.position = "")

slt %>% 
  ggplot(aes(marital))+
  geom_bar(fill= "Blue")



