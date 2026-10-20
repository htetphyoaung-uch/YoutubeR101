# Graphics in R
# 1. Base R Graphics
# 2. Lattice Graphics
# 3. ggplot2 graphics
# 4. Others

rm(list=ls())

# Packages
library(tidyverse)

# Data
lbw <- read.csv("data_raw/lowbwt.csv")
mmrd1 <- rio::import("data_raw/mmr_demo.xlsx",sheet=1)
usle<- rio::import("data_raw/usle.dta")

# Data types 
lbw$smoke <- factor(lbw$smoke,
                    levels=c(0,1),
                    labels=c("Non-smoking","Smoking"))

lbw$race <- factor(lbw$race,
                   levels=c(1,2,3),
                   labels=c("White","Balck","Others"))

lbw$low <- factor(lbw$low,
                   levels=c(0,1),
                   labels=c("No low birth weight",
                            "Low birth weight"))
table(lbw$low)

# Graph for One numerical variable 
## Histogram (different coding styles)

ggplot(lbw,aes(bwt))+geom_histogram() # Histogram

# gg= grammer of graphics
# geom= geometric objects
# aes= aesthetics

ggplot(lbw)+
  geom_histogram(aes(bwt)) # Histogram

lbw %>% ggplot()+
  geom_histogram(aes(bwt)) # Histogram

lbw %>% ggplot(aes(bwt))+
  geom_histogram() # Histogram

## Dot plot
ggplot(lbw)+
  geom_dotplot(aes(bwt)) # a variant of histogram 

## Density plot 
ggplot(lbw)+
  geom_density(aes(bwt)) # Density plot  

## Frequency polygon
ggplot(lbw)+
  geom_freqpoly(aes(bwt)) # Frequency polygon  

## (horizontal) Box plot 
ggplot(lbw)+
  geom_boxplot(aes(bwt)) # Horizontal box plot 

## (vertical) Box plot   
ggplot(lbw)+
  geom_boxplot(aes(bwt))+ 
  coord_flip() # Flipping x and y co-ordinates (axises)  

# Graph for One categorical variable  
## Bar chart 1 . Frequency  
ggplot(lbw)+
  geom_bar(aes(race)) # use 'geom_bar(aes(x))' for Full (rows) data

freq_race <- lbw %>% 
  count(race)  # Aggregate data
ggplot(freq_race)+geom_col(aes(x=race,y=n))  # use 'geom_col(aes(x,y))' for Aggregate data
ggplot(freq_race)+geom_col(aes(race,n))

ggplot(freq_race)+
  geom_col(aes(reorder(race,n),
               n))

ggplot(freq_race)+
  geom_col(aes(reorder(race,-n),
               n))

## Bar chart 2 . Percents
percent_race <-lbw %>%
  count(race)%>%
  mutate(percent=round(n*100/sum(n),1)) # Aggregate data
ggplot(percent_race)+
  geom_col(aes(race,percent)) # use 'geom_col(aes(x,y))' for Full (rows) data

# Bar charts : reordering and highlighting

View(mmrd1) # Aggregate data
ggplot(mmrd1)+
  geom_col(aes(region,pop_1000))

ggplot(mmrd1)+
  geom_col(aes(reorder(region,-pop_1000),
               pop_1000))

ggplot(mmrd1)+
  geom_col(aes(reorder(region,-pop_1000),
               pop_1000,fill=region)) # Not recommended 

ggplot(mmrd1)+
  geom_col(aes(reorder(region,-pop_1000),
               pop_1000),fill="maroon")

ggplot(mmrd1,aes(reorder(region,-pop_1000),pop_1000))+
  geom_col()

ggplot(mmrd1,aes(reorder(region,pop_1000),pop_1000))+
  geom_col()+
  coord_flip()

ggplot(mmrd1,aes(reorder(region,pop_1000),pop_1000))+
  geom_col()+
  geom_text(aes(label=pop_1000))+ 
  coord_flip()

ggplot(mmrd1,aes(reorder(region,pop_1000),pop_1000))+
  geom_col()+
  geom_text(aes(label=pop_1000),hjust=-0.1)+ 
  coord_flip()

ggplot(mmrd1,aes(reorder(region,pop_1000),pop_1000))+
  geom_col()+
  geom_text(aes(label=pop_1000),vjust = 0.5,hjust =-0.1)+ 
  coord_flip()

ggplot(mmrd1,aes(reorder(region,pop_1000),pop_1000))+
  geom_col(fill="maroon")+
  geom_text(aes(label=pop_1000),vjust = 0.5,hjust =-0.1)+ 
  coord_flip()

mmrd1 %>% 
  mutate(highlight = ifelse(region =="Magway", T, F)) %>% 
  ggplot(aes(reorder(region,pop_1000),pop_1000))+
  geom_col(aes(fill=highlight))+
  coord_flip()

mmrd1 %>% 
  mutate(highlight = ifelse(region =="Magway", T, F)) %>% 
  ggplot(aes(reorder(region,pop_1000),pop_1000))+
  geom_col(aes(fill =highlight))+
  coord_flip()+
  scale_fill_manual(values = c('darkgray', 'maroon'))+
  theme(legend.position ="")+
  labs(title="Population in Myanmar, 2014",
       x="",
       y="Pop. (in 1000s)")

mmrd1 %>% 
  mutate(highlight = ifelse(region %in% c("Yangon","Magway","Kayah"), T, F)) %>% 
  ggplot(aes(reorder(region,pop_1000),pop_1000))+
  geom_col(aes(fill =highlight))+
  coord_flip()+
  scale_fill_manual(values = c('darkgray', 'maroon'))+
  theme(legend.position ="")+
  labs(title="Population in Myanmar, 2014",
       x="",
       y="Pop. (in 1000s)")

mmrd1 %>% 
  mutate(highlight = ifelse(region %in% c("Yangon","Magway","Kayah"), T, F)) %>% 
  ggplot(aes(reorder(region,pop_1000),pop_1000))+
  geom_col(aes(fill =highlight))+
  coord_flip()+
  scale_fill_manual(values = c('darkgray', 'maroon'))+
  geom_text(aes(label=pop_1000),vjust = 0.5,hjust =-0.1)+
  theme(legend.position ="")+
  labs(title="Population in Myanmar, 2014",
       x="",
       y="Pop. (in 1000s)")

# Pie chart (Base R)
pie(table(lbw$race))

# Pie chart (ggpie)
# 

devtools::install_github("rkabacoff/ggpie",force=TRUE)

library(ggpie)
ggpie(lbw,race)
ggpie(lbw,race,legend=FALSE,offset=0.7)
ggpie(lbw,race,legend=FALSE,offset=1.3)

ggpie(lbw,race,legend=FALSE,offset=1.3)+
  labs(title="Distribution of races in ths study population (n=189)")

# Multiple pie charts
ggpie(lbw,low,race,
      legend=FALSE,
      offset=1.3,
      title="Low birth weight by race")

# Pie chart (ggplot2)
dat1 <- lbw %>%
  count(race)%>%
  arrange(desc(race)) %>%
  mutate(percent = round(n*100/sum(n),1),
         lab_pos = cumsum(percent)-0.5*percent)
dat1
dat1$label <- paste(dat1$race,"\n",round(dat1$percent),"%",sep="")
dat1
ggplot(dat1,
       aes(x = "",
           y = percent,
           fill = race)) +
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
  
# Tree map with "treemapify" 
library(treemapify)
ggplot(mmrd1,aes(fill=region,area=pop_1000))+
  geom_treemap()

ggplot(mmrd1,aes(fill=region,area=pop_1000,label=region))+
  geom_treemap()+
  geom_treemap_text(colour = "white",
                    place = "centre")

ggplot(mmrd1,(aes(fill=region,area=pop_1000,label=region)))+
  geom_treemap()+
  geom_treemap_text(colour = "white",
                    place = "centre")+
  theme(legend.position ="")

ggplot(mmrd1,(aes(fill=region,area=pop_1000,label=region)))+
  geom_treemap()+
  geom_treemap_text(colour = "white",
                    place = "centre")+
  theme(legend.position ="none")

# Graph for numerical-numerical variables 
# Scatter plot
ggplot(lbw)+geom_point(aes(lwt,bwt))

# Scatter plot with LOWESS smoothing line 
ggplot(lbw)+geom_point(aes(lwt,bwt))+
  geom_smooth(aes(lwt,bwt),method="loess")

ggplot(lbw)+geom_point(aes(lwt,bwt))+
  geom_smooth(aes(lwt,bwt),method="loess",se=FALSE)

# Scatter plot with regression line
ggplot(lbw)+geom_point(aes(lwt,bwt))+
  geom_smooth(aes(lwt,bwt),method="lm")

ggplot(lbw)+geom_point(aes(lwt,bwt))+
  geom_smooth(aes(lwt,bwt),method="lm",se=FALSE)

# Scatter plot with LOWESS smoothing line and regression line
# local mapping
ggplot(lbw)+
  geom_point(aes(lwt,bwt))+
  geom_smooth(aes(lwt,bwt),method="loess",se=FALSE)+
  geom_smooth(aes(lwt,bwt),method="lm",se=FALSE,color="brown")

#  global mapping
ggplot(lbw,aes(lwt,bwt))+
  geom_point()+
  geom_smooth(method="loess",se=FALSE)+
  geom_smooth(method="lm",se=FALSE,color="brown")

# Scatter plot with color of points for 3rd variable   
ggplot(lbw,aes(lwt,bwt,color=smoke))+
  geom_point() 

table(lbw$smoke) ; class(lbw$smoke)  

ggplot(lbw,aes(lwt,bwt,color=ftv))+
  geom_point() 

ggplot(lbw)+geom_point(aes(lwt,bwt,color=smoke)) # Mapping color to values of a numerical variable
ggplot(lbw)+geom_point(aes(lwt,bwt),color="blue") # Setting color to be blue
ggplot(lbw)+geom_point(aes(lwt,bwt,size=age)) # Mapping color to values of a numerical variable
ggplot(lbw)+geom_point(aes(lwt,bwt,alpha=age)) # Mapping color to values of a numerical variable

ggplot(lbw)+geom_point(aes(lwt,bwt,alpha=age),size=4) # Mapping color to values of a numerical variable

# Scatter plot with color and shape of points for 3rd variable   
ggplot(lbw)+geom_point(aes(lwt,bwt,
                           shape=smoke,
                           color=smoke))

# Graph for categorical-numerical variables 
# Multiple box plots  
ggplot(lbw,aes(smoke,bwt))+
  geom_boxplot()

ggplot(lbw,aes(race,bwt))+
  geom_boxplot()

# Multiple density plots
ggplot(lbw,aes(bwt,smoke))+geom_density() # Wrong codes   

ggplot(lbw,aes(bwt,group=smoke))+geom_density() # Correct codes

ggplot(lbw,aes(bwt,group=smoke,fill=smoke))+
  geom_density() # Add different fill colors

ggplot(lbw,aes(bwt,fill=smoke))+
  geom_density() # You can remove 'group=race' 

ggplot(lbw,aes(bwt,fill=smoke))+
  geom_density(alpha=0.4) # Make plots transparent

ggplot(lbw,aes(bwt,fill=race))+
  geom_density(alpha=0.4)

# Ridgeline graph 
library(ggridges)
ggplot(lbw,aes(bwt,race,fill=race))+
  geom_density_ridges(alpha=0.4)

ggplot(mpg,aes(cty,class,fill=class))+
  geom_density_ridges(alpha=0.4)

# Line graph 
ggplot(usle)+
  geom_line(aes(year,le),color="maroon")

ggplot(usle)+
  geom_line(aes(year,le_male),color="red")+
  geom_line(aes(year,le_female),color="blue")

ggplot(usle)+
  geom_line(aes(year,le_wmale),color="red")+
  geom_line(aes(year,le_wfemale),color="blue")+
  geom_line(aes(year,le_bmale),color="green")+
  geom_line(aes(year,le_bfemale),color="brown")

library(gapminder)
data(gapminder)

gapminder %>%
  filter(country == "Myanmar") %>%
  ggplot(aes(year,lifeExp)) +
  geom_line()

gapminder %>%
  filter(country %in% c("Myanmar","Thailand","Bangladesh")) %>%
  ggplot(aes(year,lifeExp,group=country,color=country)) +
  geom_line()

gapminder %>%
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line()

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country)) +
  geom_line()

gapminder %>%
  mutate(highlight = ifelse(country=="Myanmar", T, F)) %>% 
  ggplot(aes(x = year, y = lifeExp,group=country,color=highlight)) +
  geom_line()+
  scale_color_manual(values = c('gray','maroon'))


gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country)) +
  geom_line(alpha=0.1)

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,
             group=country,
             color=continent)) +
  geom_line(alpha=0.5)

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country)) +
  geom_line()+
  facet_wrap(~continent)

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,
             group=country,
             color=continent)) +
  geom_line()+
  facet_wrap(~continent)

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country,color=continent)) +
  geom_line()+
  facet_wrap(~continent)+
  theme_bw()

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country,color=continent)) +
  geom_line()+
  facet_wrap(~continent)+
  theme_classic()

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country,color=continent)) +
  geom_line()+
  facet_wrap(~continent)+
  theme_dark()

gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country,color=continent)) +
  geom_line()+
  facet_wrap(~continent)+
  theme_get()
gapminder %>%
  ggplot(aes(x = year, y = lifeExp,group=country,color=continent)) +
  geom_line()+
  facet_wrap(~continent)+
  theme_update()

# Graph for categorical-categorical variables 

ggplot(lbw,aes(x=race,fill=low))+
  geom_bar(position="dodge")

ggplot(lbw,aes(x=race,fill=low))+
  geom_bar(position="stack")

ggplot(lbw,aes(x=race,fill=low))+
  geom_bar(position="fill")



