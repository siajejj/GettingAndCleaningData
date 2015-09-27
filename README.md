---
title: "GettingAndCleaningData"
output: html_document
---
Repository for Getting and Cleaning Data Course Project

### Description
The goal of the project is to prepare tidy data that can be used for later analysis.
The data used represent data collected from the accelerometers from the
Samsung Galaxy S smartphone.  
The script run_analysis.R downloads the data and creates a tidy dataset, as described further down.
Also provided is the CodeBook.md - a description of the variables in the dataset "tidyData.txt" created by the run_analysis.R  

### R-versions
Created with: R-studio v 0.98.1091/ R v 3.1.2  
    
### Dependencies
The following packages are needed: stringr, reshape2, plyr

### Outline

* **Download data**  
Downloads the data and unzips it in a subdirectory called "Data". The directory
will be created if it does not already exist.

* **Step 1: Merges the training and the test sets to create one data set**  
To create training and test data sets we will need to combine the measurement 
data set (X_train.txt/X_test.txt) with labels (Y_train.txt/Y_test.txt) and 
subject id (subject_train.txt/subject_test.txt).
The function "readData" reads the three files for train/test respectively and merges them to one file each (train/test).  
The dataframes are stacked to a common dataframe, "allData", with rbind.  

* **Step 2: Extract only the measurements on mean and standard deviation for each 
measurement**  
The variable names is found in the file features.txt. Variable names containing
 "mean()" and "std()" are selected. A vector of the corresponding variable numbers, selectedVariables, is created. This is used to select the relevent columns from  "allData" into the new dataframe "selectedData".   
Note: meanFreq() is not included since this is specified as "weighted
average of the frequency components to obtain a mean frequency" and
is ruled to be out of scope for this assignment.  


* **Step 3: Name the activities in the data set with descriptive names**  
Activity labels are provided in the file activity_labels.txt.
The activity names provided in the file are deemed to be descriptive and is joined to the dataframe "selectedData". The column "activity" is dropped since it provides no additional information compared to "activityName".  

* **Step 4: Appropriately labels the data set with descriptive variable names**  
Creates descriptive variable names from the features dataframe, by splitting 
them up, modifying them and putting it back together.  
    + Extracts feature name and make wording more explicit  
    + Extracts measurement (standard deviation and mean)  
    + Extracts direction (X/Y/Z)  
    + Creates variable name as [feature name].[direction].[measurement] (or [feature name].[measurement] for magnitude variables where direction is not applicable)    
  

* **Step 5: Create tidy data set: averages of each variable per activity/subject**  
Creates averages of each variable per activity and subject with ddply/colmeans function.
Saves the tidy data set as a txt-file.


