## Getting And Cleaning Data Project 

## Purpose: R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Usage: Run R script run_analysis.R 

* set current directoty as working directory. 
* 
* store data files in the following folder structure
* ../UCI HAR Dataset/activity_labels.txt
* ../UCI HAR Dataset/features.txt
* ../UCI HAR Dataset/train/subject_train.txt
* ../UCI HAR Dataset/train/X_train.txt
* ../UCI HAR Dataset/train/y_train.txt
* ../UCI HAR Dataset/test/subject_test.txt 
* ../UCI HAR Dataset/test/X_test.txt 
* ../UCI HAR Dataset/test/y_test.txt 

## Output file: tidy.txt 

## Program explaination: 
* Step 1: Merges the training and the test sets to create one data set.
* 1.1 set environment to forace scientic notation into numeric 
* 1.2 read 3 files of test data (30% of data) 
* 1.3 read 3 files of train data (70% of data) 
* 1.4 merge test and train data set into one single data set 

* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
* 2.1 read feature labels from reference file 
* 2.2 create a filter of mean and std by using grep meand std from column names 
* 2.3  subet measurements data frame by the filter  

* Step 3: Uses descriptive activity names to name the activities in the data set
* 3.1 read feature labels 
* 3.2 combine subject, activity and measurements data frames into 1 data frame 
* 3.3 replace activity value with activitity names

* Step 4: Appropriately labels the data set with descriptive activity names. 
* 4.1 use features data frame to set column names 

* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* 5.1 use aggregate function to calculate measuremetn average by subject and activity 
* 5.2 rename column names 
* 5.3 sort final data set by subject and activity  
* 5.4 write to output file 

## Data Dictionary: refer to datadict.txt in github 



