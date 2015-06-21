library(dplyr)
library(knitr)

## Step 1: Read data from test and train
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep="")
x_test <- read.csv("UCI HAR Dataset/test/X_test.txt",header = FALSE,sep="")
y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt",header = FALSE,sep="")
y_train <- read.csv("UCI HAR Dataset/train/Y_train.txt",header = FALSE,sep="")
x_train <- read.csv("UCI HAR Dataset/train/X_train.txt",header = FALSE,sep="")
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep="")

## merge data
data_subject <- rbind(subject_train,subject_test)
data_features <- rbind(x_train,x_test)
data_activity <- rbind(y_train,y_test)

## Read features names
features <- read.csv("UCI HAR Dataset/features.txt",header = FALSE,sep="")
## Clean for parenthisis and hiphen
## This is done as it becomes easier later on to subset data
features$V2 <- gsub("\\(\\)", "",features$V2)
features$V2 <- gsub("-", "_",features$V2)
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt",header = FALSE,sep="")

## Assign names
names(data_features) <- features$V2
names(data_subject)<- c("subject_id")
names(data_activity)<- c("activity_labels")

## Combine and generate the total data (master)
datatotal <- cbind(data_subject,data_activity,data_features)

## get data only for mean and std
## Note: It is not specified what mean/std to look for, one that comes in the 
## end of the names or in the main body of the names. Hence, mean or std is 
## searched anywhere in names entries and subsetted

features_mean_std <- features$V2[grep("mean|std",features$V2)]
data_mean_stdnames <- c("subject_id","activity_labels",features_mean_std)
data_mean_std <- subset(datatotal,select = data_mean_stdnames)

## Apply appropriate labels to activity_labels
data_mean_std$activity_labels <- factor(data_mean_std$activity_labels,labels= 
                                c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                  "SITTING","STANDING","LAYING"))

## Clean names of data
## t and f denote the time series and frequency series.
## Mag was confusing as it could also eb understood as magnetometer, so changed magnitude
## Some elements have BodyBody, this is for the additional vecotrs for the angles.
## this is changed to body_body
names(data_mean_std)<-gsub("^t", "TimeSeries", names(data_mean_std))
names(data_mean_std)<-gsub("^f", "FrequencySeries", names(data_mean_std))
names(data_mean_std)<-gsub("Mag", "Magnitude", names(data_mean_std))
names(data_mean_std)<-gsub("BodyBody", "Body_Body", names(data_mean_std))

## Final data:  average of each variable for each activity and each subject
datafinal <- aggregate(.~subject_id + activity_labels,data_mean_std,mean)

## Write the data as tidydata.txt
write.table(datafinal,file = "tidydata.txt",row.names= FALSE)

## Generate Codebook
knit2html("codebook.Rmd")
