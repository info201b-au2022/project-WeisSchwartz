#A bar chart displaying the total of crimes occurred in each month
#Ellen Huynh

library(tidyverse)
library(ggplot2)

#source("data_cleaning_small.R")
source("data_cleaning.R")

#getOption("timeout")
#options(timeout = 300)
#view(crime_data)

#create a column with just the month
crime_data <- crime_data %>%
  mutate(
    month = format(
      as.POSIXct(
        Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
      '%m'
    )
  )

#create a column that assigns the value"1" to each crime so that I can find
#total for each month

crime_data <- mutate(
  crime_data, 
  number_of_crime = 1
)

#create a column that finds the total of crimes for each month
total_crimes_in_month <- crime_data %>%
  group_by(month) %>%
  summarise(number_of_crimes = sum(number_of_crime))

#create bar chart
ggplot(total_crimes_in_month, aes(x=month, y=number_of_crimes)) +
  geom_bar(stat = "identity", width=0.5)

#problems with the data: it's important to note what month data collection
#started and till what month is it updated till. Some months may appear to have
#a higher count because there were "more" of that month.

#Solution:to only calculate
#for just one year (in the past)






