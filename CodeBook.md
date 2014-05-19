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

 
	[1] "subject"                       "activity"                     
	[3] "tbodyacc.mean.x"               "tbodyacc.mean.y"              
	[5] "tbodyacc.mean.z"               "tgravityacc.mean.x"           
	[7] "tgravityacc.mean.y"            "tgravityacc.mean.z"           
	[9] "tbodyaccjerk.mean.x"           "tbodyaccjerk.mean.y"          
	[11] "tbodyaccjerk.mean.z"           "tbodygyro.mean.x"             
	[13] "tbodygyro.mean.y"              "tbodygyro.mean.z"             
	[15] "tbodygyrojerk.mean.x"          "tbodygyrojerk.mean.y"         
	[17] "tbodygyrojerk.mean.z"          "tbodyaccmag.mean"             
	[19] "tgravityaccmag.mean"           "tbodyaccjerkmag.mean"         
	[21] "tbodygyromag.mean"             "tbodygyrojerkmag.mean"        
	[23] "fbodyacc.mean.x"               "fbodyacc.mean.y"            	  
	[25] "fbodyacc.mean.z"               "fbodyacc.meanfreq.x"          
	[27] "fbodyacc.meanfreq.y"           "fbodyacc.meanfreq.z"          
	[29] "fbodyaccjerk.mean.x"           "fbodyaccjerk.mean.y"          
	[31] "fbodyaccjerk.mean.z"           "fbodyaccjerk.meanfreq.x"      
	[33] "fbodyaccjerk.meanfreq.y"       "fbodyaccjerk.meanfreq.z"      
	[35] "fbodygyro.mean.x"              "fbodygyro.mean.y"             
	[37] "fbodygyro.mean.z"              "fbodygyro.meanfreq.x"         
	[39] "fbodygyro.meanfreq.y"          "fbodygyro.meanfreq.z"         
	[41] "fbodyaccmag.mean"              "fbodyaccmag.meanfreq"         
	[43] "fbodybodyaccjerkmag.mean"      "fbodybodyaccjerkmag.meanfreq" 
	[45] "fbodybodygyromag.mean"         "fbodybodygyromag.meanfreq"    
	[47] "fbodybodygyrojerkmag.mean"     "fbodybodygyrojerkmag.meanfreq"
	[49] "tbodyacc.std.x"                "tbodyacc.std.y"               
	[51] "tbodyacc.std.z"                "tgravityacc.std.x"            
	[53] "tgravityacc.std.y"             "tgravityacc.std.z"            
	[55] "tbodyaccjerk.std.x"            "tbodyaccjerk.std.y"           
	[57] "tbodyaccjerk.std.z"            "tbodygyro.std.x"              
	[59] "tbodygyro.std.y"               "tbodygyro.std.z"              
	[61] "tbodygyrojerk.std.x"           "tbodygyrojerk.std.y"          
	[63] "tbodygyrojerk.std.z"           "tbodyaccmag.std"              
	[65] "tgravityaccmag.std"            "tbodyaccjerkmag.std"          
	[67] "tbodygyromag.std"              "tbodygyrojerkmag.std"         
	[69] "fbodyacc.std.x"                "fbodyacc.std.y"               
	[71] "fbodyacc.std.z"                "fbodyaccjerk.std.x"           
	[73] "fbodyaccjerk.std.y"            "fbodyaccjerk.std.z"           
	[75] "fbodygyro.std.x"               "fbodygyro.std.y"              
	[77] "fbodygyro.std.z"               "fbodyaccmag.std"              
	[79] "fbodybodyaccjerkmag.std"       "fbodybodygyromag.std"         
	[81] "fbodybodygyrojerkmag.std"     


Data Transformations
===================

The data transformation part is coresponding to step 3 to 8 within the run_analysis.R script. 
I will not describe the steps here involving setting up the environment, reading and writing the data.

### 1: Assign proper descriptions to variables.

Ones all data being read into R from the raw data, give the 3 data sets related to activiy, subject and features a
more descriptive heading. For a more descriptive heading for the features set used the information from the file "features.txt".
For the activity and subject data set used simply the "activity" and "subject" description itself. 
Changed furthermore the features heading according google's R style guide. (See README.md)

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

### 6: Create independent tidy data set with the average of each variable or each activity and each subject.

Used the aggregate() function in combination with mean and dot notation (for all features) to obtain the second requested tidy
data set.  


  
  

  
 

 
