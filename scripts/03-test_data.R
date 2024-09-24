#### Preamble ####
# Purpose: Test cleaned data for NAs and other potential problems with the data
# Author: Tommy Fu
# Date: 23 September 2024 
# Contact: tommy.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites:  The simulation of data and the downloaded data after cleaning it. 
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Test data ####
data <- read_csv("data/analysis_data/analysis_data.csv")

# Load necessary libraries

# 1. Test for any missing values in each column
na_test_results <- colSums(is.na(data)) > 0

# 2. Test for any duplicates in the data
duplicate_test_result <- sum(duplicated(data)) > 0

# 3. Test if any negative numbers or 0 exist in the numeric columns
negative_value_test <- any(data$OCCURRENCE_YEAR < 0 | data$OCCURRENCE_DATE< 0 |data$OCCURRENCE_TIME <0 | data$REPORTED_DATE<0)


# 4. Test for logical consistency (occurrence date should be < reported date)
logical_consistency_test <- all(data$OCCURRENCE_DATE < data$REPORTED_DATE)

# Output results as TRUE or FALSE
list(
  "Missing Values Test" = na_test_results,
  "Duplicate Test" = duplicate_test_result,
  "Negative or zero Number Test" = negative_value_test,
  "Logical Consistency Test" = logical_consistency_test
)

# The test results show all FALSE we are good to go with the cleaned data
