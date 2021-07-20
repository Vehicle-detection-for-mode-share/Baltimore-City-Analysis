#Load packages and lib
install.packages("spdep")
install.packages("rgdal")
install.packages("spData")
install.packages("sf")

library(spdep)
library(rgdal)
library(sf)
library(dplyr)
library(tidyverse)


#Load shape files
Balt = readOGR(dsn = ".", layer = "Baltimore_grid")

#To create a data frame

Balt4_sf <- as.data.frame(Balt)

#To view the structure of the polygons
Balt2 = fortify(Balt)

#Total sum of population
sum(Balt$GLOBE_P)

#Viewing the data

summary(Balt)

#Getting the area

sqrt(250)

Balt4_sf$Area <- Balt4_sf$GLOBE_P * sqrt(250)

#Total sum of land area
sum(Balt4_sf$Area)

#Population Density

sum (Balt4_sf$GLOBE_P) / sum(Balt4_sf$Area)
