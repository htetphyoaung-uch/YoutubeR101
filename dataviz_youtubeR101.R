setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(gapminder)
theme_set(theme_bw())
view(gapminder)


gapminder %>% 
  filter(continent %in% c("Africa","Europe")) %>% 
  filter(gdpPercap < 30000) %>% 
  ggplot(aes(x= gdpPercap,
             y= lifeExp,
             size= pop,
             colour= year))+
  geom_point()+
  facet_wrap(~continent)+
  labs(title = "Life Expectency explained by GDP",
       x= "GDP per capita",
       y= "Life Expectancy")


library(ggridges)
library(patchwork)
library(viridis)
library(hrbrthemes)


#single numeric variable

p1 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_histogram(binwidth = 20,
                 show.legend = F,
                 alpha = .5) +
  labs(title = "Histogram",
       x = "Height",
       y = "Count")

p2 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_density(aes(fill = "blue"),
               show.legend = F,
               alpha = .5) +
  labs(title = "Density plot",
       x = "Height",
       y = "Probability")

p3 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_boxplot(show.legend = F,
               alpha = .5) +
  labs(title = "Boxplot",
       x = "Height")

p3a <- starwars %>%
  ggplot(aes(x = height, y = 1)) +
  geom_violin(aes(fill = "blue"),
              show.legend = F,
              alpha = .5)+
  labs(title = "Violin plot",
       x = "Height")

(p1 /p2 | p3 / p3a) +
  plot_annotation(title = "Single numeric variable",
                  theme = theme(plot.title = element_text(size = 18,
                                                          colour = "blue"))) +
  theme(text = element_text('mono'))


#One or more categorical variables

p4 <- starwars %>%
  drop_na(eye_color) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(x = eye_color)) +
  geom_bar(stat = "count", alpha = 0.5) +
  labs(title = "Barplot",
       x = "Eye colour",
       y = "Count")

p5 <- starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(eye_color, fill = gender)) +
  geom_bar(stat = "count", alpha = .5,
           show.legend = F) +
  labs(title = "Stacked barplot",
       x = "Eye colour",
       y = "Count")

p5a <- starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(eye_color, fill = gender)) +
  geom_bar(stat = "count", alpha = .5,
           position="dodge",
           show.legend = F)+
  labs(title = "Grouped barplot",
       x = "Eye colour",
       y = "Count")

p5b <- starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(eye_color, fill = gender)) +
  geom_bar(stat = "count", alpha = .5,
           position="fill",
           show.legend = T) +
  labs(title = "Percentage barplot",
       x = "Eye colour",
       y = "Count") +
  theme(legend.position = "bottom")


((p4 | p5)/( p5a | p5b)) +
  plot_annotation(title = "One or more categorical variable",
                  theme = theme(plot.title = element_text(size = 18,
                                                          colour = "blue"))) +
  theme(text = element_text('mono'))

#One numeric and two categorical variables

p14a <- starwars %>%
  drop_na(gender) %>%
  ggplot(aes(height, fill = gender)) +
  geom_boxplot(alpha = 0.3) +
  labs(title = "Boxplot of a numeric variable",
       subtitle = "disagregated by one categorical variable",
       x = "Height") +
  theme(legend.position = "none")

p14b <- starwars %>%
  drop_na(gender) %>%
  ggplot(aes(height, fill = gender)) +
  geom_density(alpha = 0.3) +
  labs(title = "Density plot of a numeric variable",
       subtitle = "disagregated by one categorical variable",
       x = "Height",
       y = "Probability") +
  theme(legend.position = "none")

p15 <- starwars %>%
  drop_na(hair_color, gender) %>%
  filter(hair_color %in% c("black", "brown")) %>%
  ggplot(aes(height, fill = gender)) +
  geom_density(alpha = 0.3) +
  facet_wrap(~hair_color) +
  labs(title = "Density plot of a numeric variable",
       subtitle = "disagregated by two categorical variables",
       x = "Height",
       y = "Probability") +
  theme(legend.position = "none")

p16 <- starwars %>%
  filter(height > 140 & height < 200) %>%
  drop_na(hair_color, gender) %>%
  filter(hair_color %in% c("black", "brown")) %>%
  ggplot(aes(height, fill = gender)) +
  geom_boxplot(alpha = 0.3) +
  facet_wrap(~hair_color) +
  labs(title = "Boxplot of a numeric variable",
       subtitle = "disagregated by two categorical variable",
       x = "Height")+
  theme(legend.position = "bottom")


((p14b/p14a)|(p15 / p16)) +
  plot_annotation(title = "One numberic and two categorical variable",
                  theme = theme(plot.title = element_text(size = 18,
                                                          colour = "blue"))) +
  theme(text = element_text('mono'))

#Two numeric and one categorical variable

p6 <- starwars %>%
  filter( mass < 250) %>%
  ggplot(aes(x = height,
             y = mass)) +
  geom_point(size = 2,
             alpha = 0.7) +
  geom_smooth()+
  labs(title = "Scatter plot",
       subtitle = "with smoothed linear model",
       x = "Height",
       y = "Mass")

#linear model smoothing line

starwars %>%
  filter( mass < 250) %>%
  ggplot(aes(x = height,
             y = mass)) +
  geom_point(size = 2,
             alpha = 0.7) +
  geom_smooth(method = lm)+
  labs(title = "Scatter plot",
       subtitle = "with smoothed linear model",
       x = "Height",
       y = "Mass")


p7 <- starwars %>%
  filter( mass < 250) %>%
  drop_na(gender) %>%
  ggplot(aes(height, mass, colour = gender)) +
  geom_point(size = 2, show.legend = T) +
  labs(title = "Scatter plot",
       subtitle = "disagregated by colour",
       x = "Height",
       y = "Mass")

p7a <- starwars %>%
  filter( mass < 250) %>%
  drop_na(gender) %>%
  ggplot(aes(height, mass, colour = gender))+
  geom_point(size = 2, show.legend = F)+
  facet_wrap(~gender) +
  labs(title = "Scatter plot",
       subtitle = "disagregated by colour and facets",
       x = "Height",
       y = "Mass")


(p6 | p7 / p7a) +
  plot_annotation(title = "Two numberic and one categorical variable",
                  theme = theme(plot.title = element_text(size = 18,
                                                          colour = "blue"))) +
  theme(text = element_text('mono'))

#Lolipop graphic

#Instead of plotting a simple boxplot for each of the categories, I’ve plotted 
#individual data points, the average for each category and then joined
#the average with a line that represents the average for the entire dataset.

chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed,
             show.legend = F)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9) +
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme(legend.position = "none") +
  theme_bw()

#Using ridges

#In this visualization I’ve shown distribution of temperatures that occurred 
#within a given month (as a density  plot) and then compared each month by 
#plotting the density plots of each month on the same canvas.

ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01,
                               alpha = 5) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme_bw() +
  theme(legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8))



#If you want to help with the graph/chart labelling and other requirements
#ggThemeAssit is the best for fine tune 

library(ggThemeAssist)

exam <- readxl::read_excel("Marks.xlsx")

exam %>% 
  drop_na(Marks) %>% 
  ggplot(aes(Marks))+
  geom_density(colour= "red",fill="green") + theme(panel.grid.major = element_line(linetype = "blank"),
    legend.title = element_text(face = "bold"),
    panel.background = element_rect(fill = "moccasin",
        linetype = "dotted"), legend.position = "left",
    legend.direction = "horizontal") +labs(title = "Density Plot of Exam Marks")


#Note: just select a rough plot code and goes to add in menu and use ggThemeAssist window 



# arranging columns to order in bar charts

library(tidyverse)

?fct_infreq #by number of observations with each level (largest first)

glimpse(gss_cat)

gss_cat %>% 
  ggplot(aes(marital))+
  geom_bar()+
  theme_minimal()

levels(gss_cat$marital)

gss_cat %>% 
  ggplot(aes(fct_infreq(marital)))+  #by number of observations with each level (largest first)
  geom_bar()+
  theme_minimal()


gss_cat %>% 
  ggplot(aes(fct_infreq(marital),
             fill=fct_infreq(marital)))+  #filling Different colours
  geom_bar()+
  theme_minimal()+
  theme(legend.position = "")+
  labs(x="Marital Status")


gss_cat %>% 
  ggplot(aes(fct_infreq(marital),
             fill=fct_infreq(marital)))+  #filling Different colours
  geom_bar()+
  scale_fill_brewer(palette = "Set2")+ #colours for colourblind persons
  theme_minimal()+
  theme(legend.position = "")+
  labs(x="Marital Status",y="Frequency",
       title = "Marital Status of GSS_Cat")


# dataviz for a catagorical and a numeric var

msleep %>% 
  ggplot(aes(vore,sleep_total, fill= vore))+
  geom_boxplot(show.legend = "F")
  

msleep %>% 
  ggplot(aes(vore,sleep_total, fill= vore))+
  geom_boxplot()+
  geom_jitter()+
  theme(legend.position = "") # this plot has stacking outliners


msleep %>% 
  ggplot(aes(vore,sleep_total, fill= vore))+
  geom_boxplot(outlier.shape = NA)+ # this argument clean stacking outliers
  geom_jitter()+
  theme(legend.position = "")

library(modeldata)
data(penguins)

penguins %>% 
  ggplot(aes(species,bill_length_mm, fill= species))+
  geom_boxplot()

penguins %>% 
  ggplot(aes(species,bill_length_mm, fill= species))+
  geom_violin()


penguins %>% 
  ggplot(aes(species,bill_length_mm, fill= species))+
  geom_violin()+
  geom_boxplot(width= 0.5)+
  theme(legend.position = "")



penguins %>% 
  ggplot(aes(species,bill_length_mm, fill= species))+
  geom_violin()+
  geom_boxplot(width= 0.5)+
  geom_jitter(alpha= 0.5)+
  theme(legend.position = "")



penguins %>% 
  ggplot(aes(species,bill_length_mm, fill= species))+
  geom_violin()+
  scale_fill_brewer(palette = "Set2")+ # colours for colour blind persons
  geom_boxplot(width= 0.5)+
  geom_jitter(alpha= 0.5)+
  theme(legend.position = "")









