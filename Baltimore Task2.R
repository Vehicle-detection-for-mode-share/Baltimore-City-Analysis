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

Balt_1 <- sample_n(Baltimore, 250, replace = TRUE)
Balt_2 <- sample_n(Baltimore, 500, replace = TRUE)
Balt_3 <- sample_n(Baltimore, 1000, replace = TRUE)
Balt_4 <- sample_n(Baltimore, 1500, replace = TRUE)
Balt_5 <- sample_n(Baltimore, 2000, replace = TRUE)
Balt_6 <- sample_n(Baltimore, 2500, replace = TRUE)
Balt_7 <- sample_n(Baltimore, 3000, replace = TRUE)
Balt_8 <- sample_n(Baltimore, 4000, replace = TRUE)
Balt_9 <- sample_n(Baltimore, 4500, replace = TRUE)
Balt_10 <- sample_n(Baltimore, 5500, replace = TRUE)
Balt_11 <- sample_n(Baltimore, 6000, replace = TRUE)
Balt_12 <- sample_n(Baltimore, 6500, replace = TRUE)
Balt_13 <- sample_n(Baltimore, 7000, replace = TRUE)
Balt_14 <- sample_n(Baltimore, 8000, replace = TRUE)


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


#Put result in a table
Bcity_Ratio <- rbind(S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14)

#Convert Vector to Dataframe
Bcity_Ratio <- data.frame(Bcity_Ratio)

#Renaming columns - Here i renamed the N/A column
colnames(Bcity_Ratio)[3] <- "Unknown_Images"







