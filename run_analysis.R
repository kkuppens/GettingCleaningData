# Script created as part of the Coursera "Getting and Cleaning Data" Project 
#    Output: TidyDataSet.csv, file with tidy data set. 
# The script assumes to have the "UCI HAR Dataset" directory containing
# all the train data and test data withing the users primary working directory. 
# The tidy data set will be stored in the file TidyDataSet.csv within an output
# directory "output" that will be created if not existent within 
# the "UCI HAR Dataset" directory.
#     result: ./UCI HAR Dataset/output/TidyDataSet.csv 
# More information to be found within the CodeBook.md and README.md 

################################################################################
# Step 1: Setup Environment
################################################################################
# set work directory to UCI CHAR Dataset: wrk.dir
# set train directory to train directory within work directory: trn.dir
# set test directory to test directory within work directory: tst.dir
wrk.dir <- paste(getwd(),"UCI HAR Dataset",sep = "/")
trn.dir <- paste(wrk.dir,"train/",sep="/")
tst.dir <- paste(wrk.dir,"test/",sep="/")

################################################################################
# Step 2: Read all relevant test and training data
################################################################################
# Read all test data
tst.data <- read.table(paste(tst.dir,"/X_test.txt",sep="/"))
tst.y <- read.table(paste(tst.dir,"/y_test.txt",sep="/"))
tst.subject <- read.table(paste(tst.dir,"/subject_test.txt",sep="/"))
# Read all train data
trn.data <- read.table(paste(trn.dir,"/X_train.txt",sep="/"))
trn.y <- read.table(paste(trn.dir,"/y_train.txt",sep="/"))
trn.subject <- read.table(paste(trn.dir,"/subject_train.txt",sep="/"))
# Read labels and features
activity.labels <- read.table(paste(wrk.dir,"/activity_labels.txt",sep="/"))
features <- read.table(paste(wrk.dir,"/features.txt",sep="/"))

################################################################################
# Step 3: Assing proper descriptions to variables
################################################################################
# Use features informatio to assign proper descriptions in the dataframes 
# replacing V1,V2,... 
header.names<-features$V2    #descriptions in column V2 of dataframe features
# Do some further cleanup of the descriptions, replace "-" with "." character
# See google's R style guide
# https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
header.names <- gsub("\\-", ".", header.names)
# Assign these cleaned-up descriptions to train and test tables
names(tst.data)<-header.names
names(trn.data)<-header.names
# Assigning description to tables containing activity and subject information 
names(tst.y)<-"activity"
names(trn.y)<-"activity"
names(tst.subject)<-"subject"
names(trn.subject)<-"subject"

################################################################################
# Step 4: Use descriptive names for the activities
################################################################################
# Using "which" command but also gsub would have been an alternative
# Set names for activities within the test data
tst.y$activity[which(tst.y$activity==1)]<- "WALKING"
tst.y$activity[which(tst.y$activity==2)]<- "WALKING_UPSTAIRS"
tst.y$activity[which(tst.y$activity==3)]<- "WALKING_DOWNSTAIRS"
tst.y$activity[which(tst.y$activity==4)]<- "SITTING"
tst.y$activity[which(tst.y$activity==5)]<- "STANDING"
tst.y$activity[which(tst.y$activity==6)]<- "LAYING"
# Set names for activities within the train data
trn.y$activity[which(trn.y$activity==1)]<- "WALKING"
trn.y$activity[which(trn.y$activity==2)]<- "WALKING_UPSTAIRS"
trn.y$activity[which(trn.y$activity==3)]<- "WALKING_DOWNSTAIRS"
trn.y$activity[which(trn.y$activity==4)]<- "SITTING"
trn.y$activity[which(trn.y$activity==5)]<- "STANDING"
trn.y$activity[which(trn.y$activity==6)]<- "LAYING"

################################################################################
# Step 5: Combine all test resp. train data
################################################################################
# Combine subject, activity and all feature information 
all.tstdata<-cbind(tst.subject, tst.y, tst.data)
all.trndata<-cbind(trn.subject, trn.y, trn.data)

################################################################################
# Step 6: Merge both the test and train data
################################################################################
# Both data sets have exact same header, used rbind to "merge" together 
combined.data<- rbind(all.tstdata, all.trndata)

################################################################################
# Step 7: Select only features related to mean or standard deviation
################################################################################
# Use names/headers of the table to filter based on mean or std 
combined.header <-names(combined.data)
filter <-union(grep("mean()", c(combined.header)), grep("std()", 
                                                        c(combined.header)))
filter <- c(1,2,filter)
requested.data <-combined.data[,filter]
# At this point we completed step 1-4 from the Project assignment
# requested.data being the first tidy data set 
  
################################################################################
# Step 8: Create independent tidy data set with the average of each variable 
################################################################################
# for each activity and each subject.  
# Using the aggregate function and dot notation to select all variables/features
mean.data <- aggregate(. ~ activity + subject,requested.data, mean)
   
################################################################################
# Step 9: Store second independent data set in file and output directory
################################################################################
output.dir <- paste(wrk.dir,"output",sep = "/")
if(!file.exists(output.dir)) { dir.create(output.dir)} 
output.file <- paste(output.dir,"TidyDataSet.csv" ,sep = "/")
write.csv(mean.data, output.file,row.names = F)
