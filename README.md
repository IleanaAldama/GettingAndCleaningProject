GettingAndCleaningProject
=========================


Please download the run_analysis.R script in the folder that contains the Samsung Data.
As result, you will get the merged_dataset.txt file


For runnning the script set your working directory to the Samsung Data dir, the you can use the source Command.

setwd(".../UCI HAR Dataset")

source('./run_analysis.R')

list.file(".")

The Resulting tidy DataSet is in the "tidy variable"

You can see it with

head(tidy)

or

tidy

