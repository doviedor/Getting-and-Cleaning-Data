library('RCurl')
wd <- getwd()
udir <- 'UCI HAR Dataset'
fs <- 'UCI-HAR.zip'

## Verify if the directory exist, if not, the code will creat it and will download and unzip the file

if(!file.exists(udir))
  {
  dir.create('UCI HAR Dataset')
  sourcefile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url =  sourcefile, destfile =  paste(wd, udir, fs, sep = '/'))
  unzip(paste(udir, 'UCI-HAR.zip', sep = '/'))
}

## Bind the data for X and Y

XTest <- read.table(paste(udir, "test/X_test.txt", sep = '/'))
XTrain <- read.table(paste(udir,"train/X_train.txt", sep = '/'))
Xdata <- rbind(XTest, XTrain)

YTest <- read.table(paste(udir, "test/Y_test.txt", sep = '/'))
YTrain <- read.table(paste(udir,"train/Y_train.txt", sep = '/'))
Ydata <- rbind(YTest, YTrain)

##Read the table and find the strings. After a while I found that grep only works with vectors :(
feature <- read.table(paste(udir,'features.txt', sep = '/'), header = TRUE)
vcolumn <- feature$tBodyAcc.mean...X
columnas <- grep("std|mean", vcolumn)

## Keep only what we need and change the name of the columns in statx, staty, statz
statx <- Xdata[,columnas]
names(statx) <- vcolumn[columnas]
activities <- read.table(paste(udir, "activity_labels.txt", sep = '/'))
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
staty <- Ydata
staty[,1] = activities[staty[,1], 2]
names(staty) <- "activity" ## Add activity label
testSub <- read.table(paste(udir,"test", "subject_test.txt", sep = '/'))
trainSub <- read.table(paste(udir,"train", "subject_train.txt", sep = '/'))
statz <- rbind(testSub, trainSub)
names(statz) <- "Subjet"

#First Tidy Data
tidyData <- cbind(statz, staty, statx)
write.csv(tidyData, paste(udir, "tidyData.csv", sep = '/'))
write.table(tidyData, paste(udir, "tidyData.txt", sep = '/'))

#Second Tidy Data
average <- aggregate(x=tidyData, by=list(activities=tidyData$activity), FUN=mean)
average <- average[, !(colnames(average) %in% c("subj", "activity"))]
str(average)
write.table(average,paste(udir,'Mean.txt', sep = '/'), row.names = F)
write.csv(average,paste(udir,'Mean.csv', sep = '/'), row.names = F)
