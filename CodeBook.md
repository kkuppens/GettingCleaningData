Data Description
===================
##Raw Data
A full description is available at the site where the data was obtained 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
You will find there besides the raw data itself Data Set information and Attribute Information. 
The data for the project can be found at location 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##Variables
A desciption and list of all features can be found in the files "features_info.txt" and "features.txt" to be found 
within the zip file containing the data set. Below a description and list for only the feature variables within the tidy data set. 

activity:  Activity label with possible values; WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING.

subject: An identifier of the subject who carried out the experiment; 1..30.

All remaining variables (features) within the tidy data set, besides activity and subject, are estimated variables from signals. 

There are two types within the tidy data set: mean and standard deviation (std).
For each type there are two units. The variables starting with an t, e.g "tBodyAcc.mean().X" being time domain signals.
The variables starting with an f, e.g "fBodyAccMag.std()" being frequency domain signals. To be more precise the mean and standard deviation
from a time and frequency domain signal.

 
	[1]  "activity"                        "subject"                        
	[3]  "tBodyAcc.mean().X"               "tBodyAcc.mean().Y"              
	[5]  "tBodyAcc.mean().Z"               "tGravityAcc.mean().X"           
	[7]  "tGravityAcc.mean().Y"            "tGravityAcc.mean().Z"           
	[9]  "tBodyAccJerk.mean().X"           "tBodyAccJerk.mean().Y"          
	[11] "tBodyAccJerk.mean().Z"           "tBodyGyro.mean().X"             
	[13] "tBodyGyro.mean().Y"              "tBodyGyro.mean().Z"             
	[15] "tBodyGyroJerk.mean().X"          "tBodyGyroJerk.mean().Y"         
	[17] "tBodyGyroJerk.mean().Z"          "tBodyAccMag.mean()"             
	[19] "tGravityAccMag.mean()"           "tBodyAccJerkMag.mean()"         
	[21] "tBodyGyroMag.mean()"             "tBodyGyroJerkMag.mean()"        
	[23] "fBodyAcc.mean().X"               "fBodyAcc.mean().Y"              
	[25] "fBodyAcc.mean().Z"               "fBodyAcc.meanFreq().X"          
	[27] "fBodyAcc.meanFreq().Y"           "fBodyAcc.meanFreq().Z"          
	[29] "fBodyAccJerk.mean().X"           "fBodyAccJerk.mean().Y"          
	[31] "fBodyAccJerk.mean().Z"           "fBodyAccJerk.meanFreq().X"      
	[33] "fBodyAccJerk.meanFreq().Y"       "fBodyAccJerk.meanFreq().Z"      
	[35] "fBodyGyro.mean().X"              "fBodyGyro.mean().Y"             
	[37] "fBodyGyro.mean().Z"              "fBodyGyro.meanFreq().X"         
	[39] "fBodyGyro.meanFreq().Y"          "fBodyGyro.meanFreq().Z"         
	[41] "fBodyAccMag.mean()"              "fBodyAccMag.meanFreq()"         
	[43] "fBodyBodyAccJerkMag.mean()"      "fBodyBodyAccJerkMag.meanFreq()" 
	[45] "fBodyBodyGyroMag.mean()"         "fBodyBodyGyroMag.meanFreq()"    
	[47] "fBodyBodyGyroJerkMag.mean()"     "fBodyBodyGyroJerkMag.meanFreq()"
	[49] "tBodyAcc.std().X"                "tBodyAcc.std().Y"               
	[51] "tBodyAcc.std().Z"                "tGravityAcc.std().X"            
	[53] "tGravityAcc.std().Y"             "tGravityAcc.std().Z"            
	[55] "tBodyAccJerk.std().X"            "tBodyAccJerk.std().Y"           
	[57] "tBodyAccJerk.std().Z"            "tBodyGyro.std().X"              
	[59] "tBodyGyro.std().Y"               "tBodyGyro.std().Z"              
	[61] "tBodyGyroJerk.std().X"           "tBodyGyroJerk.std().Y"          
	[63] "tBodyGyroJerk.std().Z"           "tBodyAccMag.std()"              
	[65] "tGravityAccMag.std()"            "tBodyAccJerkMag.std()"          
	[67] "tBodyGyroMag.std()"              "tBodyGyroJerkMag.std()"         
	[69] "fBodyAcc.std().X"                "fBodyAcc.std().Y"               
	[71] "fBodyAcc.std().Z"                "fBodyAccJerk.std().X"           
	[73] "fBodyAccJerk.std().Y"            "fBodyAccJerk.std().Z"           
	[75] "fBodyGyro.std().X"               "fBodyGyro.std().Y"              
	[77] "fBodyGyro.std().Z"               "fBodyAccMag.std()"              
	[79] "fBodyBodyAccJerkMag.std()"       "fBodyBodyGyroMag.std()"         
	[81] "fBodyBodyGyroJerkMag.std()"     

Data Transformations
===================

The data transformation part is coresponding to step 3 to 8 within the run_analysis.R script. 
I will not describe the steps here involving setting up the environment, reading and writing the data.

Step 1: Assign proper descriptions to variables.
Ones all data being read into R from the raw data, give the 3 data sets related to activiy, subject and features a
more descriptive heading. For a more descriptive heading for the features set used the information from the file "features.txt".
For the activity and subject data set used simply the "activity" and "subject" description itself. 
Changed furthermore the "-" character with "." in the features heading according google's R style guide. (See README.md)

Step 2: Use descriptive names for the activities.
Used information from "activity_labels.txt" to add more descriptive name for the activities. 
e.g. put/display value WALKING rather then value 1.

Step 3: Combine all test resp. train data.
The activity, subject and features information is in different data sets. Combined these sets to obtain one set containing all information for resp. train and test.

Step 4: Merge both the test and train data.
Merged both the test and train data within one data set. 

Step 5: Select only features related to mean or standard deviation.
The first requested tidy data set needed to contain only the features related to mean and standard deviation. 
Used the heading information "names()" and filtered using "grep()" to obtain only the requested variables. 
Used the set of filtered variables again to select only the required variables from the data set.

Step 5: Create independent tidy data set with the average of each variable or each activity and each subject.
Used the aggregate() function in combination with mean and dot notation to obtain the second requested tidy
data set.  


  
  

  
 

 
