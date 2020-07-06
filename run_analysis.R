# Get and unzip the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "GTproject.zip")
unzip("GTproject.zip")
setwd("UCI HAR Dataset/")

# get the data from the different files into R
subject_train <- read.table("train/subject_train.txt")
Y_train <- read.table("train/Y_train.txt")
X_train <- read.table("train/X_train.txt")
subject_test <- read.table("test/subject_test.txt")
Y_test <- read.table("test/Y_test.txt")
X_test <- read.table("test/X_test.txt")

# build the complete train and test sets, matching the measurements with the subject and activity
train_data <- cbind(subject_train, Y_train,X_train)
test_data <- cbind(subject_test, Y_test,X_test)

# merge the test and train data
full_data <- rbind(train_data, test_data)

# replace the generic variable names with the ones provided by the source
variable_names <- read.table("features.txt")
names(full_data) <- c("subject", "activity", variable_names[,2])

# remove all the variables not related to mean or std
selection <- c(grep("mean", names(full_data)), grep("std", names(full_data)),grep("Mean", names(full_data)))
selection <- sort(selection)
selection <- c(1,2, selection)
sel_data <- full_data[, selection]

# replace the values for activity with a human-readable description
sel_data$activity <- recode(sel_data$activity, "1" ="WALKING", "2" = "WALKING-UPSTAIRS", "3" = "WALKING-DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING")

# group by subject and activity and then calculate the mean for each group
final_data <- summarize_all(group_by(sel_data, activity, subject), mean)

