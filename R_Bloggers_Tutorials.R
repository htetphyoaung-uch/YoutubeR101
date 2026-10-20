setwd("c:/docs/youtubeR101")
rm(list=ls())

#How to Replace Inf Values with NA in R

#Method 1: Replace Inf with NA in Vector

x <- c(14, 102, Inf, 8, Inf, 9, 12, 3, 202, Inf)

x[is.infinite(x)] <- NA

x

#Method 2: Replace Inf with NA in All Columns of the Data Frame

df <- data.frame(x=c(14, 15, 25, 34, Inf, 18, Inf),
                 y=c(10, Inf, Inf, 43, 45, 55, 88),
                 z=c(Inf, 55, 45, 65, 35, 102, 14))
df

df[sapply(df, is.infinite)] <- NA

df

#Method 3: Replace Inf with NA in Specific Columns of the Data Frame

df <- data.frame(x=c(44, 55, 15, 34, Inf, 88, Inf),
                 y=c(110, Inf, Inf, 33, 55, 58, 88),
                 z=c(Inf, 75, 85, 6, 33, 12, 114))
df

df[c('x', 'z')][sapply(df[c('x', 'z')], is.infinite)] <- NA

df























