#Step 1

In this file we will divide each step, described by the project's instructions, into activities that demonstrate how that goal was achieved. 

Step 1: Merging the training and the test sets to create one data set.

##Activity 1

- Obtain the data.

###Objective

- To obtain the dataset from its source, recording it into the current working directory.

###R script

This code will download the dataset and place it on our data directory.

```R
#Verify the existence of our data dataDirectory
dataDirectory<-'data'

if(!dir.exists(dataDirectory)){
	dir.create(dataDirectory)
}

#Get the data
destinationFile <- paste0(dataDirectory,'Dataset.zip')
dataUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(dataUrl,destinationFile,method="curl")

#Unzip the downloaded file
unzip(zipfile=destinationFile,exdir=dataDirectory)
```

##Activity 2

- Read the data.

###Objective

- Having the data in memory for further analysis.

###Details

Our data is spread across several files in the data directory. Those files are hard to interpret and connecting the information they possess is our final goal in this step.

To attain this objective we need to read the following files:

- test/subject_test.txt 
- test/X_test.txt 
- test/y_test.txt 
- train/subject_train.txt 
- train/X_train.txt 
- train/y_train.txt 

Where “train” and “test” represent groups of subjects that are part of the experiment. The data is complementary across this groups and the variables have the same meaning, except for the group differentiation.

In our process we try to translate those files into instances for specific variables: Activity, Subject and Features. Where subjects can be easily obtained from “subject_train.txt” and subject_test.txt"

Although the other sets are more obscure, we can obtain a clear view of their meaning be noticing that “features.txt” and “activity_labels.txt” contain sets of variable names, while the other files contain values. X files indicate Features and Y files indicate activities.

In summary, in X, we have values of features. In Y we have activity labels. In sort that X contains activities in Y as performed by a subject; thus, X=F(Y) given a subject.

From the dataset's README.txt file:

	The dataset includes the following files:
	=========================================
	
	- 'README.txt'
	
	- 'features_info.txt': Shows information about the variables used on the feature vector.
	
	- 'features.txt': List of all features.
	
	- 'activity_labels.txt': Links the class labels with their activity name.
	
	- 'train/X_train.txt': Training set.
	
	- 'train/y_train.txt': Training labels.
	
	- 'test/X_test.txt': Test set.
	
	- 'test/y_test.txt': Test labels.
	
	The following files are available for the train and test data. Their descriptions are equivalent. 
	
	- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
	
	
###Script
```R
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
```

---

#Step 2

Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.

##Activity 1

- Filter the features that have mean or std in their names.

##Script
```R
basicInformationColumns <- seq(c("Subject", "Activity", "Group"))
meanOrSdtColumns <- grep("mean\\(\\)|std\\(\\)", names(dta))

remainingColumns <- c(basicInformationColumns,meanOrSdtColumns )
dta <- dta[, remainingColumns]
```

---

#Step 3

Step 3: Using descriptive activity names to name the activities in the data set

##Activity 1

Extract the descriptive name from activity_labels.txt

According to the README.txt

	- 'activity_labels.txt': Links the class labels with their activity name.
##Script
```R
#Read labels
library(dplyr)
dataDirectory <- file.path("./data" , "UCI HAR Dataset")
activityLabels <- read.table(file.path(dataDirectory, "activity_labels.txt"),header = FALSE)[,2]
dta <- mutate(dta, Activity=factor(dta$Activity, levels = 1:6, labels = activityLabels))
```

---

#Step 4

Step 4: Appropriately labeling the data set with descriptive variable names. 

##Activity 1

- Replace the variable names with meaningful and human readable strings.

##Details

From the features_info.txt file:

	- Prefix 't' denotes time;
	- 'f' indicates frequency domain signals;
	- Acc denotes accelerometer;
	- Gyro indicates gyroscope;
	- mean() means Mean value;
	- std() means Standard deviation.
	
##Script
```R
tmpNames <- names(dta)
tmpNames <- gsub("^t", "Time", tmpNames)
tmpNames <- gsub("^f", "Frequency", tmpNames)
tmpNames <- gsub("Acc", "Accelerometer", tmpNames)
tmpNames <- gsub("Gyro", "Gyroscope", tmpNames)
tmpNames <- gsub("Mag", "Magnitude", tmpNames)
tmpNames <- gsub("BodyBody", "Body", tmpNames)
tmpNames <- gsub("-std\\(\\)", "Sdt", tmpNames)
tmpNames <- gsub("-mean\\(\\)", "Mean", tmpNames)
names(dta) <- tmpNames 
```


---

#Step 5

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Activity 1

- Melt the data to have subjects, activities and group as key;
- Cast to obtain the mean.

##Script

```R
library(reshape2)

dta <- melt(dta, id = c("Subject", "Activity","Group"))
dta <- dcast(dta, Subject+Activity+Group~variable, mean)
```

