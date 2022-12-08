library(dplyr)
library(lubridate)

source('data_cleaning_small.R')


# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

#initializes an empty list
summary_info <- list()

#adds number of observations as an element of the list
summary_info$num_observations <- nrow(small_crime_data)

#adds number of variables as an element of the list
summary_info$num_variables <- ncol(small_crime_data)

#adds mean of date times as an element of the list
report_date_times <- small_crime_data$report_datetime
mean_date_times <- mean(report_date_times, na.rm = TRUE)
summary_info$mean_dates <- mean_date_times

#adds the number of unique offenses as an element of the list
offenses <- small_crime_data$Offense
num_offenses <- unique(offenses)
summary_info$num_offenses <- num_offenses

#adds number of crimes against a person as an element of the list
crimes_against <- small_crime_data$crime_against_category
num_against_a_person <- sum(str_detect(crimes_against, "PERSON"))