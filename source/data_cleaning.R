# Project Avoid Assault: Data Cleaning
#   Code to setup and clean the dataset in preparation for analysis.
#   Kensho Gendzwill
#   Autumn 2022

library(dplyr)
library(tidyverse)
library(lubridate)  

#combine all of the small "digested" dataframes back into its original size.
crime_data <- list()

for (n in 1:15) {
  crime_data[[n]] <- read.csv(paste('https://raw.githubusercontent.com/info201b-au2022/project-WeisSchwartz/main/data/crime_data', n, '.csv', sep = ''))
}

crime_data <- do.call(rbind.data.frame, crime_data)

# distill dataframe down to only the columns relevant for our use.
crime_data <- crime_data %>%
              select(
                Offense.Start.DateTime, Crime.Against.Category,
                Offense.Parent.Group, Offense, Offense.Code, MCPP,
                X100.Block.Address, Longitude, Latitude
              ) 

# filter the dataset so it only contains the types of crimes we want to look at.
crime_data <- filter(
              crime_data, Offense %in% c(
                'Aggravated Assault', 'Simple Assault', 'Intimidation',
                'Murder & Nonnegligent Mansalughter', 'Kidnapping/Abduction',
                'Robbery', 'Forcible Rape', 'Forcible Sodomy',
                'Sexual Assault With An Object', 'Forcible Fondling',
                'Weapon Law Violations', 'Disorderly Conduct',
                'Driving Under the Influence', 'Drunkenness'
                ))

# remove rows with missing values.
crime_data <- crime_data %>% drop_na() %>% filter_all(all_vars(. != ''))

# convert Offense.Start.DateTime from string into DateTime objects
crime_data <- mutate(
              crime_data,
              Offense.Start.DateTime = mdy_hms(Offense.Start.DateTime)
              )
