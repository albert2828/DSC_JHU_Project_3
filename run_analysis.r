library(dplyr)
library(reshape2)
library(stringr)

# Downloading the data sets
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/projectfile.zip", method = "curl")
unzip("./data/projectfile.zip", exdir = "./data")

# Loading data sets into the workspace
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")


# In the subject_train.txt file there are stated the subjects that made the observations, so subject
# column is aggregated

test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(test_subject,train_subject)[,1]

# 1- Merging data

raw <- rbind(test, train) # Data sets are combined this way since both have same type of information 
# in their columns.
raw <- select(raw, -(555:561)) # Last 6 columns are eliminated since are not needed

# Adding temporary names to raw columns
raw_names <- read.table("./data/UCI HAR Dataset/features.txt")[1:554,2]
names(raw) <- raw_names

# 2- Extracting the measurements on the mean an standard deviation

raw <- raw[,grep("mean|std", raw_names, value = T)]
raw <- data.frame(subject, raw)

rm("train_subject", "test_subject", "subject", "raw_names", "test", "train") # These objects are no longer needed


