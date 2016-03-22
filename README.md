# Getting and Cleaning Data Course Project

##Overview 
This repository was built as the final project submission for the Getting and Cleaning Data course, Johns Hopkins University.

##Taks and Review criteria

	1. The submitted data set is tidy.
	2. The Github repo contains the required scripts.
	3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
	4. The README that explains the analysis files is clear and understandable.
	5. The work submitted for this project is the work of the student who submitted it.

##Objective

This project had as its main goal to demonstrate the data collection and cleaning processes as applied to a specific dataset.

---

##Data

The data used in this project is available inside the data folder, localized in this repository. 

Additionally, it can be found at the following URL:

- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Originated from: 

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Where the due credit should be given to the work realized as part of the following publication:

- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

###License
Please note that the dataset comes with the constrains required by the license embedded inside the README.txt file, where it is stated that: “This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.” 

###Date description
For the original data description, please refer to the README.txt file, inside this repository or in the original data source.

The cleaned data is described by the CodeBook.md file and in the Procedure.md file.

---

##Instructions
You should create one R script called run_analysis.R that does the following:

    1. Merges the training and the test sets to create one data set;
    2. Extracts only the measurements on the mean and standard deviation for each measurement;
    3. Uses descriptive activity names to name the activities in the data set;
    4. Appropriately labels the data set with descriptive variable names;
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable    for each activity and each subject.
    
    