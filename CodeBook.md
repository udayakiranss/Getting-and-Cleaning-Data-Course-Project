# Getting-and-Cleaning-Data-Course-Project
==================================================================
Code Book for Coursera - Getting and Cleaning Data Course Project
Version 1.0

Introduction
==================================================================
This code book describes how average of mean and standard deviation variables are calculated with respect to each activity and each subject.

Description of Variables
==================================================================
-Activity Name: Data Type: Categorical 
Describes the type of activity is performed by the subject
-Subject: Data Type: Ordinal 
Provides the Subject identifier, who performed the activity
-tBodyAcc.mean...X          
-tBodyAcc.mean...Y
-tBodyAcc.mean...Z
-tBodyAcc.std...X           
-tBodyAcc.std...Y
-tBodyAcc.std...Z
-tGravityAcc.mean...X       
-tGravityAcc.mean...Y
-tGravityAcc.mean...Z
-tGravityAcc.std...X        
-tGravityAcc.std...Y
-tGravityAcc.std...Z
-tBodyAccJerk.mean...X      
-tBodyAccJerk.mean...Y
-tBodyAccJerk.mean...Z
-tBodyAccJerk.std...X       
-tBodyAccJerk.std...Y
-tBodyAccJerk.std...Z
-tBodyGyro.mean...X         
-tBodyGyro.mean...Y
-tBodyGyro.mean...Z 
-tBodyGyro.std...X          
-tBodyGyro.std...Y
-tBodyGyro.std...Z
-tBodyGyroJerk.mean...X     
-tBodyGyroJerk.mean...Y
-tBodyGyroJerk.mean...Z
-tBodyGyroJerk.std...X      
-tBodyGyroJerk.std...Y
-tBodyGyroJerk.std...Z
-tBodyAccMag.mean..         
-tBodyAccMag.std..
-tGravityAccMag.mean..
-tGravityAccMag.std..
-tBodyAccJerkMag.mean..
-tBodyAccJerkMag.std..
-tBodyGyroMag.mean..        
-tBodyGyroMag.std..
-tBodyGyroJerkMag.mean..
-tBodyGyroJerkMag.std..     
-fBodyAcc.mean...X
-fBodyAcc.mean...Y
-fBodyAcc.mean...Z          
-fBodyAcc.std...X
-fBodyAcc.std...Y
-fBodyAcc.std...Z           
-fBodyAccJerk.mean...X
-fBodyAccJerk.mean...Y
-fBodyAccJerk.mean...Z      
-fBodyAccJerk.std...X
-fBodyAccJerk.std...Y
-fBodyAccJerk.std...Z       
-fBodyGyro.mean...X
-fBodyGyro.mean...Y
-fBodyGyro.mean...Z         
-fBodyGyro.std...X
-fBodyGyro.std...Y
-fBodyGyro.std...Z          
-fBodyAccMag.mean..
-fBodyAccMag.std..
-fBodyBodyAccJerkMag.mean.. 
-fBodyBodyAccJerkMag.std..
-fBodyBodyGyroMag.mean..
-fBodyBodyGyroMag.std..     
-fBodyBodyGyroJerkMag.mean..
-fBodyBodyGyroJerkMag.std.. 
Instruction List
==================================================================
Following steps are performed to obtained the tidy set
1. Read and load the activity labels from the base files(activity_labels.txt)
2. Read and load the feature details from the features text file(features.txt)
3. Read and Load the test data set (test/X_test.txt and test/Y_test.txt)
4. Read and load the subject details of the test data set. (test/subject_test.txt)
5. Add new variable "Activity" into the existing list of variables of the test data set
6. Add new variable "Subject" into the existing list of variables of the test data set
7. Read and Load the training data set (train/X_train.txt and train/Y_train.txt) 
8. Read and load the subject details of the training data set.(train/subject_train.txt)
9. Add new variable "Activity" into the existing list of variables of the training data set
10. Add new variable "Subject" into the existing list of variables of the training data set
11. Merging the Test and training set
12. Provide descriptive label names to the merged data set.
13. Select only mean and standard deviation measurement variables from the merged data set
14. Group the merged data based on each Activity and each Subject
15. Calculating the mean of all other variables with respect to Activity and Subject
16. Creating the txt file of Activity-Subject based mean of all the variables(activity_subject_based_mean.txt)

