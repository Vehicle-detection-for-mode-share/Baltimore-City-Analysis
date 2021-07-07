Baltimore <- read.csv('C:/Users/Mayowa/Documents/INTERNSHP/Baltimore_detections.csv')
view(Baltimore)

data1 <- cbind(ID = 1:nrow(Baltimore), Baltimore) #To create a new ID Coloumn

Baltimore <- Baltimore[, -c(4,5,6,7)]#to delete columns based on their position in the dataset

data.frame(do.call("rbind", strsplit(as.character(Baltimore3$label), ":", fixed = TRUE) #to seperate variables in a column using preinstalled package in R
Baltimore3 %>%
  separate(label, c("label", "Probability"), ":")

Baltimore2 = filter(Baltimore3,label!='') #to remove blank the rows with blank cells

Baltimore5 = filter(Baltimore5, Labels!="cargo") #To remove the rows that has specific data

library(tidyr)
Baltimore4 <- separate(Baltimore2, label, into = c("Labels","Probability"),sep =":")  #To seperate variables in a column using the TIDYR library