# Getting-and-Cleaning-Data

---
title: "Readme.md"

author: "Dario Oviedo Rueda"

date: "September 5, 2017"

output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#  Getting and Cleaning Data Course Project


## Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

  1) a tidy data set as described below, 

  2) a link to a Github repository with your script for performing the analysis,

  3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.



## Purpose of Run_analisys.r

The script Run_analisys.R make the next operations:

  1.- Verify it the folder UCI HAR Dataset exist.

  2.- Case no, it will create it and will download the files

  3.- Read the files and merge them.

  4.- Generate the right labels for each column and row.

  5.- Save the information in a CSV file.

  6.- Get the average by group of the data frame and will save it in a CSV file.



## Objectives

The main object of the script is:

  1.- Merges the training and the test sets to create one data set.

  2.- Extracts only the measurements on the mean and standard deviation for each measurement.

  3.- Uses descriptive activity names to name the activities in the data set

  4.- Appropriately labels the data set with descriptive variable names.

  5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
