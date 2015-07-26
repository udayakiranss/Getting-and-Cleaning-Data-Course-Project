# This function reads the base text files along the test and training data sets 
# and merges the both data sets.
run_analysis<-function(){
  # loads the dplyr library
  library("dplyr")
  # Read and load the activity labels from the base files
  activity_labels<-read.delim("activity_labels.txt",header = FALSE,sep="")
  # Obtain the activity labels from the activity_labels Data frame 
  activityLabelVec<-as.vector(activity_labels[,"V2"])
  # Read and load the feature details from the features text file
  features<-read.delim("features.txt",header = FALSE,sep="")
  # Obtain the feature labels from the features Data frame 
  featureVector<-as.vector(features[,"V2"])
  # Read and Load the test data set along with subject details
  testValues<- read.delim("test/X_test.txt",header=FALSE,sep="")
  testLabels<-read.delim("test/Y_test.txt",header = FALSE,sep="")
  test_subject<-read.delim("test/subject_test.txt",header = FALSE,sep="")
  # Add new variable activity into the existing list of variables of the test data set
  testValues<-mutate(testValues,activity=as.vector(testLabels[,"V1"]) )
  # Add new variable subject into the existing list of variables of the test data set
  testValues<-mutate(testValues,subject=as.vector(test_subject[,"V1"]) )
  
  # Read and Load the training data set along with subject details
  trainValues<- read.delim("train/X_train.txt",header=FALSE,sep="")
  trainLabels<-read.delim("train/Y_train.txt",header = FALSE,sep="")
  train_subject<-read.delim("train/subject_train.txt",header = FALSE,sep="")
  # Add new variable activity into the existing list of variables of the training data set
  trainValues<-mutate(trainValues,activity=as.vector(trainLabels[,"V1"]) )
  # Add new variable subject into the existing list of variables of the training data set
  trainValues<-mutate(trainValues,subject=as.vector(train_subject[,"V1"]) )
  # Add new labels Activity and SubjectID to the existing feature labels
  featureVector<-c(featureVector,"Activity","Subject-ID")
  # Read and load the Inertial Signals for the test data set
  # Not used for any calculations
  total_acc_x_test<-read.delim("test/Inertial Signals/total_acc_x_test.txt",header = FALSE,sep="")
  total_acc_y_test<-read.delim("test/Inertial Signals/total_acc_y_test.txt",header = FALSE,sep="")
  total_acc_z_test<-read.delim("test/Inertial Signals/total_acc_z_test.txt",header = FALSE,sep="")
  body_acc_x_test<-read.delim("test/Inertial Signals/body_acc_x_test.txt",header = FALSE,sep="")
  body_acc_y_test<-read.delim("test/Inertial Signals/body_acc_y_test.txt",header = FALSE,sep="")
  body_acc_z_test<-read.delim("test/Inertial Signals/body_acc_z_test.txt",header = FALSE,sep="")
  body_gyro_x_test<-read.delim("test/Inertial Signals/body_gyro_x_test.txt",header = FALSE,sep="")
  body_gyro_y_test<-read.delim("test/Inertial Signals/body_gyro_y_test.txt",header = FALSE,sep="")
  body_gyro_z_test<-read.delim("test/Inertial Signals/body_gyro_z_test.txt",header = FALSE,sep="")
  # Read and load the Inertial Signals for the Training data set
  # Not used for any calculations
  total_acc_x_train<-read.delim("train/Inertial Signals/total_acc_x_train.txt",header = FALSE,sep="")
  total_acc_y_train<-read.delim("train/Inertial Signals/total_acc_y_train.txt",header = FALSE,sep="")
  total_acc_z_train<-read.delim("train/Inertial Signals/total_acc_z_train.txt",header = FALSE,sep="")
  body_acc_x_train<-read.delim("train/Inertial Signals/body_acc_x_train.txt",header = FALSE,sep="")
  body_acc_y_train<-read.delim("train/Inertial Signals/body_acc_y_train.txt",header = FALSE,sep="")
  body_acc_z_train<-read.delim("train/Inertial Signals/body_acc_z_train.txt",header = FALSE,sep="")
  body_gyro_x_train<-read.delim("train/Inertial Signals/body_gyro_x_train.txt",header = FALSE,sep="")
  body_gyro_y_train<-read.delim("train/Inertial Signals/body_gyro_y_train.txt",header = FALSE,sep="")
  body_gyro_z_train<-read.delim("train/Inertial Signals/body_gyro_z_train.txt",header = FALSE,sep="")
  
  ## Merging the Test and training set
  mergedSet<-trainValues
  counter<-c(1:nrow(testValues))
  for(i in counter){
    mergedSet<-rbind(mergedSet,testValues[i,])
  }
  
  ## Appropriately labels the data set with descriptive variable names
  names(mergedSet)<-featureVector
  UniqueNames<- make.names(names=names(mergedSet), unique=TRUE, allow_ = TRUE)
  names(mergedSet)<-UniqueNames
  
  ## Selecting only mean and standard deviation measurement variables
  mean_sd_values<-select(mergedSet,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,562:563))
  ## Providing Activity Description Names instead of numeric entries
  mean_sd_values$Activity<-factor(mean_sd_values$Activity, labels=activityLabelVec)
  ## Grouping the merged data based on the Activity and Subject
  ## Calculating the mean of all other variables
  activity_subject_based_mean<-aggregate(mean_sd_values[, 1:66], list(mean_sd_values$Activity,mean_sd_values$Subject.ID), mean)
  ## Providing the appropriate names to the group names
  names(activity_subject_based_mean) <- c("ActivityName", "Subject",names(activity_subject_based_mean[3:68]))
  ## Creating the txt file of Activity-Subject based mean of all the variables
  write.table(activity_subject_based_mean,"activity_subject_based_mean.txt",sep="\t\t",row.names = FALSE)
}