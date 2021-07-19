#Install all the necessary packages

install.packages('tidyverse')
install.packages("gmodels")
install.packages("ggplot2")
library('dplyr')
library('tidyverse')
library("ggplot2")

# Firstly we import and view the dataset
Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')


#Now we do the first cleanup exercise by removing unwanted columns
Baltimore <- Baltimore[, -c(3,4,5,6,7)]

#The first task is to create an ID column in other to uniquely identify duplicate image files
Baltimore <- cbind(ID = 1:nrow(Baltimore), Baltimore)

#The second task is to separate the variables in the labels column to multiple columns(Labels & Probability)

Baltimore <- separate(Baltimore, label, into = c("Labels","Probability"),sep =":")


#Change cargo and rickshaw to NA

Baltimore[Baltimore == "rickshaw"] <-  NA
Baltimore[Baltimore == "cargo"] <-  NA
unique(Baltimore[c("Labels")])

#Lets replace our blank cells in the labels column with NA

Baltimore$Labels[Baltimore$Labels==""] <- NA

#Create subsets of data 

Balt_1 <- slice(Baltimore, 1:250)
Balt_2 <- slice(Baltimore, 1:500)
Balt_3 <- slice(Baltimore, 1:750)
Balt_4 <- slice(Baltimore, 1:1000)
Balt_5 <- slice(Baltimore, 1:1500)
Balt_6 <- slice(Baltimore, 1:2000)
Balt_7 <- slice(Baltimore, 1:2500)
Balt_8 <- slice(Baltimore, 1:3000)
Balt_9 <- slice(Baltimore, 1:3500)
Balt_10 <- slice(Baltimore, 1:4000)
Balt_11 <- slice(Baltimore, 1:5500)
Balt_12 <- slice(Baltimore, 1:6500)
Balt_13 <- slice(Baltimore, 1:7000)
Balt_14 <- slice(Baltimore, 1:7500)
Balt_15 <- slice(Baltimore, 1:8000)


#Create temporary tables for the ratio of each category
S1 <- round(prop.table(table(Balt_1$Labels, useNA = "ifany")),4)
S2 <- round(prop.table(table(Balt_2$Labels, useNA = "ifany")),4)
S3 <- round(prop.table(table(Balt_3$Labels, useNA = "ifany")),4)
S4 <- round(prop.table(table(Balt_4$Labels, useNA = "ifany")),4)
S5 <- round(prop.table(table(Balt_5$Labels, useNA = "ifany")),4)
S6 <- round(prop.table(table(Balt_6$Labels, useNA = "ifany")),4)
S7 <- round(prop.table(table(Balt_7$Labels, useNA = "ifany")),4)
S8 <- round(prop.table(table(Balt_8$Labels, useNA = "ifany")),4)
S9 <- round(prop.table(table(Balt_9$Labels, useNA = "ifany")),4)
S10 <- round(prop.table(table(Balt_10$Labels, useNA = "ifany")),4)
S11 <- round(prop.table(table(Balt_11$Labels, useNA = "ifany")),4)
S12 <- round(prop.table(table(Balt_12$Labels, useNA = "ifany")),4)
S13 <- round(prop.table(table(Balt_13$Labels, useNA = "ifany")),4)
S14 <- round(prop.table(table(Balt_14$Labels, useNA = "ifany")),4)
S15 <- round(prop.table(table(Balt_15$Labels, useNA = "ifany")),4)

#Put result in a table
Bcity_Ratio <- rbind(S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15)

#Convert Vector to Dataframe
Bcity_Ratio <- data.frame(Bcity_Ratio)

#Renaming columns - Here i renamed the N/A column
colnames(Bcity_Ratio)[3] <- "Unknown_Images"







