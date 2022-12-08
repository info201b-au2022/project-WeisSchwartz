#A line chart displaying the  amount of crime committed by hours in the day
#Angela Menge

library(tidyverse)
library(dplyr)
library(ggplot2)
library(hrbrthemes)

source("data_cleaning.R")

#remove years before 2008
crime_data <- crime_data %>%
  filter(Year > 2007)

#create column that assigns the numerical value "1" to each crime
crime_data <- mutate(
  crime_data,
  number_of_crime = 1
)

#create a column with just the hour of the day 
crime_data <- crime_data %>%
  mutate (
    Hour = format(
      as.POSIXct(
        Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
      '%H'
    )
  )
#create dataframe of number of crimes committed by hour of the day
total_crime_by_hour <- crime_data %>%
  group_by(Year, Hour) %>%
  summarise(number_of_crimes = sum(number_of_crime))

#create line chart
total_crime_by_hour %>% 
  mutate(Hour = as.numeric(factor(Hour))) %>%
  ggplot(aes(x = Hour, y = number_of_crimes, group = Year, color = Year)) +
  geom_line() +
  scale_color_viridis(discrete = FALSE) +
  theme_ipsum() +
  labs(y = "Number of Crimes Committed") +
  labs(title = "Crime Committed by Hour in Seattle")+
  scale_x_continuous(breaks = unique(as.numeric(factor(total_crime_by_hour$Hour))), 
                     labels = unique(total_crime_by_hour$Hour))
#This line chart showcases the number of crimes committed by hours of the day. 
#The chart shows that the time of day where crime is most committed is midnight while the time of day where crime is least committed is five in the morning. 
         
