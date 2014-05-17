library(plyr)

## Step 1: Merges the training and the test sets to create one data set.
## settings to forace scientic notation into numeric 
options("scipen"=100, "digits"=10)

## 1.1 read in test data (30%) 
test_X_filename <- read.table("UCI HAR Dataset/test/X_test.txt")
test_Y_filename <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_Subject_filename <- read.table("UCI HAR Dataset/test/subject_test.txt")

## 1.2 read in train data (70%) 
train_X_filename <- read.table("UCI HAR Dataset/train/X_train.txt")
train_Y_filename <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_Subject_filename <- read.table("UCI HAR Dataset/train/subject_train.txt") 

## 1.3 merge test and train data set 
XData <- rbind(test_X_filename,train_X_filename)
YData <- rbind(test_Y_filename,train_Y_filename)
subjectData <- rbind(test_Subject_filename,train_Subject_filename)

 

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
## 2.1 read feature labels 
features <- read.table("UCI HAR Dataset/features.txt")
## 2.2 create a filter of mean and std 
filter_cols <- subset(features,  grepl("(mean\\(\\)|std\\(\\))", features$V2) )
##2.3  subet X data by the filter  
XData <- XData[,filter_cols$V1]



## Step 3: Uses descriptive activity names to name the activities in the data set
## 3.1 read feature labels 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
YData <- join(YData, activity_labels, by="V1")

## 3.2 combine subject, activity and measurements 
tidy <- cbind(subjectData, YData, XData)
## 3.3 replace activity value with names
## tidy <- tidy[c(1,3,4:69)]


## Step 4: Appropriately labels the data set with descriptive activity names. 
## 4.1 set column names 
names(tidy) <- c("subject","activity","activityName", sapply(filter_cols[,2],function(x) gsub(pattern="\\(|\\)|-",replacement="",x)))


## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy$subject <- factor(tidy$subject)
tidy$activity <- factor(tidy$activity)
tidy$activityName <- factor(tidy$activityName)

## 5.1 average by subject and activity 
tidyMean <- aggregate(tidy[,4:69], by=list(tidy$subject, tidy$activity, tidy$activityName), FUN=mean)
names(tidyMean) <- c("subject","activity","activityName", sapply(filter_cols[,2],function(x) gsub(pattern="\\(|\\)|-",replacement="",x)))
tidyMean <- tidyMean[order(tidyMean$subject,tidyMean$activity),]

## 5.3 write to output file 
write.table(tidyMean, "tidy.txt", sep="\t")



