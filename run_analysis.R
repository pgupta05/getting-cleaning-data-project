## Open libraries
library(reshape2)

## define root dir
rootDir = "C:/MyDataDir/Client/R-Code/UCI HAR Dataset/"

## Define Function

runAnalysis <- function() {
  
  
  ## Read all activities
  activityList  = read.table(paste0(rootDir,"activity_labels.txt"), sep=" ", col.names=c("activity_id", "activity_name"), fill=FALSE)
  
  #print(activityList)
  
  ## Read  all feature data and create a table 
  featureList  <- read.table(paste0(rootDir,"features.txt"), sep=" ", col.names=c("feature_id", "feature_name"),fill=FALSE) 
  
  ## make list of features names
  colNames <- featureList[,2]
  #print(colNames)
  
  ## Read Features File
  ##readFeatures.File <- function(name) {
   ## paste0("X_", name, ".txt", sep = "")
  ##}
  
  ## Read activity File
  ##readActivity.File <- function(name) {
   ## paste0("Y_", name, ".txt", sep = "")
 ## }
  
  ## Read Subject File
 ## readSubject.File <- function(name) {
  ##  paste0("subject_", name, ".txt", sep = "")
 ## }
  
 
 ## Read files function
 readFeatures.File <- function(type,name) {
   paste0(type,"_", name, ".txt", sep = "")
 }
  
  ## Read Test  Data 
  name <- "test"
  test.data <- read.table(paste0(rootDir,name,"/",readFeatures.File("X",name)))
  test.activity <- read.table(paste0(rootDir,name,"/",readFeatures.File("y",name)))
  test.subject <- read.table(paste0(rootDir,name,"/",readFeatures.File("subject",name)))
  
  
  ## Update Column Names
  ## for Test 
  colnames(test.data) <- colNames
  colnames(test.activity) <- "activity_id"
  colnames(test.subject) <- "subject_id"
  
  ##Combine the subject id's, activity id's and data into one dataframe
  ## For Test
  #test_data <- cbind(test.subject , test.activity , test.data)
  
  ## Read Train Data 
  name <- "train"
  train.data <- read.table(paste0(rootDir,name,"/",readFeatures.File("X",name)))
  train.activity <- read.table(paste0(rootDir,name,"/",readFeatures.File("y",name)))
  train.subject <- read.table(paste0(rootDir,name,"/",readFeatures.File("subject",name)))
  
  ## Update Column Names
  ## for Train
  colnames(train.data) <- colNames
  colnames(train.activity) <- "activity_id"
  colnames(train.subject) <- "subject_id"
  
  ##Combine the subject id's, activity id's and data into one dataframe
  ## For Train
  #train_data <- cbind(train.subject , train.activity , train.data)
  
  ## Combine both TEST and TRAIN data into single data Frame
  #all_data <- rbind(train_data, test_data)
  #print(all_data)
  
 
  
  ## Filter columns refering to mean() or std() values
  ## For Mean() value for test data 
  meancolID <- grep("mean()", names(test.data),  fixed=TRUE)
  meanColNames <- names(test.data)[meancolID]
  
 
  
  ## for STD() value for test
  stdcolID <- grep("std()", names(test.data),  fixed=TRUE)
  stdColNames <- names(test.data)[stdcolID]
  
  ## filter the selection based on mean() and std() data and the selected columns
  mean.std.testdata <- test.data[,c(meanColNames,stdColNames)]
  mean.std.testdata <- cbind(test.subject, test.activity, mean.std.testdata)
    
  mean.std.traindata <- train.data[,c(meanColNames,stdColNames)]
  mean.std.traindata <- cbind(train.subject, train.activity, mean.std.traindata)
  
  
  
  ## Now Combine both test and train data set 
  all_data <- rbind(mean.std.traindata, mean.std.testdata)
  
   print(nrow(all_data))
  
  
  ##Merge the activities data with the mean/std values data with descriptive ##activity names
  
   desc_names <- merge(all_data,activityList,by.x="activity_id",by.y="activity_id",all=TRUE)
   
   all_data <- desc_names[,c("subject_id", "activity_name", meanColNames, stdColNames)]
   
  
  ##Melt the dataset with the descriptive activity names for better handling
  melt.data<- melt(all_data,id=c("subject_id","activity_name"))

  ##Cast the melted dataset according to  the average of each variable 
  ##for each activity and each subject
  mean.data <- dcast(melt.data,subject_id + activity_name ~ variable,fun.aggregate = mean, na.rm = TRUE)
 print("upto here")
  ## Create a file with the new tidy dataset
  write.table(mean.data,"./tidy_movement_data.txt",row.names = FALSE, quote = FALSE)
}




