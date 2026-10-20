setwd("/Users/htetphyoaung/TrainR")
rm(list=ls())

library(tidyverse)
library(waffle)


#Make waffle (square pie) charts
parts <- c(80, 30, 20)
waffle(parts, rows=6)

#--------------------------------------
parts <- data.frame(
  names = c("Low","Medium","High"),
  vals = c(80, 30, 20)
)

waffle(parts, rows=12,
       flip=T,
       xlab="Scores",
       title="Tutorial-1")

waffle(parts, rows=12,
       flip=T,
       xlab="Scores",
       title="Tutorial-1",
       colors=heat.colors(3))

P1= waffle(parts, rows=12,
           flip=T,
           xlab="Scores",
           title="Tutorial-1",
           size=3,
           reverse=T,
           colors=2:4)

#---------------------------------------
library(extrafont)

#Download and install fontawesome fonts from this URL
#https://github.com/FortAwesome/Font-Awesome/tree/master/webfonts.
#You need to download these 3 files - 
#    fa-solid-900.ttf, 
#    fa-regular-400.ttf and 
#    fa-brands-400.ttf
#Once downloades the above 3 files 
#   you need to install them as well by double clicking 
#   on it and then hit Install button.

extrafont::font_import (path="C:/docs/youtubeR101/fonts", pattern = "fa-", prompt =  FALSE)
loadfonts(device = "win")

library(showtext)
font_add(family = "FontAwesome5Free-Solid", regular = "C:/docs/youtubeR101/fonts/fa-solid-900.ttf")
font_add(family = "FontAwesome5Free-Regular", regular = "C:/docs/youtubeR101/fonts/fa-regular-400.ttf")
font_add(family = "FontAwesome5Brands-Regular", regular = "C:/docs/youtubeR101/fonts/fa-brands-400.ttf")
showtext_auto()

#  glyph=refers to icon you want to show in the chart 
#  glyph_size= refers to size of the icon

waffle(parts, rows=10, 
       use_glyph = "male", 
       glyph_size = 9 ,
       glyph_font = "Font Awesome 5 Free Solid",
       glyph_font_family = "FontAwesome5Free-Solid",
       legend_pos = "right")

#-----------------------------------
parts <- data.frame(
  names = c("Child %","Female %","Male %"),
  vals = c(50, 30, 20)
)
P3=waffle(parts, rows=10,
          title="Population",
          use_glyph = c("child","female","male"), 
          glyph_size = 10 ,
          glyph_font = "Font Awesome 5 Free Solid",
          glyph_font_family = "FontAwesome5Free-Solid",
          legend_pos="bottom")+
  theme(plot.title = element_text(hjust = 0.5,
                                  size=20,
                                  face="bold"),
        legend.text =element_text(size=16 ))

#-----------------------------------
P4= waffle(
  c(`Poor=10` =10,  `Excellent=7` =8), 
  rows = 6, 
  colors = c("#5D6F4F", "#D00B99"),
  use_glyph = c("sad-cry","smile-beam"), 
  glyph_size = 10 ,
  title = 'Boys Performance', 
  legend_pos="bottom")+
  theme(plot.title = element_text(hjust = 0.5,size=20,
                                  face="bold"),
        legend.text =element_text(size=16 ))

# How to align multiple waffle charts

iron(
  waffle(
    c('TRUE' = 7, 'FALSE' = 3),
    colors = c("salmon", "grey50"),
    use_glyph = "female",
    glyph_size = 15,
    title = "Female vs Male",
    rows = 2,
    legend_pos = "none"
  ) + theme(plot.title = element_text(hjust = 0.5))
  ,
  waffle(
    c('TRUE' = 8, 'FALSE' = 2),
    colors = c("royalblue", "grey50"),
    use_glyph = "male",
    glyph_size = 15,
    rows = 2,
    legend_pos = "none")
)

library(patchwork)
(P4+P3)

png(filename = "Waffle.png",
    width = 1024, height = 768, units = "px", 
    bg = "lightblue")
P4+P3
dev.off()

#-----------------------------------
## Pictorial Charts in R

library(devtools)
library(echarts4r)
devtools::install_github("JohnCoene/echarts4r.assets")
devtools::install_github("JohnCoene/echarts")
devtools::install_github("JohnCoene/echarts4r.assets")
library(echarts4r.assets)
library(dplyr)
library(echarts4r)
library(extrafont)
library(echarts4r.maps)

df22 <- data.frame(
  x = sort(LETTERS[1:5], decreasing = TRUE),
  y = sort(sample(20:80,5))
)

df22 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = ea_icons("user"), 
              name="Participants",
              symbolRepeat = TRUE, z = -1,
              symbolSize = c(20, 20)) %>% 
  e_theme("blue") %>%
  e_title("Participants") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 16, 
           fontWeight ='bold', 
           position = "right", 
           offset=c(10, 0))

ea_icons_search("user")  #user  #users
ea_icons_search("book")  #book  #bookmark
ea_icons_search("computer")  #computer
ea_icons_search("bar_graph")   #credit_card
ea_icons_search("trash")
ea_icons_search("document")  #document
ea_icons_search("home")  #home
ea_icons_search("pie")   #pie_chart
ea_icons_search("bar")   #bar_graph
ea_icons_search("arrow")   # "down_arrow"  "left_arrow"  "right_arrow" "up_arrow" 
ea_icons_search("shopping")   #shopping
ea_icons_search("security")   #pie_chart
ea_icons_search("beer")   #pie_chart
#------------------------------------
df23 <- data.frame(
  Main_City = c("Yangon", "Mandalay"),
  Population = c(4477638,1208099)
)

df23 %>% 
  e_charts(Main_City) %>% 
  e_pictorial(Population, 
              symbol = ea_icons("users"), 
              symbolRepeat = TRUE, z = -1,
              symbolSize = c(30, 30),
              fontSize=16) %>% 
  e_theme("chalk") %>%
  e_title("Population of Main Cities in Myanmar (2023)") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = F) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 12, 
           fontWeight ='bold', 
           position = "right", 
           offset=c(5, 0))

df22 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = ea_icons("book"), 
              symbolRepeat = TRUE, z = -1,
              symbolSize = c(20, 20)) %>% 
  e_theme("chalk") %>%
  e_title("Published Books") %>% 
  e_flip_coords() %>%
  # Hide Legend
  e_legend(show = FALSE) %>%
  # Remove Gridlines
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(splitLine=list(show = FALSE)) %>%
  # Format Label
  e_labels(fontSize = 16, 
           fontWeight ='bold', 
           position = "right", 
           offset=c(10, 0))




#----------------------------------------
# Tree Chart in R

df02 <- data.frame(
  x = LETTERS[1:10],
  y = sort(sample(10:80,10), decreasing = TRUE)
)

df02 %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = paste0("image://","https://clipart-library.com/images_k/tree-png-transparent/tree-png-transparent-13.png")) %>%
  e_theme("forest") %>% 
  e_title("Tree Chart", 
          padding=c(10,0,0,50))%>%
  e_labels(fontSize = 16, 
           fontWeight ='normal',
           show = TRUE)%>%
  e_legend(show = FALSE) %>%
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(show=FALSE, 
           splitLine=list(show = FALSE))



#----------------------------------------------------------------
#Fill Male, Female Icons based on percentage

# To find SVG Path, download desired SVG file 
# from https://iconmonstr.com/ and open it in chrome
# and then find path in page source.

gender = data.frame(gender=c("Male", "Female"), value=c(55, 45),
                    path = c('path://M18.2629891,11.7131596 L6.8091608,11.7131596 C1.6685112,11.7131596 0,13.032145 0,18.6237673 L0,34.9928467 C0,38.1719847 4.28388932,38.1719847 4.28388932,34.9928467 L4.65591984,20.0216948 L5.74941883,20.0216948 L5.74941883,61.000787 C5.74941883,65.2508314 11.5891201,65.1268798 11.5891201,61.000787 L11.9611506,37.2137775 L13.1110872,37.2137775 L13.4831177,61.000787 C13.4831177,65.1268798 19.3114787,65.2508314 19.3114787,61.000787 L19.3114787,20.0216948 L20.4162301,20.0216948 L20.7882606,34.9928467 C20.7882606,38.1719847 25.0721499,38.1719847 25.0721499,34.9928467 L25.0721499,18.6237673 C25.0721499,13.032145 23.4038145,11.7131596 18.2629891,11.7131596 M12.5361629,1.11022302e-13 C15.4784742,1.11022302e-13 17.8684539,2.38997966 17.8684539,5.33237894 C17.8684539,8.27469031 15.4784742,10.66467 12.5361629,10.66467 C9.59376358,10.66467 7.20378392,8.27469031 7.20378392,5.33237894 C7.20378392,2.38997966 9.59376358,1.11022302e-13 12.5361629,1.11022302e-13',
                             'path://M28.9624207,31.5315864 L24.4142575,16.4793596 C23.5227152,13.8063773 20.8817445,11.7111088 17.0107398,11.7111088 L12.112691,11.7111088 C8.24168636,11.7111088 5.60080331,13.8064652 4.70917331,16.4793596 L0.149791395,31.5315864 C-0.786976655,34.7595013 2.9373074,35.9147532 3.9192135,32.890727 L8.72689855,19.1296485 L9.2799493,19.1296485 C9.2799493,19.1296485 2.95992025,43.7750224 2.70031069,44.6924335 C2.56498417,45.1567684 2.74553639,45.4852068 3.24205501,45.4852068 L8.704461,45.4852068 L8.704461,61.6700801 C8.704461,64.9659872 13.625035,64.9659872 13.625035,61.6700801 L13.625035,45.360657 L15.5097899,45.360657 L15.4984835,61.6700801 C15.4984835,64.9659872 20.4191451,64.9659872 20.4191451,61.6700801 L20.4191451,45.4852068 L25.8814635,45.4852068 C26.3667633,45.4852068 26.5586219,45.1567684 26.4345142,44.6924335 C26.1636859,43.7750224 19.8436568,19.1296485 19.8436568,19.1296485 L20.3966199,19.1296485 L25.2043926,32.890727 C26.1862111,35.9147532 29.9105828,34.7595013 28.9625083,31.5315864 L28.9624207,31.5315864 Z M14.5617154,0 C17.4960397,0 19.8773132,2.3898427 19.8773132,5.33453001 C19.8773132,8.27930527 17.4960397,10.66906 14.5617154,10.66906 C11.6274788,10.66906 9.24611767,8.27930527 9.24611767,5.33453001 C9.24611767,2.3898427 11.6274788,0 14.5617154,0 L14.5617154,0 Z'))

"path://m2.394 15.759s7.554 4.246 9.09 5.109c.165.093.333.132.492.132.178 0 .344-.049.484-.127 1.546-.863 9.155-5.113 9.155-5.113.246-.138.385-.393.385-.656 0-.566-.614-.934-1.116-.654 0 0-7.052 3.958-8.539 4.77-.211.115-.444.161-.722.006-1.649-.928-8.494-4.775-8.494-4.775-.502-.282-1.117.085-1.117.653 0 .262.137.517.382.655zm0-3.113s7.554 4.246 9.09 5.109c.165.093.333.132.492.132.178 0 .344-.049.484-.127 1.546-.863 9.155-5.113 9.155-5.113.246-.138.385-.393.385-.656 0-.566-.614-.934-1.116-.654 0 0-7.052 3.958-8.539 4.77-.211.115-.444.161-.722.006-1.649-.928-8.494-4.775-8.494-4.775-.502-.282-1.117.085-1.117.653 0 .262.137.517.382.655zm10.271-9.455c-.246-.128-.471-.191-.692-.191-.223 0-.443.065-.675.191l-8.884 5.005c-.276.183-.414.444-.414.698 0 .256.139.505.414.664l8.884 5.006c.221.133.447.203.678.203.223 0 .452-.065.689-.203l8.884-5.006c.295-.166.451-.421.451-.68 0-.25-.145-.503-.451-.682zm-8.404 5.686 7.721-4.349 7.72 4.349-7.72 4.35z"
"path d=m2.394 15.759s7.554 4.246 9.09 5.109c.165.093.333.132.492.132.178 0 .344-.049.484-.127 1.546-.863 9.155-5.113 9.155-5.113.246-.138.385-.393.385-.656 0-.566-.614-.934-1.116-.654 0 0-7.052 3.958-8.539 4.77-.211.115-.444.161-.722.006-1.649-.928-8.494-4.775-8.494-4.775-.502-.282-1.117.085-1.117.653 0 .262.137.517.382.655zm0-3.113s7.554 4.246 9.09 5.109c.165.093.333.132.492.132.178 0 .344-.049.484-.127 1.546-.863 9.155-5.113 9.155-5.113.246-.138.385-.393.385-.656 0-.566-.614-.934-1.116-.654 0 0-7.052 3.958-8.539 4.77-.211.115-.444.161-.722.006-1.649-.928-8.494-4.775-8.494-4.775-.502-.282-1.117.085-1.117.653 0 .262.137.517.382.655zm10.271-9.455c-.246-.128-.471-.191-.692-.191-.223 0-.443.065-.675.191l-8.884 5.005c-.276.183-.414.444-.414.698 0 .256.139.505.414.664l8.884 5.006c.221.133.447.203.678.203.223 0 .452-.065.689-.203l8.884-5.006c.295-.166.451-.421.451-.68 0-.25-.145-.503-.451-.682zm-8.404 5.686 7.721-4.349 7.72 4.349-7.72 4.35z"

gender %>% 
  e_charts(gender) %>% 
  e_x_axis(splitLine=list(show = F), 
           axisTick=list(show=F),
           axisLine=list(show=T),
           axisLabel= list(show=F)) %>%
  e_y_axis(max=100, 
           splitLine=list(show = F),
           axisTick=list(show=F),
           axisLine=list(show=F),
           axisLabel=list(show=FALSE)) %>%
  e_color(color = c('#D00B99','lightgray')) %>%
  e_pictorial(value, symbol = path, z=10, 
              name= 'realValue', 
              symbolBoundingData= 100, 
              symbolClip= T) %>% 
  e_pictorial(value, symbol = path, 
              name= 'background', 
              symbolBoundingData= 100) %>% 
  e_title(text="Gender Ratio",
          textStyle =list(fontSize= 25, 
                          fontFamily= 'Arial', 
                          fontWeight ='bold', color= '#113344'))%>%
  e_labels(position = "bottom", offset= c(0, 10), 
           textStyle =list(fontSize= 20, fontFamily= 'Arial', 
                           fontWeight ='bold', 
                           color= '#113344'),
           formatter="{@[1]}% {@[0]}") %>%
  e_legend(show = FALSE) %>%
  e_theme("infographic")

#-------------------------------

#33.0 % of the population is urban (18,032,802 people in 2023)

Population = data.frame(Population=c("Urban", "Rural"), value=c(33, 67),
                        path = c('path://M18.2629891,11.7131596 L6.8091608,11.7131596 C1.6685112,11.7131596 0,13.032145 0,18.6237673 L0,34.9928467 C0,38.1719847 4.28388932,38.1719847 4.28388932,34.9928467 L4.65591984,20.0216948 L5.74941883,20.0216948 L5.74941883,61.000787 C5.74941883,65.2508314 11.5891201,65.1268798 11.5891201,61.000787 L11.9611506,37.2137775 L13.1110872,37.2137775 L13.4831177,61.000787 C13.4831177,65.1268798 19.3114787,65.2508314 19.3114787,61.000787 L19.3114787,20.0216948 L20.4162301,20.0216948 L20.7882606,34.9928467 C20.7882606,38.1719847 25.0721499,38.1719847 25.0721499,34.9928467 L25.0721499,18.6237673 C25.0721499,13.032145 23.4038145,11.7131596 18.2629891,11.7131596 M12.5361629,1.11022302e-13 C15.4784742,1.11022302e-13 17.8684539,2.38997966 17.8684539,5.33237894 C17.8684539,8.27469031 15.4784742,10.66467 12.5361629,10.66467 C9.59376358,10.66467 7.20378392,8.27469031 7.20378392,5.33237894 C7.20378392,2.38997966 9.59376358,1.11022302e-13 12.5361629,1.11022302e-13',
                                 'path://M18.2629891,11.7131596 L6.8091608,11.7131596 C1.6685112,11.7131596 0,13.032145 0,18.6237673 L0,34.9928467 C0,38.1719847 4.28388932,38.1719847 4.28388932,34.9928467 L4.65591984,20.0216948 L5.74941883,20.0216948 L5.74941883,61.000787 C5.74941883,65.2508314 11.5891201,65.1268798 11.5891201,61.000787 L11.9611506,37.2137775 L13.1110872,37.2137775 L13.4831177,61.000787 C13.4831177,65.1268798 19.3114787,65.2508314 19.3114787,61.000787 L19.3114787,20.0216948 L20.4162301,20.0216948 L20.7882606,34.9928467 C20.7882606,38.1719847 25.0721499,38.1719847 25.0721499,34.9928467 L25.0721499,18.6237673 C25.0721499,13.032145 23.4038145,11.7131596 18.2629891,11.7131596 M12.5361629,1.11022302e-13 C15.4784742,1.11022302e-13 17.8684539,2.38997966 17.8684539,5.33237894 C17.8684539,8.27469031 15.4784742,10.66467 12.5361629,10.66467 C9.59376358,10.66467 7.20378392,8.27469031 7.20378392,5.33237894 C7.20378392,2.38997966 9.59376358,1.11022302e-13 12.5361629,1.11022302e-13'))
Population %>% 
  e_charts(Population) %>% 
  e_x_axis(splitLine=list(show = FALSE), 
           axisTick=list(show=FALSE),
           axisLine=list(show=FALSE),
           axisLabel= list(show=FALSE)) %>%
  e_y_axis(max=100, 
           splitLine=list(show = FALSE),
           axisTick=list(show=FALSE),
           axisLine=list(show=FALSE),
           axisLabel=list(show=FALSE)) %>%
  e_color(color = c('#69cce6','lightgray')) %>%
  e_pictorial(value, symbol = path, z=10, name= 'realValue', 
              symbolBoundingData= 100, symbolClip= TRUE) %>% 
  e_pictorial(value, symbol = path, name= 'background', 
              symbolBoundingData= 100) %>% 
  e_labels(position = "bottom", offset= c(0, 10), 
           textStyle =list(fontSize= 20, fontFamily= 'Arial', 
                           fontWeight ='bold', 
                           color= '#69cce6'),
           formatter="{@[1]}% {@[0]}") %>%
  e_legend(show = FALSE) %>%
  e_theme("bee-inspired")

# References
#https://www.listendata.com/2019/06/create-infographics-with-r.html?fbclid=IwAR0rnnUkMfeJkwolmjBmiaoxRysuspA12QlxsEJKRSkdYIGHsytN1VK2Kls

