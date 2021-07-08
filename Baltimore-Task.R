
# Firstly we import and view the dataset
Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')
view(Baltimore)

#Now we do the first cleanup exercise by removing unwanted columns
Baltimore <- Baltimore[, -c(4,5,6,7)]

#The first task is to create an ID column in other to uniquely identify duplicate image files
Baltimore <- cbind(ID = 1:nrow(Baltimore), Baltimore)

#The second task is to separate the variables in the labels column to multiple columns(Labels & Probability)
library(tidyverse)
Baltimore <- separate(Baltimore, label, into = c("Labels","Probability"),sep =":")

#Now we remove the 'Cargo' and 'Rickshaw' data from the labels column
Baltimore = filter(Baltimore, Labels!="rickshaw")

#Lets replace our blank cells in the labels column with NA

Baltimore$Labels[Baltimore$Labels==""] <- NA

#The next is to view the proportion of unknown images to the known ones

library(mice)
md.pattern(Baltimore)

#Convert the values from NA in the Labels column to Unknown

#Calculating the ratio of number of images with pedals with 250 images

#Absolute frequency without missing values
freq<-table(Baltimore$Labels)
freq

#Absolute frequency with missing values
freq2<-table(Baltimore$Labels, exclude = NULL)
freq2

#Relative Frequency with missing value
prop2<-prop.table(freq2)
prop2

#Split dataset 
set.seed(821034)
dummy_sep <-rbinom(nrow(Baltimore), 1, 0.5)
Baltimore_a<- Baltimore[dummy_sep == 0,]
Baltimore_b<- Baltimore[dummy_sep == 1,]









































































