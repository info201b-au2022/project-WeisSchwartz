library(tidyverse)
library(ggplot2)

#source("data_cleaning_small.R")
source("data_cleaning.R")

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
#create a comma separated list of the most common crimes per year
summary_table_pt1 <- crime_data %>%
  mutate(everyone_gets_1 = 1) %>%
  group_by(year)%>%
  summarise(
    number_crimes_that_year = sum(everyone_gets_1),
    most_common_crime = names(sort(table(Offense.Parent.Group),decreasing=TRUE))
    ) %>%
  group_by(year) %>%
  mutate(most_common_crime = paste(most_common_crime, collapse=",")) %>%
  distinct()

#create a table with comma separated list of the most common neighborhoods for crime per year   
  
summary_table_pt2<- crime_data%>%
  group_by(year)%>%
  summarise(
  most_common_neighborhood = names(sort(table(MCPP), decreasing = TRUE))) %>%
  group_by(year) %>%
  mutate(most_common_neighborhood = paste(most_common_neighborhood, collapse= ",")) %>%
  distinct()

#combine tables to one final summary table 
final_summary_table <- left_join(summary_table_pt1, summary_table_pt2, by = "year")


