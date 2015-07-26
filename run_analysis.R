run_analysis<-function(){
  library("dplyr")
  activity_labels<-read.delim("activity_labels.txt",header = FALSE,sep="")
  activityLabelVec<-as.vector(activity_labels[,"V2"])
  features<-read.delim("features.txt",header = FALSE,sep="")
  featureVector<-as.vector(features[,"V2"])
  
  testValues<- read.delim("test/X_test.txt",header=FALSE,sep="")
  testLabels<-read.delim("test/Y_test.txt",header = FALSE,sep="")
  test_subject<-read.delim("test/subject_test.txt",header = FALSE,sep="")
  testValues<-mutate(testValues,activity=as.vector(testLabels[,"V1"]) )
  testValues<-mutate(testValues,subject=as.vector(test_subject[,"V1"]) )
  
  trainValues<- read.delim("train/X_train.txt",header=FALSE,sep="")
  trainLabels<-read.delim("train/Y_train.txt",header = FALSE,sep="")
  train_subject<-read.delim("train/subject_train.txt",header = FALSE,sep="")
  trainValues<-mutate(trainValues,activity=as.vector(trainLabels[,"V1"]) )
  trainValues<-mutate(trainValues,subject=as.vector(train_subject[,"V1"]) )
  
  featureVector<-c(featureVector,"Activity","Subject-ID")
  
  total_acc_x_test<-read.delim("test/Inertial Signals/total_acc_x_test.txt",header = FALSE,sep="")
  total_acc_y_test<-read.delim("test/Inertial Signals/total_acc_y_test.txt",header = FALSE,sep="")
  total_acc_z_test<-read.delim("test/Inertial Signals/total_acc_z_test.txt",header = FALSE,sep="")
  body_acc_x_test<-read.delim("test/Inertial Signals/body_acc_x_test.txt",header = FALSE,sep="")
  body_acc_y_test<-read.delim("test/Inertial Signals/body_acc_y_test.txt",header = FALSE,sep="")
  body_acc_z_test<-read.delim("test/Inertial Signals/body_acc_z_test.txt",header = FALSE,sep="")
  body_gyro_x_test<-read.delim("test/Inertial Signals/body_gyro_x_test.txt",header = FALSE,sep="")
  body_gyro_y_test<-read.delim("test/Inertial Signals/body_gyro_y_test.txt",header = FALSE,sep="")
  body_gyro_z_test<-read.delim("test/Inertial Signals/body_gyro_z_test.txt",header = FALSE,sep="")
  
  total_acc_x_train<-read.delim("train/Inertial Signals/total_acc_x_train.txt",header = FALSE,sep="")
  total_acc_y_train<-read.delim("train/Inertial Signals/total_acc_y_train.txt",header = FALSE,sep="")
  total_acc_z_train<-read.delim("train/Inertial Signals/total_acc_z_train.txt",header = FALSE,sep="")
  body_acc_x_train<-read.delim("train/Inertial Signals/body_acc_x_train.txt",header = FALSE,sep="")
  body_acc_y_train<-read.delim("train/Inertial Signals/body_acc_y_train.txt",header = FALSE,sep="")
  body_acc_z_train<-read.delim("train/Inertial Signals/body_acc_z_train.txt",header = FALSE,sep="")
  body_gyro_x_train<-read.delim("train/Inertial Signals/body_gyro_x_train.txt",header = FALSE,sep="")
  body_gyro_y_train<-read.delim("train/Inertial Signals/body_gyro_y_train.txt",header = FALSE,sep="")
  body_gyro_z_train<-read.delim("train/Inertial Signals/body_gyro_z_train.txt",header = FALSE,sep="")
  
  ## 1.Merging the Test and training set
  mergedSet<-trainValues
  counter<-c(1:nrow(testValues))
  for(i in counter){
    mergedSet<-rbind(mergedSet,testValues[i,])
  }
  
  ## 4.Appropriately labels the data set with descriptive variable names
  names(mergedSet)<-featureVector
  valid_column_names<- make.names(names=names(mergedSet), unique=TRUE, allow_ = TRUE)
  names(mergedSet)<-valid_column_names
  
  ## 2.Selecting the mean and standard deviation measurements
  mean_sd_values<-select(mergedSet,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,562:563))
  ## 3.Providing Activity Description Names
  mean_sd_values$Activity<-factor(mean_sd_values$Activity, labels=activityLabelVec)
  
  activity_subject_based_mean<-aggregate(mean_sd_values[, 1:66], list(mean_sd_values$Activity,mean_sd_values$Subject.ID), mean)
  names(activity_subject_based_mean) <- c("ActivityName", "Subject",names(activity_subject_based_mean[3:68]))
  write.table(activity_subject_based_mean,"activity_subject_based_mean.txt",sep="\t\t",row.names = FALSE)
}