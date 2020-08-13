library(stringr)
library(dplyr)
library(tidyr)

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
raw <- raw[,-grep("meanFreq",names(raw))] # These columns are eliminated since they have mean frequency measure which is no needed
raw <- data.frame(subject, raw)


# 4- Changing names to raw columns
names(raw) <- str_replace(names(raw), "\\.", " ")
names(raw) <- str_replace(names(raw), "\\...", " ")
names(raw) <- sub("tBodyAcc", "time body linear acceleration", names(raw))
names(raw) <- sub("tGravityAcc", "time gravity linear acceleration", names(raw))
names(raw) <- sub("tBodyGyro", "time body angular velocity", names(raw))
names(raw) <- sub("tGravityGyro", "time gravity angular velocity", names(raw))
names(raw) <- sub("fBodyAcc", "frequency body linear acceleration", names(raw))
names(raw) <- sub("fBodyGyro", "frequency angular velocity", names(raw))
names(raw) <- sub("accelerationJerk", "acceleration with jerk signal", names(raw))
names(raw) <- sub("accelerationMag", "acceleration magnitud", names(raw))
names(raw) <- sub("signalMag", "signal magnitud", names(raw))

# 5- Extracting mean of all measures

clean <- sapply(split(raw, subject), colMeans)
clean <- t(clean) #The result of previous code is a matrix with subjects as columns so the matrix is transposed
clean <- as.data.frame(clean)

# Tidying data set
subject_clean <- clean[,1]

clean_mean <- clean[,grep("mean", names(clean))]
clean_mean <- data.frame(subject_clean, clean_mean)
clean_std <- clean[,grep("std", names(clean))]
clean_std <- data.frame(subject_clean,clean_std)


# Renaming some variables
names(clean_mean) <- sub("mean.", "", names(clean_mean))
names(clean_mean) <- sub("X", "on the X axis", names(clean_mean))
names(clean_mean) <- sub("Y", "on the Y axis", names(clean_mean))
names(clean_mean) <- sub("Z", "on the Z axis", names(clean_mean))
names(clean_std) <- sub("std.", "", names(clean_std))
names(clean_std) <- sub("X", "on the X axis", names(clean_std))
names(clean_std) <- sub("Y", "on the Y axis", names(clean_std))
names(clean_std) <- sub("Z", "on the Z axis", names(clean_std))

clean_mean <- gather(clean_mean, feature, mean, -subject_clean)
clean_std <- gather(clean_std, feature, std, -subject_clean)

tidy <- bind_cols(clean_mean, clean_std) %>% 
      select(c(1,2,3,6)) %>% # bind_cols doubles some columns, so these are removed
      arrange(tidy[,1])

names(tidy) <- c("subject", "feature", "mean", "std")
tidy$feature <- str_replace_all(tidy$feature, "\\.", " ")



# Writing final file

write.table(tidy, file="Human_activiy_clean_ds.txt", row.names = FALSE)
