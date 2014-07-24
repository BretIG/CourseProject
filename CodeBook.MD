##Getting and Cleaning Data Course Project – Code Book

This code book has four sections:
<b>Data Overview </b>– A description of the raw data and links to the data and its original documentation
<b>R Script Instructions </b>– The 5 tasks that the R script is expected to perform
<b>R Script Overview </b>– A general narrative of how the run_analysis.R script works
<b>Tidy Dataset Description </b>– Information on the required dataset for the course project

###Data Overview
The raw data used in this project is the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Comprehensive information on this dataset is located at the <b>Source</b> link below, and all files can be located at the <b>Data</b> link below:

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###R Script Instructions
The course project requires a R script (named run_analysis.R) to be written that does the following 5 things:
1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
3 - Uses descriptive activity names to name the activities in the data set.
4 - Appropriately labels the data set with descriptive variable names. 
5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###R Script Overview
Before run_analysis is invoked, it is assumed that the raw data has already been downloaded and unzipped into R’s working directory (the unzipped raw data is also included in this repo).

The run_analysis.R script works in the following way:

There are two prelimenaries: the first sets the working directory, and the second loads the <b>plyr</b> package that is used in the fifth step of the R Script Instructions

Next the test and train files for the Data, Labels and Subject are loaded (six files total) and then test and train data is merged into their respective sets of Data, Labels and Subject using row binding (rbind).

While it may be an unnecessary effort the r-bound Data, Labels and Subject data is grouped together (using column bind) in the MasterSet.  

The MasterSet object should satify the first requirement from the R Script Instructions.

I personally found it more helpful to label the data with the descriptive variable names provided from the features.txt file at this point.  That is because of the next step where variables relating to the mean or std (standard deviation) are to be extracted.
Using the grep function, any variable that had the text “mean” or “std” was extracted into an object called Measures.

With the Activity variable, the numbers were replaced with word descriptions of the activity being performed.

Activity=1,"WALKING"
Activity=2,"WALKING_UPSTAIRS"
Activity=3, "WALKING_DOWNSTAIRS"
Activity=4,"SITTING"
Activity=5,"STANDING"
Activity=6,"LAYING"

Finally, utilizing the <b>plyr</b> package, ddply was implemented to create the final data frame that took the means of the Measures by Subject and Activity.  This table was then written to the csv file TodyDat.csv.


###Tidy Dataset Description

This file contains the means of 66 variables by Subject by Activity.  The first column identified the individual subject, while the next column indicated which activity the Subject was performing.

The names of all columns are:

Subject
Activity
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
