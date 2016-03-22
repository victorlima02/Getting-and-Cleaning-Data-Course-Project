#Read labels
library(dplyr)
dataDirectory <- file.path("./data" , "UCI HAR Dataset")
activityLabels <- read.table(file.path(dataDirectory, "activity_labels.txt"), header = FALSE)[,2]

#Mutate data frame
dta <- mutate(dta, Activity=factor(dta$Activity, levels = 1:6, labels = activityLabels))