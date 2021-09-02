#Install all the necessary packages

install.packages('tidyverse')
install.packages("gmodels")
install.packages("ggplot2")
library('dplyr')
library('tidyverse')
library("ggplot2")

# Firstly we import and view the dataset
Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')

#Rename the Names column
colnames(Baltimore)[1] <- "GSV_Images"

Baltimore[Baltimore==""] <- NA

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

Balti_1 <- sample_n(Baltimore, 250, replace = FALSE)
Balti_2 <- sample_n(Baltimore, 500, replace = FALSE)
Balti_3 <- sample_n(Baltimore, 750, replace = FALSE)
Balti_4 <- sample_n(Baltimore, 1000, replace = FALSE)
Balti_5 <- sample_n(Baltimore, 1500, replace = FALSE)
Balti_6 <- sample_n(Baltimore, 2000, replace = FALSE)
Balti_7 <- sample_n(Baltimore, 2500, replace = FALSE)
Balti_8 <- sample_n(Baltimore, 3000, replace = FALSE)
Balti_9 <- sample_n(Baltimore, 3500, replace = FALSE)
Balti_10 <- sample_n(Baltimore, 4000, replace = FALSE)
Balti_11 <- sample_n(Baltimore, 5500, replace = FALSE)
Balti_12 <- sample_n(Baltimore, 6000, replace = FALSE)
Balti_13 <- sample_n(Baltimore, 7000, replace = FALSE)
Balti_14 <- sample_n(Baltimore, 7500, replace = FALSE)
Balti_15 <- sample_n(Baltimore, 8000, replace = FALSE)


#Create temporary tables for the ratio of each category
S1 <- round(prop.table(table(Balti_1$Labels, useNA = "ifany")),4)
S2 <- round(prop.table(table(Balti_2$Labels, useNA = "ifany")),4)
S3 <- round(prop.table(table(Balti_3$Labels, useNA = "ifany")),4)
S4 <- round(prop.table(table(Balti_4$Labels, useNA = "ifany")),4)
S5 <- round(prop.table(table(Balti_5$Labels, useNA = "ifany")),4)
S6 <- round(prop.table(table(Balti_6$Labels, useNA = "ifany")),4)
S7 <- round(prop.table(table(Balti_7$Labels, useNA = "ifany")),4)
S8 <- round(prop.table(table(Balti_8$Labels, useNA = "ifany")),4)
S9 <- round(prop.table(table(Balti_9$Labels, useNA = "ifany")),4)
S10 <- round(prop.table(table(Balti_10$Labels, useNA = "ifany")),4)
S11 <- round(prop.table(table(Balti_11$Labels, useNA = "ifany")),4)
S12 <- round(prop.table(table(Balti_12$Labels, useNA = "ifany")),4)
S13 <- round(prop.table(table(Balti_13$Labels, useNA = "ifany")),4)
S14 <- round(prop.table(table(Balti_14$Labels, useNA = "ifany")),4)
S15 <- round(prop.table(table(Balti_15$Labels, useNA = "ifany")),4)

#Put result in a table
Bcity_Ratio <- rbind(S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15)

#Convert Vector to Dataframe
Bcity_Ratio <- data.frame(Bcity_Ratio)

#Renaming columns - Here I renamed the N/A column
colnames(Bcity_Ratio)[3] <- "Unknown_Images"

vec <- c(250, 500, 750, 1000, 1500, 2000, 2500, 3000, 3500, 4000,
         5500, 6000, 7000, 7500, 8000) 


Bcity_Ratio$sample_sz <- vec

Bcity_Ratio <- Bcity_Ratio[, c(4, 1, 2, 3)]

# Install and load data.table
install.packages("data.table")          
library(data.table)

#Convert Data frame to Table

setDT(Bcity_Ratio)

#Import result into a CSV 
write.csv(Bcity_Ratio,"C:\\Users\\Mayowa\\Documents\\HDRUK - INTERNSHIP\\Baltimore_results.csv", row.names = TRUE)









