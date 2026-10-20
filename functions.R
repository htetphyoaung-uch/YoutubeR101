setwd("c:/docs/youtubeR101")
rm(list=ls())

good <- readxl::read_excel("Factor_Function.xlsx")

View(good)


yesno <- function(values){
  if (is.numeric(values)){
    as.factor(values)
}
  factor(values,
         levels=c(1,2),
         labels=c("Yes", "No"))
}

yesno(good$Eat)

good$Eat <- yesno(good$Eat)

mStats::codebook(good)

yesno(good$Sleep)

good$Sleep <- yesno(good$Sleep)


yesno(good$Work)

good$Work <- yesno(good$Work)







