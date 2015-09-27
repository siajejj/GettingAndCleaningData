## Script name: run_analysis.R
## Created with: R-studio v 0.98.1091/ R v 3.1.2
## Dependencies: stringr, reshape2, plyr

## Load packages needed
libraries <- c("stringr", "reshape2", "plyr")
lapply(libraries, library, character.only = TRUE)
rm(libraries)

## Download data
if(!file.exists("./data")) {dir.create("./data")}
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
td <- tempdir()
tf <- tempfile(tmpdir=td, fileext=".zip")
download.file(zipUrl, tf, method = "curl")
unzip(tf, exdir = "./data", overwrite=TRUE)

## Step 1: Merges the training and the test sets to create one data set
# Function for reading data and combining datasets (train/test separately)
readData <- function(name) {
    tmp_X <- read.table(paste("data/UCI HAR Dataset/", name, "/X_", name, ".txt",
                              sep = ""))
    tmp_Y <- read.table(paste("data/UCI HAR Dataset/", name, "/Y_", name, ".txt",
                              sep = ""))
    names(tmp_Y) <- "activity"
    tmp_subject <- read.table(paste("data/UCI HAR Dataset/", name,
                                    "/subject_", name, ".txt", sep = ""))
    names(tmp_subject) <- "subject"
    cbind(tmp_subject, tmp_Y, tmp_X)
}
train <- readData(name = "train")
test <- readData(name = "test")

allData <- rbind(train, test)
allData$subject <- as.factor(allData$subject)

## Step 2: Extract only the measurements on mean and standard deviation
##         for each measurement
features <- read.table("data/UCI HAR Dataset/features.txt")
featuresSubset <- features[grepl("mean\\(\\)", features[, 2]) |
                               grepl("std\\(\\)", features[, 2]), ]
selectedVariables <- paste("V", featuresSubset$V1, sep = "")
selectedData <- allData[, c("subject", "activity", selectedVariables)]

## Step 3: Name the activities in the data set with descriptive names
## Activity labels are provided in the data set activity_labels.txt.
activities <- read.table(paste("data/UCI HAR Dataset/activity_labels.txt",
                               sep = ""))
names(activities) <- c("activity", "activityName")
selectedData <- join(activities,
                     selectedData,
                     by = "activity",
                     type = "right")

selectedData <- selectedData[, c("subject", "activityName", selectedVariables)]

## Step 4: Appropriately labels the data set with descriptive variable names
# Create descriptive variable names from the features data
# -- Extract feature name and make wording more explicit
featuresSubset$feature <- gsub( "-.*$", "", featuresSubset[, 2])
featuresSubset$feature  <- sub(pattern = "^t",
                                replacement = "time",
                                featuresSubset$feature)
featuresSubset$feature  <- sub(pattern = "^f",
                                replacement = "freq",
                                featuresSubset$feature)
featuresSubset$feature  <- sub(pattern = "BodyBody",
                               replacement = "Body",
                               fixed = TRUE,
                               featuresSubset$feature)

# -- Extract measurement (standard deviation and mean)
featuresSubset$measurement <- sub(pattern = "\\(\\)",
                                  replacement = "",
                                  x = regmatches(featuresSubset[, 2],
                                                 regexpr("[a-z]{3,4}\\(\\)",
                                                         featuresSubset[, 2],
                                                         perl=TRUE))
)

# -- Extract direction (X/Y/Z)
featuresSubset$direction <- sub(pattern = "\\)",
                                replacement = "",
                                str_sub(featuresSubset[, 2], -1))

# -- Concatinate to single variable name
variableNames <- sub(pattern = "\\.{2}",
                     replacement = "\\.",
                     paste(featuresSubset$feature,
                           featuresSubset$direction,
                           featuresSubset$measurement,
                           sep = "."
                     ))

names(selectedData) <- c("subject", "activityName", variableNames)

## Step 5: Create tidy data set: averages of each variable per activity/subject
tidyData <- ddply(selectedData,
                  .(subject, activityName),
                  colwise(mean))

write.table(tidyData, "tidyData.txt", row.name=FALSE)

