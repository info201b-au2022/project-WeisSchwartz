library(tidyverse)
library(ggplot2)
library(stringr)


#source("data_cleaning_small.R")
source("data_cleaning.R")
#view(small_crime_data)

view(crime_data)


#create a column with just the year

crime_data <- crime_data %>%
  mutate(
    year = format(
      as.POSIXct(
        Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
      '%Y'
    )
  )

#assign the value 1 to every crime
#find the total number of crimes per year

table_2 <- crime_data %>%
  mutate(everyone_gets_1 = 1) %>%
  group_by(year)%>%
  summarise(
    number_crimes_that_year = sum(everyone_gets_1))

##find the most common crime and how often it occured 

table_3 <- crime_data %>%
  group_by(year)%>%
  count(Offense)%>%
  filter(n==max(n))%>%
  mutate(most_committed_crime = paste(Offense, collapse = ","))%>%
  mutate(number_of_most_committed_crime = n) %>%
  select(year, most_committed_crime, number_of_most_committed_crime) %>%
  distinct()

#find the most common neighborhood and how often crimes were comitted there 
table_4 <- crime_data %>%
  group_by(year)%>%
  count(MCPP) %>%
  filter(n==max(n)) %>%
  mutate(most_common_neighborhood = paste (MCPP, collapse = ","))%>%
  mutate(number_of_neighborhood_occurance = n)%>%
  select(year, most_common_neighborhood, number_of_neighborhood_occurance) %>%
  distinct()


#combine tables to one final summary table 
table_5 <- left_join(table_2, table_3, by = "year")
final_6 <- left_join(table_5, table_4, by ="year")

#Test?
#counting <- crime_data %>%
#  filter(year == 2006) %>%
# count(MCPP == "CAPITOL HILL")

#counting_2 <- crime_data %>%
# filter (year == 2006) %>%
#  count(MCPP == "NORTH ADMIRAL")
