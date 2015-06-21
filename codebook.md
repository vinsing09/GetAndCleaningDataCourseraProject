---
title: 'Codebook: tidydata - generated from UCI HAR dataset'
author: "Vineet Singh"
date: "21 June 2015"
output: html_document
---

# General Description
As part of the coursera getting and cleaning course project work, a tidydata.txt is made from the UCI HAR dataset. This codebook explains the data in the final output file tidydata.txt

The code run_analysis.R creates a the data in required form from the original data retrieved from the url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The original dataset comprises six activity performed by thirty subjects giving 561 measurements in total. The script takes the subset of all the variables with names o mean and std and then arranges the data taking average for each subject and each activity, thus having total of 180 observations. final tidy data has 81 variables out of which two are subject and activity, the remaining are the average of variables form original dataset that has mean or std mentioned. Apart form this, the script also cleans the variable renames from the original dataset to have better representation (explained subsequently).

# Varibales Description
## Subject_id
This consists of numeric values form 1 to 30 representing the particular subject who performed the exepriments.

## Activity_labels
The activity labels are the six types of activities performed by the subjects:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

## Measurements

The names of the measurement for which mean is calculated.

```
##  [1] "subject_id"                                        
##  [2] "activity_labels"                                   
##  [3] "TimeSeriesBodyAcc_mean_X"                          
##  [4] "TimeSeriesBodyAcc_mean_Y"                          
##  [5] "TimeSeriesBodyAcc_mean_Z"                          
##  [6] "TimeSeriesBodyAcc_std_X"                           
##  [7] "TimeSeriesBodyAcc_std_Y"                           
##  [8] "TimeSeriesBodyAcc_std_Z"                           
##  [9] "TimeSeriesGravityAcc_mean_X"                       
## [10] "TimeSeriesGravityAcc_mean_Y"                       
## [11] "TimeSeriesGravityAcc_mean_Z"                       
## [12] "TimeSeriesGravityAcc_std_X"                        
## [13] "TimeSeriesGravityAcc_std_Y"                        
## [14] "TimeSeriesGravityAcc_std_Z"                        
## [15] "TimeSeriesBodyAccJerk_mean_X"                      
## [16] "TimeSeriesBodyAccJerk_mean_Y"                      
## [17] "TimeSeriesBodyAccJerk_mean_Z"                      
## [18] "TimeSeriesBodyAccJerk_std_X"                       
## [19] "TimeSeriesBodyAccJerk_std_Y"                       
## [20] "TimeSeriesBodyAccJerk_std_Z"                       
## [21] "TimeSeriesBodyGyro_mean_X"                         
## [22] "TimeSeriesBodyGyro_mean_Y"                         
## [23] "TimeSeriesBodyGyro_mean_Z"                         
## [24] "TimeSeriesBodyGyro_std_X"                          
## [25] "TimeSeriesBodyGyro_std_Y"                          
## [26] "TimeSeriesBodyGyro_std_Z"                          
## [27] "TimeSeriesBodyGyroJerk_mean_X"                     
## [28] "TimeSeriesBodyGyroJerk_mean_Y"                     
## [29] "TimeSeriesBodyGyroJerk_mean_Z"                     
## [30] "TimeSeriesBodyGyroJerk_std_X"                      
## [31] "TimeSeriesBodyGyroJerk_std_Y"                      
## [32] "TimeSeriesBodyGyroJerk_std_Z"                      
## [33] "TimeSeriesBodyAccMagnitude_mean"                   
## [34] "TimeSeriesBodyAccMagnitude_std"                    
## [35] "TimeSeriesGravityAccMagnitude_mean"                
## [36] "TimeSeriesGravityAccMagnitude_std"                 
## [37] "TimeSeriesBodyAccJerkMagnitude_mean"               
## [38] "TimeSeriesBodyAccJerkMagnitude_std"                
## [39] "TimeSeriesBodyGyroMagnitude_mean"                  
## [40] "TimeSeriesBodyGyroMagnitude_std"                   
## [41] "TimeSeriesBodyGyroJerkMagnitude_mean"              
## [42] "TimeSeriesBodyGyroJerkMagnitude_std"               
## [43] "FrequencySeriesBodyAcc_mean_X"                     
## [44] "FrequencySeriesBodyAcc_mean_Y"                     
## [45] "FrequencySeriesBodyAcc_mean_Z"                     
## [46] "FrequencySeriesBodyAcc_std_X"                      
## [47] "FrequencySeriesBodyAcc_std_Y"                      
## [48] "FrequencySeriesBodyAcc_std_Z"                      
## [49] "FrequencySeriesBodyAcc_meanFreq_X"                 
## [50] "FrequencySeriesBodyAcc_meanFreq_Y"                 
## [51] "FrequencySeriesBodyAcc_meanFreq_Z"                 
## [52] "FrequencySeriesBodyAccJerk_mean_X"                 
## [53] "FrequencySeriesBodyAccJerk_mean_Y"                 
## [54] "FrequencySeriesBodyAccJerk_mean_Z"                 
## [55] "FrequencySeriesBodyAccJerk_std_X"                  
## [56] "FrequencySeriesBodyAccJerk_std_Y"                  
## [57] "FrequencySeriesBodyAccJerk_std_Z"                  
## [58] "FrequencySeriesBodyAccJerk_meanFreq_X"             
## [59] "FrequencySeriesBodyAccJerk_meanFreq_Y"             
## [60] "FrequencySeriesBodyAccJerk_meanFreq_Z"             
## [61] "FrequencySeriesBodyGyro_mean_X"                    
## [62] "FrequencySeriesBodyGyro_mean_Y"                    
## [63] "FrequencySeriesBodyGyro_mean_Z"                    
## [64] "FrequencySeriesBodyGyro_std_X"                     
## [65] "FrequencySeriesBodyGyro_std_Y"                     
## [66] "FrequencySeriesBodyGyro_std_Z"                     
## [67] "FrequencySeriesBodyGyro_meanFreq_X"                
## [68] "FrequencySeriesBodyGyro_meanFreq_Y"                
## [69] "FrequencySeriesBodyGyro_meanFreq_Z"                
## [70] "FrequencySeriesBodyAccMagnitude_mean"              
## [71] "FrequencySeriesBodyAccMagnitude_std"               
## [72] "FrequencySeriesBodyAccMagnitude_meanFreq"          
## [73] "FrequencySeriesBody_BodyAccJerkMagnitude_mean"     
## [74] "FrequencySeriesBody_BodyAccJerkMagnitude_std"      
## [75] "FrequencySeriesBody_BodyAccJerkMagnitude_meanFreq" 
## [76] "FrequencySeriesBody_BodyGyroMagnitude_mean"        
## [77] "FrequencySeriesBody_BodyGyroMagnitude_std"         
## [78] "FrequencySeriesBody_BodyGyroMagnitude_meanFreq"    
## [79] "FrequencySeriesBody_BodyGyroJerkMagnitude_mean"    
## [80] "FrequencySeriesBody_BodyGyroJerkMagnitude_std"     
## [81] "FrequencySeriesBody_BodyGyroJerkMagnitude_meanFreq"
```

### Measruement names difference from the original data set
-t and f denote the time series and frequency series.
-Mag was confusing as it could also be understood as magnetometer, so changed to magnitude
-Some elements have BodyBody, this is for the additional vecotrs for the angles.
-this is changed to body_body

