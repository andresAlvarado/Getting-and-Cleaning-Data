# CodeBook.md
# This file contains the description of the variables used during the execution of the run_analysis.R script. I have classified the variables in four types:
  * First Dataset Creation
  * First Dataset Names
  * Regular Expressions
  * Second DataSet Creation

----------------------------------------------------------------------------------------------------------------------
First Dataset Creation
----------------------------------------------------------------------------------------------------------------------

l_x_test          # [LIST] The local x_test variable is be used to store the data in the X_test.txt file.
l_x_test_path     # [CHAR] The local x_test_path variable contains the path to the X_test.txt file.

l_y_test          # [LIST] The local y_test variable is used to store the data in the Y_test.txt file.    
l_y_test_path     # [CHAR] The local y_test_path variable contains the path to the Y_test.txt file.  

l_subj_test       # [LIST] The local subj_test variable is used to store the data in the subject_test.txt file.
l_subj_test_path  # [CHAR] The local subj_test_path variable contains the path to the subject_train.txt file.

l_x_train         # [LIST] The local x_train variable is be used to store the data in the X_train.txt file.
l_x_train_path    # [CHAR] The local x_train_path variable contains the path to the X_train.txt file.

l_y_train         # [LIST] The local y_train variable is used to store the data in the Y_train.txt file.
l_y_train_path    # [CHAR] The local y_traim_path variable contains the path to the Y_train.txt file.

l_subj_train      # [LIST] The local subj_train variable is used to store the data in the subject_train.txt file.
l_subj_train_path # [CHAR] The local subj_train_path variable contains the path to the subject_train.txt file.

l_act_lab         # [LIST] The local act_lab variable is used to store the data in the activity_labels.txt file.   
l_act_lab_path    # [CHAR] The local act_lab_path variable contains the path to the activity_labels.txt file. 
l_act_names       # [CHAR] The local act_names variable will store the mappings for the activity numbers and descriptions.

l_y_merge         # [LIST] The local y_merge variable will store the union of the l_y_test and l_y_train variables.
l_x_merge         # [LIST] The local x_merge variable will store the union of the l_x_test and l_y_train variables.
l_subj_merge      # [LIST] The local subj_merge variable will store the union of the l_subj_test and l_subj_train variables.

----------------------------------------------------------------------------------------------------------------------
First Dataset Names
----------------------------------------------------------------------------------------------------------------------

l_features        # [LIST] The local l_features variable is used to store the data in the features.txt file. The features variable will be used to label the l_x_merge list.
l_features_path   # [CHAR] The local features_path variable contains the path to the features.txt file.

l_y_names         # [CHAR] The local y_names variable will store the names for the l_y_merge list.
l_subj_names      # [CHAR] The local sub_names variable will store the names for the l_subj_names list.

----------------------------------------------------------------------------------------------------------------------
Regular Expressions
----------------------------------------------------------------------------------------------------------------------

l_name_patterns   # [CHAR] The local name_patterns holds non descriptive values like std(), mean(), etc, that will be                            replaced by the l_repl_patterns variables using the mgsub function. 

l_repl_patterns   # [CHAR] The local repl_patterns holds descriptive values like Standard Deviation, Mean, etc that                              will be used to replace the values of the l_repl_patterns variables using the mgsub                                   function. 

l_mean_std_regexp # [CHAR] The local mean_std_regexp variables holds a regular expression to get std and mean                                    variables using the grep function.

l_mean_std_cols   # [INTEGER] The local mean_std_cols will hold the std and mean column numbers using the                                              l_mean_std_regexp variable as input to the grep function.

----------------------------------------------------------------------------------------------------------------------
Second Dataset Creation
----------------------------------------------------------------------------------------------------------------------

l_groupings     # [LBT] The local groupings variables holds the groupings that will be used to get the aggregations of                         the new data set.

l_new_dataset  # [ DATA FRAME ] holds the new data set.
