# Getting_and_Cleaning_Data

This is the result of the Programming assignment of the Course "Getting and Cleaning Data". We had to obtain and process data from this project: 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to create an R script that does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average 
       of each variable for each activity and each subject.

The script run_analysis.R does this -including downloading and uncompressing the data files- and outputs the result to a variable called final_data. 

The comments in the script help to understand the underlying sequence.

Download the final_data.zip file and uncompress it before using read.table to load it into R.


  
