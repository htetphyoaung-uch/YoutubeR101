setwd("c:/docs/youtubeR101")
rm(list=ls())

# if else statements in R

library(tidyverse)

?if_else

#basics

my_word <- "Hello"

if (nchar(my_word) <= 5 ) {
  print("It's a short string")
}

my_word <- "Hello!"

if (nchar(my_word) <= 5 ) {
  print("It's a short string")
} #no print output

if (nchar(my_word) <= 5 ) {
  print("It's a short string")
} else {
  print("It's a long string")
}

#another 

my_word <- "Helloaaaaaaaaaa"

if (nchar(my_word) <= 5 ) {
  print("It's a short string")
} else if(nchar(my_word) <= 8) {
  print("It's a mid string")
} else {
  print("It's a long string")
}








