# CodeBook

### Description of variables
#### subject  
Type: Factor  
Levels: 1:30  
Description: Subject id  
  
#### activityName  
Type: Factor  
Levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS  
Description: Name of activity  

#### timeBodyAcc.X.mean - freqBodyBodyGyroJerkMag.std  
Type: Numeric, normalized and bounded within [-1, 1]  
Description:
The variables are described as a group (for complete list of all variable names, see further down).  

**prefix**  
time: time domain signals  
freq: frequency domain signals

**feature description**  
BodyGyro: body gyro signals  
BodyAcc: body acceleration signals    
GravAcc: gravity acceleration signals    
BodyAccJerk: body linear acceleration   
BodyGyroJerk: body angular velocity  
The above variables are provided one for each direction: [feature description].X, .Y, .Z  
For each of the above also the magnitude of the three-dimensional signals: [feature description]**Mag**  

**measures**  
.mean: average of the mean values in the raw data per subject and activity  
.std: average of the standard deviations in the raw data per subject and activity  

Additional information about the raw data can be found in the readme-file contained in the zip-directory (downloaded in the script run_analysis.R)

### A complete list of all variables
subject  
activityName  
timeBodyAcc.X.mean             
timeBodyAcc.Y.mean   
timeBodyAcc.Z.mean        
timeBodyAcc.X.std           
timeBodyAcc.Y.std              
timeBodyAcc.Z.std      
timeGravityAcc.X.mean  
timeGravityAcc.Y.mean      
timeGravityAcc.Z.mean  
timeGravityAcc.X.std      
timeGravityAcc.Y.std  
timeGravityAcc.Z.std    
timeBodyAccJerk.X.mean  
timeBodyAccJerk.Y.mean  
timeBodyAccJerk.Z.mean  
timeBodyAccJerk.X.std  
timeBodyAccJerk.Y.std  
timeBodyAccJerk.Z.std  
timeBodyGyro.X.mean  
timeBodyGyro.Y.mean  
timeBodyGyro.Z.mean  
timeBodyGyro.X.std  
timeBodyGyro.Y.std  
timeBodyGyro.Z.std  
timeBodyGyroJerk.X.mean  
timeBodyGyroJerk.Y.mean  
timeBodyGyroJerk.Z.mean  
timeBodyGyroJerk.X.std  
timeBodyGyroJerk.Y.std  
timeBodyGyroJerk.Z.std  
timeBodyAccMag.mean  
timeBodyAccMag.std  
timeGravityAccMag.mean  
timeGravityAccMag.std  
timeBodyAccJerkMag.mean  
timeBodyAccJerkMag.std  
timeBodyGyroMag.mean  
timeBodyGyroMag.std  
timeBodyGyroJerkMag.mean  
timeBodyGyroJerkMag.std  
freqBodyAcc.X.mean  
freqBodyAcc.Y.mean  
freqBodyAcc.Z.mean  
freqBodyAcc.X.std  
freqBodyAcc.Y.std  
freqBodyAcc.Z.std  
freqBodyAccJerk.X.mean  
freqBodyAccJerk.Y.mean        
freqBodyAccJerk.Z.mean  
freqBodyAccJerk.X.std         
freqBodyAccJerk.Y.std  
freqBodyAccJerk.Z.std         
freqBodyGyro.X.mean  
freqBodyGyro.Y.mean           
freqBodyGyro.Z.mean  
freqBodyGyro.X.std          
freqBodyGyro.Y.std  
freqBodyGyro.Z.std    
freqBodyAccMag.mean  
freqBodyAccMag.std            
freqBodyAccJerkMag.mean  
freqBodyAccJerkMag.std  
freqBodyGyroMag.mean  
freqBodyGyroMag.std     
freqBodyGyroJerkMag.mean  
freqBodyGyroJerkMag.std  