library("dplyr")

test.df <- read.table("./data/test/X_test.txt") %>%
    as_tibble #%>%

names(test.df) <- read.table("./data/features.txt")$V2

train.df <- read.table("./data/train/X_train.txt") %>%
    as_tibble
    
