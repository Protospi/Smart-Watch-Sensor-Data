################################################################################################

# Script for Data Analysis of smart watch data from Jonh Hopkins Data Science Course

################################################################################################

# Load packages
library(tidyverse)

################################################################################################

# Read data frames
features <- read.table("data/features.txt", col.names = c("n","functions"))
dim(features)
activities <- read.table("data/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("data/test/subject_test.txt", col.names = "subject")
x_test <- read.table("data/test/X_test.txt", col.names = features$functions)
dim(x_test)
y_test <- read.table("data/test/y_test.txt", col.names = "code")
subject_train <- read.table("data/train/subject_train.txt", col.names = "subject")
x_train <- read.table("data/train/X_train.txt", col.names = features$functions)
dim(x_train)
y_train <- read.table("data/train/y_train.txt", col.names = "code")
dim(y_train)

################################################################################################

# 1 - Merges the training and the test sets to create one data set.

################################################################################################

# Merge the train test and subject data frames
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
df1 <- cbind(subject, Y, X)
dim(df1)

################################################################################################

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

################################################################################################

# Define data frame with only mean and sd
df2 <- df1 %>% select(subject, code, contains("mean"), contains("std"))
dim(df2)

################################################################################################

# 3 - Uses descriptive activity names to name the activities in the data set

################################################################################################

# Transform code from numeric to categories
df2$code <- activities[df2$code, 2]

################################################################################################

# 4 Appropriately labels the data set with descriptive variable names.

################################################################################################

# Rename Coluns
names(df2)[2] = "activity"
names(df2) <- gsub("Acc", "accelerometer", names(df2))
names(df2) <- gsub("Gyro", "gyroscope", names(df2))
names(df2) <- gsub("BodyBody", "body", names(df2))
names(df2) <- gsub("Mag", "magnitude", names(df2))
names(df2) <- gsub("^t", "time", names(df2))
names(df2) <- gsub("^f", "frequency", names(df2))
names(df2) <- gsub("tBody", "timeBody", names(df2))
names(df2) <- gsub("-mean()", "mean", names(df2), ignore.case = TRUE)
names(df2) <- gsub("-std()", "std", names(df2), ignore.case = TRUE)
names(df2) <- gsub("-freq()", "frequency", names(df2), ignore.case = TRUE)
names(df2) <- tolower(names(df2))
names(df2) <- str_replace_all(names(df2), pattern = "\\.+", "_" )
names(df2) <- str_replace_all(names(df2), pattern = "_$", "")

################################################################################################

# 5 - From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.

################################################################################################

# Final step
df5 <- df2 %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Inpect data
dim(df5)
str(df5)

# Write final file
write.table(df5, "tidy_data.txt", row.name=FALSE)

################################################################################################

