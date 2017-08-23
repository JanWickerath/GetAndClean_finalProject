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

