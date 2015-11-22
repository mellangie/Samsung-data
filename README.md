# Samsung-data

An R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The approach is as follows:

Download the dataset if not present (the task is not too clear on whether the data fies are in the subdirectory or not, so it's safer to force the structure by downloading a known set)
rbind two data files (x_test and x_train)
Take only std() and mean() features, subset the dataset (mean_and_std)
Load the activity labels, and replace indices with names. The approach used was adopted from http://stackoverflow.com/questions/22475400/r-replace-values-in-data-frame-using-lookup-table.
Combines the labels and the data set using cbind; doing that for both mean_and_std and X.
Using the X, calculating an aggregate using mean for averaging, averaging over activity and subject; then save the result to a file
