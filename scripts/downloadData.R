#Verify the existence of our data dataDirectory
dataDirectory<-'data'

if(!dir.exists(dataDirectory)){
	dir.create(dataDirectory)
}

#Get the data
destinationFile <- file.path(dataDirectory , "Dataset.zip")
dataUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(dataUrl,destinationFile,method="curl")

#Unzip the downloaded file
unzip(zipfile=destinationFile,exdir=dataDirectory)

#Delete source zip file
file.remove(destinationFile)