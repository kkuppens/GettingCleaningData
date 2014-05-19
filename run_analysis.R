# Script created as part of the Coursera "Getting and Cleaning Data" Project 
#    Output: TidyDataSet.txt ;file with tidy data set. 
# The script assumes to have the "UCI HAR Dataset" directory containing
# all the train data and test data within the users primary working directory. 
# The tidy data set will be stored in the file TidyDataSet.txt within an output
# directory "output" that will be created if not existent within 
# the "UCI HAR Dataset" directory.
#     result: ./UCI HAR Dataset/output/TidyDataSet.txt 
# More information to be found within the CodeBook.md and README.md 

################################################################################
# Step 1: Setup Environment
################################################################################
# Set work directory to UCI CHAR Dataset: wrk.dir
# Set train directory to train directory within work directory: trn.dir
# Set test directory to test directory within work directory: tst.dir
wrk.dir <- paste0(getwd(),"/UCI HAR Dataset")
trn.dir <- paste0(wrk.dir,"/train")
tst.dir <- paste0(wrk.dir,"/test")

################################################################################
# Step 2: Read all relevant test and training data
################################################################################
# Read all test data
tst.data <- read.table(paste0(tst.dir,"/X_test.txt"))
tst.y <- read.table(paste0(tst.dir,"/y_test.txt"))
tst.subject <- read.table(paste0(tst.dir,"/subject_test.txt"))
# Read all train data
trn.data <- read.table(paste0(trn.dir,"/X_train.txt"))
trn.y <- read.table(paste0(trn.dir,"/y_train.txt"))
trn.subject <- read.table(paste0(trn.dir,"/subject_train.txt"))
# Read labels and features
activity.labels <- read.table(paste0(wrk.dir,"/activity_labels.txt"))
features <- read.table(paste0(wrk.dir,"/features.txt"))

################################################################################
# Step 3: Assing proper descriptions to variables
################################################################################
# Use features information to assign proper descriptions in the data frames 
# replacing V1,V2,... 
header.names<-features$V2    #descriptions in column V2 of data frame features
# Additional cleanup of the descriptions, replacing "-" and "," with "."
# remove "(" and ")" and put everything in lowercase. 
# See google's R style guide
# https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
header.names <- gsub("\\-", ".", header.names)
header.names <- gsub("\\,", ".", header.names)
# Assign these cleaned-up descriptions to train and test tables
names(tst.data)<-header.names
names(trn.data)<-header.names
# Assign description to tables containing activity and subject information 
names(tst.y)<-"activity"
names(trn.y)<-"activity"
names(tst.subject)<-"subject"
names(trn.subject)<-"subject"

################################################################################
# Step 4: Use descriptive names for the activities
################################################################################
# Set names for activities within the test data
# Using logical vector for selecting and replacing number with activity name
tst.y$activity[(tst.y$activity==1)]<- "WALKING"
tst.y$activity[(tst.y$activity==2)]<- "WALKING_UPSTAIRS"
tst.y$activity[(tst.y$activity==3)]<- "WALKING_DOWNSTAIRS"
tst.y$activity[(tst.y$activity==4)]<- "SITTING"
tst.y$activity[(tst.y$activity==5)]<- "STANDING"
tst.y$activity[(tst.y$activity==6)]<- "LAYING"
# Set names for activities within the train data
trn.y$activity[(trn.y$activity==1)]<- "WALKING"
trn.y$activity[(trn.y$activity==2)]<- "WALKING_UPSTAIRS"
trn.y$activity[(trn.y$activity==3)]<- "WALKING_DOWNSTAIRS"
trn.y$activity[(trn.y$activity==4)]<- "SITTING"
trn.y$activity[(trn.y$activity==5)]<- "STANDING"
trn.y$activity[(trn.y$activity==6)]<- "LAYING"

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
# Final cleanup headers
################################################################################
# Use names/headers of the table to filter based on mean or std 
combined.header <-names(combined.data)
filter <-union(grep("mean()", c(combined.header)), grep("std()", 
                                                        c(combined.header)))
filter <- c(1,2,filter)
requested.data <-combined.data[,filter]
# Final cleanup headers: Remove brackets () and put all variables to lowercase
header.names <- names(requested.data)
header.names <- gsub("\\(", "", header.names)
header.names <- gsub("\\)", "", header.names)
header.names <- gsub("(\\w)(\\w*)","\\L\\1\\L\\2", header.names,perl=TRUE)
names(requested.data) <- header.names
# At this point we completed step 1-4 from the Project assignment
# requested.data being the first tidy data set 
  
################################################################################
# Step 8: Create independent tidy data set with the average of each variable 
# for each activity and each subject.  
################################################################################
# Using the aggregate function and dot notation to select all variables/features
mean.data <- aggregate(. ~ subject + activity,requested.data, mean)
   
################################################################################
# Step 9: Store second independent data set in file and output directory
################################################################################
# Create file ./UCI HAR Dataset/output/TidyDataSet.csv
output.dir <- paste(wrk.dir,"output",sep = "/")
if(!file.exists(output.dir)) { dir.create(output.dir)} 
output.file <- paste(output.dir,"TidyDataSet.txt" ,sep = "/")
#using tab delimited text file for upload to coursera
write.table(mean.data, output.file,sep = "\t",row.names = F)
