# GetAndCleaningDataCourseraProject
The repository consists of the script run_analysis.R which reads from UCI HAR data set and creates a compressed tidydata.txt file along with a codebook.

To run the script, clone the repository and  copy paste the file run_analysis.R in the directory that has UCI HAR data folder form the original source. One and press Alt+ctrl+R.

The script sequentially reads test data and train data and merges the two data sets. It then names appropriately the activity_labels variable and then creates the subset form the combined data cantaining those variables which have mean and std in their names. Finally, the average of each measruement is taken subject wise as well as activity wise and the this compressed data is written in tidydata.txt file.

