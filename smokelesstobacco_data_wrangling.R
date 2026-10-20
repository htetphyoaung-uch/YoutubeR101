setwd("c:/docs/youtubeR101")
rm(list=ls())

#data manipulation/ wrangling

slt<-haven::read_sav("variables for research.sav")

dim(slt)
names(slt)

unique(slt$ward)
summary(slt)
str(slt)

library(tidyverse)

slt$ward

slt$ward <- as.character(slt$ward)

slt$ward<-recode(slt$ward, "1"= "Sar-shwe-kin","2"="zay-lal-soe","3"="myoma-oh-bo","4"="sone",
       "5"="myo-hound","6"="thingar-ghiri","7"="ywarthit-pwekyo","8"="pyi-taw-thar",
       "9"="myin-thar","10"="kan-thar","11"="min-kan-gyi","12"="aung-mingalar",
       "13"="aung-chanthar","14"="aung-yadanar","15"="aung-myittar")

slt$ward

slt$sex<-factor(slt$sex,
                   levels=c(1,2),
                   labels=c("male", "female"))


slt$sex

slt$edu<- as.factor(slt$edu)

slt$edu <- factor(slt$edu,
                  levels=c(1,2,3,4,5,6),
                  labels=c("Illiterate","Read and write","Primary school",
                  "Middle school","High school","University/ Graduate"))
slt$edu

slt$occupation <- as.factor(slt$occupation)

slt$occupation <- factor(slt$occupation,
                  levels=c(1,2,3,4,5),
                  labels=c("Government staff","Private staff","Own business",
                           "Manual worker","Dependent"))
slt$occupation

slt$marital <- as.factor(slt$marital)

slt$marital <- factor(slt$marital,
                         levels=c(1,2,3,4),
                         labels=c("single","married","divorced/separated","widow"))

slt$religion <- as.factor(slt$religion)

slt$religion <- factor(slt$religion,
                      levels=c(1,2,3,4),
                      labels=c("Buddhist","Christian","Hinduism","Islam"))

slt$familytype <- as.factor(slt$familytype)

slt$familytype <- factor(slt$familytype,
                       levels=c(1,2,3),
                       labels=c("Nuclear","Extanded","Three generations"))

slt$SLTinFamily <- as.factor(slt$SLTinFamily)

slt$SLTinFamily<-factor(slt$SLTinFamily,
                levels=c(1,2),
                labels=c("Yes", "No"))

library(ufs)

slt %>% 
  filter(SLTinFamily == "Yes") %>% 
  multiResponse(c("A10_1","A10_2","A10_3","A10_4","A10_5","A10_6","A10_7"))

slt$SLTinFriends <- as.factor(slt$SLTinFriends)

slt$SLTinFriends<-factor(slt$SLTinFriends,
                        levels=c(1,2),
                        labels=c("Yes", "No"))


#Knowledge questions
#B1 =Smokeless tobacco usage can be addict

slt$B1 <- as.factor(slt$B1)

slt$B1<- factor(slt$B1,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))



#B2 =Smokeless tobacco can be harmful to health

slt$B2 <- as.factor(slt$B2)

slt$B2<- factor(slt$B2,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B3 =Smokeless tobacco usage can cause oral cancer

slt$B3 <- as.factor(slt$B3)

slt$B3<- factor(slt$B3,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B4 =Smokeless tobacco usage can cause Goiter

slt$B4 <- as.factor(slt$B4)

slt$B4<- factor(slt$B4,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B5 =Smokeless tobacco usage can cause renal stones

slt$B5 <- as.factor(slt$B5)

slt$B5<- factor(slt$B5,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B6 =Smokeless tobacco usage can cause Osteoporosis

slt$B6 <- as.factor(slt$B6)

slt$B6<- factor(slt$B6,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B7 =Infectious diseases can transmitted by spitting SLT carelessly

slt$B7 <- as.factor(slt$B7)

slt$B7<- factor(slt$B7,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B8 =Using SLT can cause oral cleansing

slt$B8 <- as.factor(slt$B8)

slt$B8<- factor(slt$B8,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B9 =SLT usage can make the teeth stronger

slt$B9 <- as.factor(slt$B9)

slt$B9<- factor(slt$B9,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B10 =SLT usage has curative and palliative effect on headache and toothache

slt$B10 <- as.factor(slt$B10)

slt$B10<- factor(slt$B10,
                levels=c(1,2,3),
                labels=c("Yes","No","Don't Know"))

#B11 =SLT usage can cause environmental pollution

slt$B11 <- as.factor(slt$B11)

slt$B11 <- factor(slt$B11,
                 levels=c(1,2,3),
                 labels=c("Yes","No","Don't Know"))

#B12 =Have you ever heard that the law concerning tobacco products in Myanmar?

slt$B12 <- as.factor(slt$B12)

slt$B12 <- factor(slt$B12,
                  levels=c(1,2,3),
                  labels=c("Yes","No","Don't Know"))

#knowledge source (multiple response)

slt %>% 
  multiResponse(c("K_source_1","K_source_2","K_source_3","K_source_4"))

#Attitude Questions

#C1 =Oral cancer caused by SLT is terrible

slt$C1 <- as.factor(slt$C1)

slt$C1 <- factor(slt$C1,
                  levels=c(1,2,3,4,5),
                  labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C2 =SLT is not harmful as smoking

slt$C2 <- as.factor(slt$C2)

slt$C2 <- factor(slt$C2,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C3 =SLT usage can damage the aesthetic view

slt$C3 <- as.factor(slt$C3)

slt$C3 <- factor(slt$C3,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C4 =SLT usage could give harm effect even in healthy person

slt$C4 <- as.factor(slt$C4)

slt$C4 <- factor(slt$C4,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C5 =SLT usage is difficult to quit

slt$C5 <- as.factor(slt$C5)

slt$C5 <- factor(slt$C5,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C6 =SLT usage can reduce the stress

slt$C6 <- as.factor(slt$C6)

slt$C6 <- factor(slt$C6,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C7 =SLT products should not sell to children

slt$C7 <- as.factor(slt$C7)

slt$C7 <- factor(slt$C7,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C8 =SLT should be banned in public places

slt$C8 <- as.factor(slt$C8)

slt$C8 <- factor(slt$C8,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#C9 =Health care personals should always give advice to quit SLT  when encountered patients who use SLT

slt$C9 <- as.factor(slt$C9)

slt$C9 <- factor(slt$C9,
                 levels=c(1,2,3,4,5),
                 labels=c("Strongly Disagree","Disagree","Unsure","Agree","Strongly Agree"))

#Practice Questions
class(slt$SLT_consumption)
slt$SLT_consumption <- as.factor(slt$SLT_consumption)

slt$SLT_consumption<- factor(slt$SLT_consumption,
                levels=c(1,2,3),
                labels=c("User","Ex_user","Never_user"))


mStats::tab(slt, SLT_consumption)

slt %>% 
  filter(SLT_consumption == "User") %>% 
  ggplot(aes(duration))+
  geom_density()

slt %>% 
  select(duration,sex, SLT_consumption) %>% 
  filter(SLT_consumption == "User") %>% 
  ggplot(aes(duration,colour= sex))+
  geom_density()


slt %>% 
  filter(SLT_consumption == "User") %>% 
  ggplot(aes(start_age))+
  geom_boxplot()

slt$reason <- as.factor(slt$reason)

slt$reason<- factor(slt$reason,
                 levels=c(1,2,3,4,5,6,7),
                 labels=c("Testing","To quit smoking","To prevent from sleepy",
                          "Peer pressure","Family members using SLT","Boring",
                          "Others"))

slt %>% 
  filter(SLT_consumption == "User") %>% 
  mStats::tab(reason)

#form of SLT

slt$form <- as.factor(slt$form)

slt$form<- factor(slt$form,
                  levels=c(1,2,3,4),
                  labels=c("Betel quid with tobacco","Sniffing",
                           "Application to teeth and gums","Other"))

#everyday use
slt$everyday_use<- as.factor(slt$everyday_use)

slt$everyday_use<- factor(slt$everyday_use,
                             levels=c(1,2),
                             labels=c("Yes","No"))
#pack for instant use

slt$instant_use<- as.factor(slt$instant_use)

slt$instant_use<- factor(slt$instant_use,
                          levels=c(1,2),
                          labels=c("Yes","No"))

#time start using

slt$time_start<- as.factor(slt$time_start)

slt$time_start<- factor(slt$time_start,
                         levels=c(1,2,3,4),
                         labels=c("In 5 min","6 to 30 min","31 to 60 min",
                                  "more than 60 min"))

#swallowing slt

slt$swallow<- as.factor(slt$swallow)

slt$swallow<- factor(slt$swallow,
                         levels=c(1,2),
                         labels=c("Yes","No"))

#use while working

slt$working<- as.factor(slt$working)

slt$working<- factor(slt$working,
                     levels=c(1,2),
                     labels=c("Yes","No"))

#cessation related practice
#wish to quit

slt$wish_to_quit<- as.factor(slt$wish_to_quit)

slt$wish_to_quit<- factor(slt$wish_to_quit,
                     levels=c(1,2),
                     labels=c("Yes","No"))
slt$wish_to_quit

#if yes,why?

slt$yes_why<- as.factor(slt$yes_why)

slt$yes_why<- factor(slt$yes_why,
                          levels=c(1,2,3,4),
                          labels=c("fear of tobacco related disease","fear of oral cancer",
                                   "aesthetic view","other"))
slt$yes_why

#if no,why?

slt$no_why<- as.factor(slt$no_why)

slt$no_why<- factor(slt$no_why,
                     levels=c(1,2,3,4,5,6),
                     labels=c("I enjoy tobacco","SLT is a stress buster for me",
                              "I get withdrawal symptoms when I quit tobacco",
                              "I fear of losing friends if I quit SLT",
                              "I am not aware of ill effects of tobacco",
                              "other"))
slt$no_why

slt$difficult<- as.factor(slt$difficult)

slt$difficult<- factor(slt$difficult,
                          levels=c(1,2),
                          labels=c("Yes","No"))


slt$stop_a_week<- as.factor(slt$stop_a_week)

slt$stop_a_week<- factor(slt$stop_a_week,
                       levels=c(1,2),
                       labels=c("Yes","No"))


slt$seek_help<- as.factor(slt$seek_help)

slt$seek_help<- factor(slt$seek_help,
                         levels=c(1,2),
                         labels=c("Yes","No"))


slt$consel<- as.factor(slt$consel)

slt$consel<- factor(slt$consel,
                       levels=c(1,2),
                       labels=c("Yes","No"))

#subsetting extra columns

rm(list=c("B1_score","B2_score","B3_score","B4_score","B5_score","B6_score","B7_score",
          "B8_score","B9_score","B10_score","B11_score","B12_score"))

slt_clean <- select(slt, - c("B1_score","B2_score","B3_score","B4_score","B5_score","B6_score","B7_score",
                             "B8_score","B9_score","B10_score","B11_score","B12_score","age_group",
                             "edu_group","marital_group","religion_group","income_group")) 
names(slt_clean)


library(rio)
export(slt_clean,"slt_clean2.rds")

rm(list=ls())
slt<- readRDS("slt_clean2.rds")



