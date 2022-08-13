# Smart-Watch-Sensor-Data

Read, merge, filter, process and sumarize smart watch sensor data according to the tidy format

***

### Objective

The run_analysis script was writen to read data from .txt files, merge, transform and summarize statistics about an recorded experiment of human activities measure by smart watch sensors to retrive metrics like gravity and acelleration summarization on a tidy format.

obs: The train data is to large to upload to github so the link of the data repository is:

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

***

### Steps

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

***

### Results

The tidy_data.txt file is provided in the repo containing the summarization results from task 5.

The final tidy data .txt file contains only 5 columns:

 - 3 index columns for subject of the study, activity registered and type of metric retrieved

 - 2 value columns contain the mean of the mean for the metrics and the of standard deviations for the metric
 
 ***
 
 ### Conclusion:
 
 - This data wrangling pipeline could be considered tidy because it facilitates compare metrics user and activities using descriptive, analytical and modeling frameworks

***
