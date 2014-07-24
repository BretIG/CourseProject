##BretIG
##Getting and Cleaning Data, Course Project
##July 2014

## Project Intructions
##You should create one R script called run_analysis.R that does the following. 
##1 - Merges the training and the test sets to create one data set.
##2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
##3 - Uses descriptive activity names to name the activities in the data set
##4 - Appropriately labels the data set with descriptive variable names. 
##5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##SetUp
setwd("D:\\RProject\\Data Science\\3 Getting and Cleaning Data\\CourseProject")
library(plyr)

##1 - Merges the training and the test sets to create one data set.

##From the working directory specified above, read all the necessary files into R
testDat <- read.table(".\\UCI HAR Dataset\\test\\x_test.txt")
testLab <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
testSub <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
trainDat <- read.table(".\\UCI HAR Dataset\\train\\x_train.txt")
trainLab <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
trainSub <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

##Next use cbind to merge all the test files into one datatable

Data <- rbind(testDat, trainDat)
Labels <- rbind(testLab, trainLab)
Subject <- rbind(testSub, trainSub)
MasterSet <- cbind(Data, Labels, Subject) ##this file merges all the test and training data

##4 - Appropriately labels the data set with descriptive variable names. This step is out of
## order but I found it more helpful to assign the variable names at this stage.

features <- read.table(".\\UCI HAR Dataset\\features.txt") #read features file
featNames <- features[,-1]
colnames(Data) <- featNames

##2 - Extract only the measurements on the mean and standard deviation for each measurement. 
Measures <- Data[,grep("mean\\(\\)|std\\(\\)",features[,2])] 

##3 - Uses descriptive activity names to name the activities in the data set

colnames(Subject) <- "Subject"
colnames(Labels) <- "Activity"
FinalDat<- cbind(Subject, Labels, Measures)

FinalDat[FinalDat$Activity==1,2]="WALKING"
FinalDat[FinalDat$Activity==2,2]="WALKING_UPSTAIRS"
FinalDat[FinalDat$Activity==3,2]="WALKING_DOWNSTAIRS"
FinalDat[FinalDat$Activity==4,2]="SITTING"
FinalDat[FinalDat$Activity==5,2]="STANDING"
FinalDat[FinalDat$Activity==6,2]="LAYING"

##5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

TidyDat <- ddply(FinalDat, .(Subject, Activity),function(x) colMeans(x[,3:68]))

write.csv(TidyDat, "TidyDat.csv", row.names=FALSE)


