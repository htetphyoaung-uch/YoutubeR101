# Import a data set for demonstration
getwd()
lowbwt <- read.csv("c:/docs/trainr/data_raw/lowbwt.csv")
lowbwt <- read.csv("data_raw/lowbwt.csv")

# Check all installed packages(Standard, Recommended, Contributed)
library()

# Standard and Recommended R packages
library(lib.loc=.Library)

# Currently loaded R packages
search()

# Check a function from a function from a Standard package
table(lowbwt$race)

# Check a function from a not-installed package
tab(lowbwt,"race")

# install a (contributed) package from a CRAN or CRAN-like repositories
# install.packages("mStats",dep=TRUE) # You Only need to install a package once unless newer version comes out 

# install multiple (contributed) packages at the same time
# install.packages(c("Epi","epitools"),dep=TRUE) # You Only need to install a package once unless newer version comes out 

# install a (contributed) package from github 
install.packages("devtools")
devtools::install_github("tidyverse/googlesheets4")

# load a (contributed) package
library(mStats) # You need to load a package if you want to used its functions(-/+ accompanying data sets) once unless newer version comes out

# Use a function of  a (contributed) package
tab(lowbwt,"race")

# Detach a (contributed) package
detach("package:mStats", unload = TRUE)
tab(lowbwt,"race")

# Use a function of  a (contributed) package without loading a package
mStats::tab(lowbwt,"race")

# Check if a particular package is not updated.
old.packages("mStats")

# Check which packages are not updated.
old.packages()

# Update a package
update.packages("mStats")
update.packages("tibble")

# Update all previously installed, but not-updated packages
update.packages()

# Uninstall (remove) a package
remove.packages("mStats")
library(mStats)

# Reinstall (remove) a package
install.packages("mStats",dep=TRUE)
library(mStats)
tab(lowbwt,"race")

detach("package:mStats",unload=TRUE)
tab(lowbwt,"race")

library(mStats)
tab(lowbwt,"race")
