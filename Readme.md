---
title: "Getting and Cleaning Data"
author: "Pradip Gupta"
date: "Sunday, June 21, 2015"
output: html_document
---


<p>Repo for the submission of the course project for the Getting and Cleaning Data course assignment.</p>

<h3>Overview</h3>

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at The UCI Machine Learning Repository

<p><a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">The source data for this project can be found here.</a></p>

Making Modifications to This Script

Once you have obtained and unzipped the source files, you will need to make one modification to the R file before you can process the data. Note that on line 26 of run_analysis.R, you will set the path of the working directory to relect the location of the source files in your own directory.
Project Summary

<p>The following is a summary description of the project instructions</p>

<p><b>You should create one R script called run_analysis.R that does the following. </b><br>
<list>
1. Merges the training and the test sets to create one data set.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set.<br>
4. Appropriately labels the data set with descriptive activity names. <br>
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>
</list>
</p>
Additional Information

<p>The output of the 5th step is called <code>tidy_movement_data_1.txt</code>, and uploaded in the course project's directory.</p>

<p>You can find additional information about the variables, data and transformations in the CodeBook.MD file.</p>