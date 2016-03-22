library(reshape2)

dta <- melt(dta, id = c("Subject", "Activity","Group"))
dta <- dcast(dta, Subject+Activity+Group~variable, mean)

write.table(dta, file = "tidyData.txt",row.name=FALSE)