# Libraries

library( "qdap" )
library( "dplyr")

######################################################
#
# Variable section
#
######################################################

# Merge Variables: This variables will be used to store 
# data contained in the UCI HAR Dataset Files.

# l_x_test        <- as.list()
# l_x_train       <- as.list()
# l_features      <- as.list()
# l_subject_train <- as.list()
# l_subject_test  <- as.list()
# l_y_test        <- as.list()
# l_y_train       <- as.list()
# l_act_lab       <- as.list()
# l_y_merge       <- as.list()
# l_x_merge       <- as.list()
# l_subj_merge    <- as.list()

# Name variables: This variables hold the headers
# for the data sets

l_y_names    <- "Activity"
l_subj_names <- "Subject"
l_act_names  <- c("Index", "Label")

# Path Variables: This variables will store the path 
# to the data contained in the UCI HAR Dataset Files. 

l_x_test_path     <- "UCI HAR Dataset\\test\\X_test.txt"
l_x_train_path    <- "UCI HAR Dataset\\train\\X_train.txt"

l_features_path   <- "UCI HAR Dataset\\features.txt"

l_subj_train_path <- "UCI HAR Dataset\\train\\subject_train.txt"
l_subj_test_path  <- "UCI HAR Dataset\\test\\subject_test.txt"

l_y_test_path     <- "UCI HAR Dataset\\test\\y_test.txt"
l_y_train_path    <- "UCI HAR Dataset\\train\\y_train.txt"

l_act_lab_path    <- "UCI HAR Dataset\\activity_labels.txt"

# Pattern Variables: This variables store the regexps
# in order to set descriptive names for variables.

l_name_patterns <- c( "^t{1}","^f{1}","BodyBody","Body","Acc", "Gravity","Gyro", "Mag", "Jerk","-mean\\(\\)","-std\\(\\)"
                     , "-X","-Y", "-Z")
 

l_repl_patterns <- c( "Time", "Frequency","Body","Body ","Accelerator", "Gravity"
                    , "Gyroscope","Magnitude", "Jerk ", "Mean", "Standard Deviation"
                    , "X Dimension","Y Dimension", "Z Dimension" )

# dyplr variables: variables used to create new dataset

# l_groupings     <- as.tbl()
# l_new_dataset   <- as.data.frame()

# Other variables

l_mean_std_cols   <- as.integer()                 # To get std and mean cols indexes
l_mean_std_regexp <- '.*(std\\(\\)|mean\\(\\))$'  # Regex´used to get mean and std cols


#######################################################
#
# Body Section
#
#######################################################

# Read X testing data
l_x_test <- read.table( file   = l_x_test_path
                      , header = F
                      , sep    = "" )

# Read X training data
l_x_train <- read.table( file   = l_x_train_path
                       , header = F
                       , sep    = "" )

# Read Y training data
l_y_train <- read.table( file   = l_y_train_path
                       , header = F
                       , sep    = "")

# Read Y testing data
l_y_test <- read.table( file   = l_y_test_path
                       , header = F
                       , sep    = "")

# Read feature data
l_features <- read.table( file   = l_features_path
                        , header = F
                        , sep    = "" )

# Read subject train data
l_subj_train <- read.table( file   = l_subj_train_path
                          , header = F
                          , sep    = "" )


# Read subject test data
l_subj_test <- read.table( file   = l_subj_test_path
                         , header = F
                         , sep    = "" )

# Read activity labels
l_act_lab   <- read.table( file   = l_act_lab_path
                         , header = F
                         , sep    = "" )

# Step No.1, Merge data

l_x_merge    <- rbind( l_x_train, l_x_test )
l_y_merge    <- rbind( l_y_train, l_y_test )
l_subj_merge <- rbind( l_subj_train, l_subj_test )

names( l_x_merge )    <- l_features[[2]]
names( l_y_merge )    <- l_y_names
names( l_subj_merge ) <- l_subj_names
names( l_act_lab )    <- l_act_names

l_merge <- cbind( l_y_merge, l_subj_merge, l_x_merge )

# Step No.2, Extract only mean and std for each measurement

l_mean_std_cols <-  grep( pattern = l_mean_std_regexp
                        , x       = names( l_merge ) )

l_mean_std_cols <- c( 1, 2, l_mean_std_cols )

l_merge         <- l_merge[ , l_mean_std_cols ]

# No. 3 Uses descriptive activity names to name the activities in the data set

l_merge$Activity <- mgsub ( pattern     = as.character(l_act_lab$Index)
                          , replacement = as.character(l_act_lab$Label)
                          , text.var    = l_merge$Activity
                          , fixed       = T
                          )

# No. 4 Appropriately labels the data set with descriptive variable names. 

names(l_merge) <- mgsub( pattern     = l_name_patterns
                       , replacement = l_repl_patterns
                       , text.var    = names( l_merge )
                       , fixed       = F 
                       , trailspace  = T ) 

# No 5. independent tidy data set with the average of each variable for each activity and each subject.

l_groupings   <- group_by( l_merge, Activity, Subject ) 

l_new_dataset <- summarise_each ( tbl  = l_groupings
                                , funs = "mean"  
                                )

l_new_dataset <- as.data.frame( l_new_dataset )

write.table( x        = l_new_dataset
           , file     = "tidyDataSet.txt"
           , row.name = F
           , append   = T
           )

