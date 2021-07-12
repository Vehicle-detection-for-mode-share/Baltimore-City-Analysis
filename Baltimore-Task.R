#Install all the necessary pakages

install.packages('tidyverse')
install.packages("gmodels")
library('dplyr')
library(tidyverse)
library(gmodels)

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

Baltimore_new2 <- anti_join(Baltimore_new, Baltimore2)# this is done to create another random set of data without including the one I had used previously

Baltimore_new3 <- anti_join(Baltimore_new2, Baltimore3)

Baltimore_new4 <- anti_join(Baltimore_new3, Baltimore4)

Baltimore_new5 <- anti_join(Baltimore_new4, Baltimore5)

Baltimore_new6 <- anti_join(Baltimore_new5, Baltimore6)

Baltimore3 <- sample_n(Baltimore_new2, 500, replace = FALSE)

Baltimore4 <- sample_n(Baltimore_new3, 2000, replace = FALSE)

Baltimore5 <- sample_n(Baltimore_new4, 2500, replace = FALSE)

Baltimore6 <- sample_n(Baltimore_new5, 3000, replace = FALSE)

#Getting the ratios
round(prop.table(table(Baltimore2$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore3$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore4$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore5$Labels, useNA = "ifany")),4)
round(prop.table(table(Baltimore6$Labels, useNA = "ifany")),4)

#Create temporary tables for each result
set250 <- round(prop.table(table(Baltimore2$Labels, useNA = "ifany")),4)
set500 <- round(prop.table(table(Baltimore3$Labels, useNA = "ifany")),4)
set2000 <- round(prop.table(table(Baltimore4$Labels, useNA = "ifany")),4)
set2500 <- round(prop.table(table(Baltimore5$Labels, useNA = "ifany")),4)
set3000 <- round(prop.table(table(Baltimore6$Labels, useNA = "ifany")),4)
set_last <- round(prop.table(table(Baltimore_new6$Labels, useNA = "ifany")),4)

#View results for each category in one table
rbind(set250, set500,set2000, set2500, set3000, set_last)

#Put result in a table
Baltimore_Ratios <- rbind(set250, set500,set2000, set2500, set3000, set_last)

#Renaming columns - Here i renamed the N/A column
colnames(Baltimore_Ratios)[3] <- "Unknown_Images"

#In order to plot my graph I need to have my sample sizes as one of my independent variables
#the easiest way for me was to create a new column with the sample size first 
#I created a temp tablethen I used the CBind function to merge it to the main table

vec <- c('sz_250', 'sz_500', 'sz_2000', 'sz_2500', 'sz_3000','sz_others')

Baltimore_Ratios2 <- Baltimore_Ratios

Baltimore_Ratios2 <- cbind(Baltimore_Ratios2, sample_size = vec)

#Convert Vector to Dataframe
Baltimore_Ratios3 <- data.frame(Baltimore_Ratios2)

Baltimore_Ratios3[ ,c(4, 1, 2, 3)] #Trying to rearrange my columns

subset(Baltimore_Ratios3, select = c(4, 1, 2, 3))

ggplot(Baltimore_Ratios3, aes(x = sample_size, y = motor))





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

Baltimore_new3 <- anti_join(Baltimore_new2, Baltimore3)

Baltimore_new4 <- anti_join(Baltimore_new3, Baltimore4)

Baltimore_new5 <- anti_join(Baltimore_new4, Baltimore5)

Baltimore_new6 <- anti_join(Baltimore_new5, Baltimore6)

Baltimore3 <- sample_n(Baltimore_new2, 500, replace = FALSE)

Baltimore4 <- sample_n(Baltimore_new3, 2000, replace = FALSE)

Baltimore5 <- sample_n(Baltimore_new4, 2500, replace = FALSE)

Baltimore6 <- sample_n(Baltimore_new5, 3000, replace = FALSE)

Baltimore7 <- sample_n(Baltimore_new6)



CrossTable(table(Baltimore_new$Labels, Baltimore_new$Labels),
           prop.r = TRUE, #add prop by row
           prop.c=TRUE, #add prop by column
           prop.t=TRUE, #remove prop by row
           prop.chisq=FALSE, #remove chisq contribution
           chisq=F, #add chisq to
           format = "SPSS")

















































