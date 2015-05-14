# Code Book for the Coursera assignment. Course: Getting and cleaning data.

## Code book for "read_data.R" program.

The following steps are executed to read data in the read_data.R program.

- Read "UCI_HAR_Dataset/features.txt" and evaluate the columns in which "mean" appears. Use of str_detect from the stringr library is made.
- Read test data from the X_test and train data from the X_train programatically depending on the input to the read_data function.
- Evaluate the columns of each row by separating the big character into numeric values. Each column is separated by space or 2 spaces. This is used to distinguish different values. The functions str_split() and as.numeric() are used to achieve this.
- Save as data frame 1
- Read the Subject from the subject_train or subject_test .txt files. 
- No more processing is done to the subject data.
- Save as data frame 2.
- Read Activity from the y_test or y_train file. 
- Define character vector representing the descriptive meaning of the activity (in the raw data, it is specified as a number)
- Assign the correct character to the numerically specified activity type.
- Save as data frame 3.
- Combine data frames 1, 2 and 3 to get the table in its form.


## Code book for the "run_analysis.R" program
- Get test data by calling function "read_data.R"
- Get train data by calling function "read_data.R"
- Bind the two data frames by using "rbind"
- Evaluate number of levels in the factor variables of "Subject" and "Activity", n1 and n2
- Total number of rows of neat data will be n1 x n2.
- Split data by activity first
- Then split by subject for each split data, and evaluate the mean (average) for each of the subjects. This is achieved using multiple for loops.
- Create a data frame for the mean values per sunject per activity.
- Create a data frame for the subject. (sub)
- Create a data frame for the activity performed. (act)

- Merge the three data frames to get a tidy data set.