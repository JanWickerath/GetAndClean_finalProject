# GetAndClean_finalProject

## Step 1:

The first step of the script reads in test and training dataset from the
`X_test.txt` and `X_train.txt` files respectively and adds variables for
subject id (from `subject_test/train.txt`) and activity labels (from
`y_test/train.txt`). It then merges the two sets together using the `rbind()`
function, so that the train dataset will be placed just below the test dataset.

## Step 2:

The second step uses the provided names in `features.txt` to identify variable
names that include either *mean()* or *std()*. It then selects only columns at
these positions + id and activity labels and stores them in an intermediate
data frame.

## Step 3:

Step 3 first loads the table in `activity_labels.txt` as a lookup table and
renames the numerical value to *the same name that it has in the dataframe
created before*. Then the names can be added by merging the intermediate data
frame from above with the lookup table by the column that stores the numerical
value of the activity label.

## Step 4:

Use the naming list identified in step 2 as column names. The names are
slightly altered so that they do not include the special character "()" and "-"
anymore.

## Step 5:

Group the intermediate dataframe at the end of step 4 by subject id and
activity names and then use dplyr's `summarize_all()` function to get the means
for each subject on each activity.

As a last step the script writes the final dataframe to a file called
`tidy_data.csv`. The dataset can be read into R by the command
`read.table("tidy_data.csv", header=TRUE)`.