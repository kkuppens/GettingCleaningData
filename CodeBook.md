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

###activity
Activity label with possible values; WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING.

###subject
An identifier of the subject who carried out the experiment; 1..30.

###features
All remaining variables (features) within the tidy data set, besides activity and subject, are estimated variables from signals. 

There are two types within the tidy data set: mean and standard deviation (std).
For each type there are two units. The variables starting with the letter t, e.g "tBodyAcc.mean().X" being time domain signals.
The variables starting with the letter f, e.g "fBodyAccMag.std()" being frequency domain signals. To be more precise the mean and standard deviation from a time and frequency domain signal.

###Tidy data set variable list

 
[1] "subject"                       "activity"                      "tbodyacc.mean.x"              
 [4] "tbodyacc.mean.y"               "tbodyacc.mean.z"               "tgravityacc.mean.x"           
 [7] "tgravityacc.mean.y"            "tgravityacc.mean.z"            "tbodyaccjerk.mean.x"          
[10] "tbodyaccjerk.mean.y"           "tbodyaccjerk.mean.z"           "tbodygyro.mean.x"             
[13] "tbodygyro.mean.y"              "tbodygyro.mean.z"              "tbodygyrojerk.mean.x"         
[16] "tbodygyrojerk.mean.y"          "tbodygyrojerk.mean.z"          "tbodyaccmag.mean"             
[19] "tgravityaccmag.mean"           "tbodyaccjerkmag.mean"          "tbodygyromag.mean"            
[22] "tbodygyrojerkmag.mean"         "fbodyacc.mean.x"               "fbodyacc.mean.y"              
[25] "fbodyacc.mean.z"               "fbodyacc.meanfreq.x"           "fbodyacc.meanfreq.y"          
[28] "fbodyacc.meanfreq.z"           "fbodyaccjerk.mean.x"           "fbodyaccjerk.mean.y"          
[31] "fbodyaccjerk.mean.z"           "fbodyaccjerk.meanfreq.x"       "fbodyaccjerk.meanfreq.y"      
[34] "fbodyaccjerk.meanfreq.z"       "fbodygyro.mean.x"              "fbodygyro.mean.y"             
[37] "fbodygyro.mean.z"              "fbodygyro.meanfreq.x"          "fbodygyro.meanfreq.y"         
[40] "fbodygyro.meanfreq.z"          "fbodyaccmag.mean"              "fbodyaccmag.meanfreq"         
[43] "fbodybodyaccjerkmag.mean"      "fbodybodyaccjerkmag.meanfreq"  "fbodybodygyromag.mean"        
[46] "fbodybodygyromag.meanfreq"     "fbodybodygyrojerkmag.mean"     "fbodybodygyrojerkmag.meanfreq"
[49] "tbodyacc.std.x"                "tbodyacc.std.y"                "tbodyacc.std.z"               
[52] "tgravityacc.std.x"             "tgravityacc.std.y"             "tgravityacc.std.z"            
[55] "tbodyaccjerk.std.x"            "tbodyaccjerk.std.y"            "tbodyaccjerk.std.z"           
[58] "tbodygyro.std.x"               "tbodygyro.std.y"               "tbodygyro.std.z"              
[61] "tbodygyrojerk.std.x"           "tbodygyrojerk.std.y"           "tbodygyrojerk.std.z"          
[64] "tbodyaccmag.std"               "tgravityaccmag.std"            "tbodyaccjerkmag.std"          
[67] "tbodygyromag.std"              "tbodygyrojerkmag.std"          "fbodyacc.std.x"               
[70] "fbodyacc.std.y"                "fbodyacc.std.z"                "fbodyaccjerk.std.x"           
[73] "fbodyaccjerk.std.y"            "fbodyaccjerk.std.z"            "fbodygyro.std.x"              
[76] "fbodygyro.std.y"               "fbodygyro.std.z"               "fbodyaccmag.std"              
[79] "fbodybodyaccjerkmag.std"       "fbodybodygyromag.std"          "fbodybodygyrojerkmag.std" 

Data Transformations
===================

The data transformation part is coresponding to step 3 to 8 within the run_analysis.R script. 
I will not describe the steps here involving setting up the environment, reading and writing the data.

### 1: Assign proper descriptions to variables.

Ones all data being read into R from the raw data, give the 3 data sets related to activiy, subject and features a
more descriptive heading. For a more descriptive heading for the features set used the information from the file "features.txt".
For the activity and subject data set used simply the "activity" and "subject" description itself. 
Changed furthermore the "-" character with "." in the features heading according google's R style guide. (See README.md)

### 2: Use descriptive names for the activities.

Used information from "activity_labels.txt" to add more descriptive name for the activities. 
e.g. put/display value WALKING rather than value 1.

### 3: Combine all test resp. train data.

The activity, subject and features information is in different data sets. Combined these sets to obtain one set containing all information for resp. train and test.

### 4: Merge both the test and train data.

Merged both the test and train data within one data set. 

### 5: Select only features related to mean or standard deviation.

The first requested tidy data set needed to contain only the features related to mean and standard deviation. 
Used the heading information "names()" and filtered using "grep()" to obtain only the requested variables. 
Used the set of filtered variables again to select only the required variables from the data set.
Removed brackets "(" and ")" and put all variables in lower case. See Google's R style guide above.

### 6: Create independent tidy data set with the average of each variable or each activity and each subject.

Used the aggregate() function in combination with mean and dot notation (for all features) to obtain the second requested tidy
data set.  


  
  

  
 

 
