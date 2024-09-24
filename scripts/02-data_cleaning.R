#### Preamble ####
# Purpose: Cleans the raw plane data into informative observations and columns. 
# Author: Tommy Fu
# Date: 23 September 2024 
# Contact: tommy.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The simulation of data and the downloaded data
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Load the necessary packages
library(dplyr)
library(lubridate) # for date handling

# Load data set
hate_crimes_data <- read.csv("data/raw_data/raw_data.csv")

# View the structure of the data
str(hate_crimes_data)

# 1. Remove duplicates
hate_crimes_cleaned <- hate_crimes_data %>% distinct()

# 2. Handle missing values
# You can either remove rows with missing values or impute them
# Removing rows with missing values
hate_crimes_cleaned <- hate_crimes_cleaned %>% drop_na()

# Impute missing values if appropriate 
hate_crimes_cleaned$RACE_BIAS[is.na(hate_crimes_cleaned$RACE_BIAS)] <- "None"
hate_crimes_cleaned$RELIGION_BIAS[is.na(hate_crimes_cleaned$RELIGION_BIAS)] <- "None"
hate_crimes_cleaned$SEXUAL_ORIENTATION_BIAS[is.na(hate_crimes_cleaned$SEXUAL_ORIENTATION_BIAS)] <- "None"

# 3. Convert dates to proper date format
hate_crimes_cleaned$OCCURRENCE_DATE <- as.Date(hate_crimes_cleaned$OCCURRENCE_DATE, format="%Y-%m-%d")

# 4. Ensure consistent formatting (e.g., converting bias columns to lowercase or factor variables)
hate_crimes_cleaned$RACE_BIAS <- tolower(hate_crimes_cleaned$RACE_BIAS)
hate_crimes_cleaned$RELIGION_BIAS <- tolower(hate_crimes_cleaned$RELIGION_BIAS)
hate_crimes_cleaned$SEXUAL_ORIENTATION_BIAS <- tolower(hate_crimes_cleaned$SEXUAL_ORIENTATION_BIAS)

# 5. Remove unnecessary columns 
hate_crimes_cleaned <- hate_crimes_cleaned %>%
  select(-c("X_id", "EVENT_UNIQUE_ID"))

# 6. Check for outliers 
summary(hate_crimes_cleaned)

# View the cleaned data
head(hate_crimes_cleaned)


#### Save data ####
write_csv(hate_crimes_cleaned, "data/analysis_data/analysis_data.csv")
