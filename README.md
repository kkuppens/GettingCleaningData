##Coursera's "Getting and Cleaning Data" Project.
In this repository you will find:
 
###a) This README.md with: 
	Description of the project. 
	Additional information and decisions taken during the project. 
	Explanation of the run_analysis.R script.
###b) The CodeBook.md with:
	Data description: Raw Data, variables, variable descriptions and units.
	Data Transformations: actions for producing the first and second tidy data set. 
###c) The run_Analysis.R script:
	The actual script that when run in R or Rstudio will produce the tidy data sets using the raw data.


##1. Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1 a tidy data set as described below, 
2 a link to a Github repository with your script for performing the analysis, and 
3 a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

  1  Merges the training and the test sets to create one data set.
  2  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3  Uses descriptive activity names to name the activities in the data set
  4  Appropriately labels the data set with descriptive activity names. 
  5  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Good luck!


##2. Additional Remarks/Project Decisions

1. Script assumes to have the "UCI HAR Dataset" directory within the primary working directory. (see getwd())
2. Used google's R style guide (https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml) 
as naming convention for variables, function names, ...
3. Not all data available will be loaded into R. 
Namely the Inertial Signals information has been disregarded because none contains information 
related to the requested mean or standard deviation.
4. Some functions to highlight.
The gsub() function used to cleanup some of the header information.
The grep() function used to filter the data to the requested mean and std variables.
The aggregate() function used in combination with mean() and the dot notition (apply to all features) for calculating the requested averages.
5. For the second data set decided to first aggregate by subject and then by activity. 
In case it's prefered to aggregate first by activity and then by subject it's sufficient to change the order of
activity and subject in the aggregate function like this aggregate(. ~ activity + subject,requested.data, mean)
6. The second tidy data set will be stored in a tab delimited text file called "TidyDataSet.txt" within an output
directory from "UCI HAR Dataset". The script will check for existens of the output directory and create if not existent.
File location: "./UCI HAR Dataset/output/TidyDataSet.txt".
Coursera allows you to upload the data file into a .txt format. For this reason decided to write to a tab delimited text file. 

##3. R Script - run_analysis.R


You can run this scrip from within R or Rstudio given that the data for the project is within the primary working directory.
The script has been broken down into several steps, step 1 to 9. You can select the required steps from the script and run from within R/RStudio. In order to obtain the first tidy data set it's sufficient to run step 1 to step 7. For obtaining the second tidy set you will also need to run step 8. The final step, step 9, writes the second tidy data set into a tab delimited text file within the "UCI HAR Dataset/output" directory. 

####Step 1: Setup Environment
Sets variables to the raw data locations to be read into R.
####Step 2: Read all relevant test and training data
Reads the relevant test and training data into R data variables. 
####Step 3: Assing proper descriptions to variables
Use information from the project to assign proper descriptions to the variables.
The features.txt information will be used for assigning better descriptions for the features data set headers.
"activity" and "subject" used as description for the activity vs subject dataset.
Additional cleanup of the descriptions, replace "-" with "." according Google's R style guide. (See additional Remark section) 
####Step 4: Use descriptive names for the activities
Use activity_labels.txt information to label the activities within the activity data sets.
e.g. put/display value WALKING rather than value 1.
####Step 5: Combine all test resp. train data
The activity, subject and features information is in different data sets. Combined these sets to obtain one set containing all information for resp. train and test. Used cbind() function to paste the three datasets together for resp. test and train data. 
####Step 6: Merge both the test and train data
Merged both the test and train data within one data set. 
Used rbind() to copy/paste the rows from the train set under the data from test set. 
####Step 7: Select only features related to mean or standard deviation
The first requested tidy data set needed to contain only the features related to mean and standard deviation. 
Used the heading information "names()" and filtered using "grep()" to obtain only the requested variables. 
Used the set of filtered variables again to select only the required variables from the data set.
####Step 8: Create independent tidy data set with the average of each variable
Used the aggregate() function in combination with mean and dot notation (for all features) to obtain the second requested tidy
data set. In case it's prefered to aggregate first by activity and then by subject it's sufficient to change the order of
activity and subject in the aggregate function like this aggregate(. ~ activity + subject,requested.data, mean) 
####Step 9: Store second independent data set in file and output directory
The tidy data set will be stored in the file TidyDataSet.txt within an output
directory "output" that will be created if not existent within the "UCI HAR Dataset" directory.
File location: ./UCI HAR Dataset/output/TidyDataSet.txt.



