#Read Activities
dataDirectory <- file.path("./data" , "UCI HAR Dataset")
testDirectory <- file.path(dataDirectory, "test") 
trainDirectory <- file.path(dataDirectory, "train")

#Subjects.
subjectsTest  <- read.table(file.path(testDirectory , "subject_test.txt"),header = FALSE)
subjectsTrain <- read.table(file.path(trainDirectory, "subject_train.txt"),header = FALSE)

#Y files contain activity labels.
activitiesTest  <- read.table(file.path(testDirectory, "y_test.txt" ),header = FALSE)
activitiesTrain <- read.table(file.path(trainDirectory, "y_train.txt"),header = FALSE)

#X files contain features.
featuresTest  <- read.table(file.path(testDirectory, "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(trainDirectory, "X_train.txt"),header = FALSE)

#Concatenate the data frames. ------------------------------------
featureNames <- read.table(file.path(dataDirectory, "features.txt"),head=FALSE)
groups=factor(c("Test","Train"))

testData <- cbind(subjectsTest, activitiesTest, groups[1], featuresTest)
names(testData) <- c("Subject", "Activity", "Group", as.character(featureNames$V2))

trainData <- cbind(subjectsTrain, activitiesTrain, groups[2], featuresTrain)
names(trainData) <- c("Subject", "Activity", "Group", as.character(featureNames$V2))

dta <- rbind(testData, trainData)
