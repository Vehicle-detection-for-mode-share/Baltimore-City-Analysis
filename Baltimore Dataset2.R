Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')
view(Baltimore)

data1 <- cbind(ID = 1:nrow(Baltimore), Baltimore) #To create a new ID Coloumn

Baltimore <- Baltimore[, -c(4,5,6,7)]#to delete columns based on their position in the dataset

data.frame(do.call("rbind", strsplit(as.character(Baltimore3$label), ":", fixed = TRUE) #to seperate variables in a column using preinstalled package in R
Baltimore3 %>%
  separate(label, c("label", "Probability"), ":")

Baltimore2 = filter(Baltimore3,label!='') #to remove blank the rows with blank cells

Baltimore5 = filter(Baltimore5, Labels!="cargo") #To remove the rows that has specific data

library(tidyverse)
Baltimore1 <- separate(Baltimore1, label, into = c("Labels","Probability"),sep =":")  #To seperate variables in a column using the TIDYR library
Baltimore1 %>%
  select(Labels,name)%>%
filter(!complete.cases(.))%>% #To extract rows that have missing data
 view

library(mice)
md.pattern(Baltimore1) #this is used to plot a graph to see your proportion of missing data

                               
Baltimore6[Baltimore6  == ","] <- NA  # Replace blank & space by NA

Baltimore6$label[Baltimore6$label==""] <- NA  