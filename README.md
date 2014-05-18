This repository has been created as part of the Coursera's course Getting and Cleaning Data Project.
In this repository you will find:
 
###This README.md with: 
	Description of the project. 
	Additional information and decisions taken during the project. 
	Explanation of the run_analysis.R script.
###The CodeBook.md with:
	Data description: Raw Data, variables, variable descriptions and units.
	Data Transformations: actions for producing the first and second tidy data set. 
###The run_Analysis.R script:
	The actual script that when run in R or Rstudio will produce the tidy data sets using the raw data.


##Project Description

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


## Additional Remarks/Project Decisions

1. Script assumes to have the "UCI HAR Dataset" directory within the primary working directory. (see getwd())
2. Used google's R style guide (https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml) 
as naming convention for variables, function names, ...
3. Not all data available will be loaded into R. 
Namely the Inertial Signals information has been disregarded because none contains information 
related to the requested mean or standard deviation.
4. Some functions to highlight.
4.1 gsub() to cleanup some of the header information.
4.2 grep() to filter the data to the requested mean and std variables.
4.3 The aggregate() function in combination with mean() and the dot notition (apply to all features).
5. For the second data set decided to first aggregate by subject and then by activity. 
In case it's prefered to aggregate first by activity and then by subject it's sufficient to change the order of
activity and subject in the aggregate function like this aggregate(. ~ activity + subject,requested.data, mean)
6. The second tiday data set will be stored in a tab delimited text file called "TidyDataSet.txt" within an output
directory from "UCI HAR Dataset"
The script will check for existens of the output directory and create if not existent.
location of the file: "./UCI HAR Dataset/output/TidyDataSet.txt" 

## R Script - run_analysis.R


To be posted here


