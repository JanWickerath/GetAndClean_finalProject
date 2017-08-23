library("dplyr")

## Step 1: Merge Test and Train dataset together
# Read in test dataset and add id and activity label columns
test.df <- read.table("./data/test/X_test.txt") %>%
    as_tibble %>%
    mutate(
        id = read.table("./data/test/subject_test.txt")$V1,
        act_label = read.table("./data/test/y_test.txt")$V1
    )

# Read in train dataset and add id and activity label columns
train.df <- read.table("./data/train/X_train.txt") %>%
    as_tibble %>%
    mutate(
        id = read.table("./data/train/subject_train.txt")$V1,
        act_label = read.table("./data/train/y_train.txt")$V1
    )

# Bind the two datasets together
mergedDF <- rbind(test.df, train.df)

## Step 2: Extract only the measurment on mean and standard deviation

# First use *features.txt* to get column names that can be used to identify mean
# and std values.
features <- read.table("./data/features.txt")$V2

# Select the columns with mean and standard deviation values from mergedDF
mergedSel <- select(mergedDF, id, act_label, grep("mean\\(\\)|std\\(\\)", features))

## Step 3: Use descriptive activity names to name the activities in the data set
# Import activity labels as a lookup table
lookup_tab <- as_tibble(read.table("./data/activity_labels.txt"))
names(lookup_tab) <- c("act_label", "act_name")
mergedSel <- merge(mergedSel, lookup_tab, by = "act_label") %>% 
    select(-act_label)

## Step 4: Appropriately label the data set with descriptive variable names
nice_names <- gsub(
    "[(\\(\\)) -]", "", 
    as.character(features[grep("mean\\(\\)|std\\(\\)", features)])
    )
names(mergedSel) <- c(
    "id", nice_names, "act_name"
    )

## Step 5: From the data set in step 4, creates a second, independent tidy
## data set with the average of each variable for each activity and each
## subject.
tidy.df <- group_by(mergedSel, id, act_name) %>%
    summarise_all(mean)

## Store tidy dataset as .csv file
write.csv(tidy.df, file = "tidy_data.csv", row.names = FALSE)
