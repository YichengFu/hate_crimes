#### Preamble ####
# Purpose: Simulation to look at what variables I need for the analysis.
# Author: Tommy Fu
# Date: 23 September 2024 
# Contact: tommy.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)

#### Simulate data ####


# Set seed for reproducibility
set.seed(123)

# Define parameters for the simulation
n <- 1000  # Number of rows to simulate

# Simulate years between 2018 and 2023
occurrence_year <- sample(2018:2023, n, replace = TRUE)

# Simulate occurrence dates (within the occurrence year)
occurrence_date <- as.Date(paste0(occurrence_year, "-01-01")) + sample(0:364, n, replace = TRUE)

# Simulate neighborhoods (similar to NEIGHBOURHOOD_158)
neighborhoods <- c("Downtown", "Scarborough", "North York", "Etobicoke", "York", "East York")
neighborhood <- sample(neighborhoods, n, replace = TRUE)

# Simulate race bias categories
race_biases <- c("Black", "White", "Asian", "None")
race_bias <- sample(race_biases, n, replace = TRUE)

# Simulate religion bias categories
religion_biases <- c("Jewish", "Muslim", "Christian", "None")
religion_bias <- sample(religion_biases, n, replace = TRUE)

# Simulate sexual orientation bias
sexual_orientation_biases <- c("Gay", "Lesbian", "None")
sexual_orientation_bias <- sample(sexual_orientation_biases, n, replace = TRUE)

# Simulate primary offense types
offense_types <- c("Assault", "Mischief Under $5000", "Wilful Promotion of Hatred", "Uttering Threats")
primary_offense <- sample(offense_types, n, replace = TRUE)

# Simulate whether an arrest was made
arrest_made <- sample(c("YES", "NO"), n, replace = TRUE, prob = c(0.3, 0.7))

# Combine into a simulated data frame
simulated_data <- data.frame(
  OCCURRENCE_YEAR = occurrence_year,
  OCCURRENCE_DATE = occurrence_date,
  NEIGHBOURHOOD = neighborhood,
  RACE_BIAS = race_bias,
  RELIGION_BIAS = religion_bias,
  SEXUAL_ORIENTATION_BIAS = sexual_orientation_bias,
  PRIMARY_OFFENSE = primary_offense,
  ARREST_MADE = arrest_made
)

# View the first few rows of the simulated dataset
head(simulated_data)

# save it to a CSV file for later use
# write.csv(simulated_data, "simulated_hate_crimes_data.csv", row.names = FALSE)


