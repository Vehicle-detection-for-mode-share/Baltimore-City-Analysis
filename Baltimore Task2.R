#Install all the necessary pakages

install.packages('tidyverse')
install.packages("gmodels")
install.packages("ggplot2")
library('dplyr')
library(tidyverse)
library(gmodels)
library("ggplot2")


# Firstly we import and view the dataset
Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')
view(Baltimore)

#Now we do the first cleanup exercise by removing unwanted columns
Baltimore <- Baltimore[, -c(3,4,5,6,7)]

#The first task is to create an ID column in other to uniquely identify duplicate image files
Baltimore <- cbind(ID = 1:nrow(Baltimore), Baltimore)


#The second task is to separate the variables in the labels column to multiple columns(Labels & Probability)

Baltimore <- separate(Baltimore, label, into = c("Labels","Probability"),sep =":")

#Now we remove the 'Cargo' and 'Rickshaw' data from the labels column
Baltimore_new = filter(Baltimore, Labels!="rickshaw")
Baltimore_new = filter(Baltimore_new, Labels!="cargo")

#Lets replace our blank cells in the labels column with NA

Baltimore_new$Labels[Baltimore_new$Labels==""] <- NA

#To replace NA with Unknown ( I run this but it doesnt reflect in my dataset but it shows up in my console)
Baltimore_new$Labels %>% replace_na(list(Labels = "unknown"))


#The next is to view the proportion of unknown images to the known ones

library(mice)
md.pattern(Baltimore_new)

#Creating new columns to hold pedals and motor values ( This one too did not show up in my dataset but i saw it in the console)
Baltimore_new %>%
  mutate(R1 = case_when(
    endsWith(Labels, "r") ~ "motor",
    endsWith(Labels, "A") ~ "Unknown"
  ))



#Calculating the ratio of number of images with pedals with 250 images
#Firstly we randomly extract 250 entries giving the subset a new name
#Then we get the ratio 

Baltimore_18 <- sample_n(Baltimore_new, 8000, replace = TRUE)

#Getting the ratios
round(prop.table(table(Baltimore_2$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore_3$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore_4$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore_5$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore_6$Labels, useNA = "ifany")),4)

#Create temporary tables for each result
S18 <- round(prop.table(table(Baltimore_18$Labels, useNA = "ifany")),4)

S2 <- round(prop.table(table(Baltimore_3$Labels, useNA = "ifany")),4)
S3 <- round(prop.table(table(Baltimore_4$Labels, useNA = "ifany")),4)
S4 <- round(prop.table(table(Baltimore_5$Labels, useNA = "ifany")),4)
S5 <- round(prop.table(table(Baltimore_6$Labels, useNA = "ifany")),4)


#View results for each category in one table
rbind(S1, S2, S3, S4, S5)

#Put result in a table
Bcity_Ratio <- rbind(S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15,
                     S16, S17, S18)

#Convert Vector to Dataframe
Bcity_Ratio <- data.frame(Bcity_Ratio)

#Renaming columns - Here i renamed the N/A column
colnames(Bcity_Ratio)[3] <- "Unknown_Images"


vec <- c('S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8','S9', 'S10', 'S11',
         'S12', 'S13', 'S14', 'S15', 'S16', 'S17', 'S18')

Bcity_Ratio <- cbind(Bcity_Ratio, sample_size = vec)

#To rearrange my columns

Bcity_Ratio <- Bcity_Ratio[ ,c(4, 1, 2, 3)]

Baltimore_Ratios2 <- Baltimore_Ratios









