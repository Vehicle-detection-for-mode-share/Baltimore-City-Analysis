#Install all the necessary pakages

install.packages('tidyverse')
library('dplyr')
library(tidyverse)

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

Baltimore2 <- sample_n(Baltimore_new, 250, replace = FALSE)
round(prop.table(table(Baltimore2$Labels, useNA = "ifany")),4) 


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





round(prop.table(table(Baltimore_new$Labels, useNA = "ifany")),4) 

Baltimore2 <- sample_n(Baltimore_new, 250, replace = FALSE)

Baltimore_new2 <- anti_join(Baltimore_new, Baltimore2)# this is done to create another random set of data without including the one I had used previously

Baltimore3 <- sample_n(Baltimore_new2, 500, replace = FALSE)



























































