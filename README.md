# Getting-and-Cleaning-Data
# Explanation on how the script works:

1. Initialize all path variables. To view more information about the path variables review de CodeBook.md file.
2. Read all of the data sets ( x, y, features, etc) and place them to their data into their corresponding variables. Variable mappings can be seen in the CodeBook.md file.
3. Merge all of the data set read and assigned the new data set to the l_merge variable
4. Set the column names to the l_merge data set.
5. Extract the Activity, Subject and those columns whose name ends with std() or mean() from the l_merge dataset.
6. Create a group containing the Activity and Subject columns from the l_merge data set.
7. Get the mean of the standard deviation and mean columns using the summarise_eache function
