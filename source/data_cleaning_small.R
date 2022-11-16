# Project Avoid Assault: Data Cleaning
#   Code to setup and clean the dataset in preparation for analysis.
#   SMALL VERSION FOR TESTING PURPOSES
#   Kensho Gendzwill
#   Autumn 2022

library(dplyr)
library(tidyr)
library(lubridate)

small_crime_data <- read.csv('https://raw.githubusercontent.com/info201b-au2022/project-WeisSchwartz/main/data/crime_data2.csv')

# distill dataframe down to only the columns relevant for our use.
small_crime_data <- small_crime_data %>%
              select(
                Offense.Start.DateTime, Crime.Against.Category,
                Offense.Parent.Group, Offense, Offense.Code, MCPP,
                X100.Block.Address, Longitude, Latitude
              ) 

# filter the dataset so it only contains the types of crimes we want to look at.
small_crime_data <- filter(
              small_crime_data, Offense %in% c(
                'Aggravated Assault', 'Simple Assault', 'Intimidation',
                'Murder & Nonnegligent Mansalughter', 'Kidnapping/Abduction',
                'Robbery', 'Forcible Rape', 'Forcible Sodomy',
                'Sexual Assault With An Object', 'Forcible Fondling',
                'Weapon Law Violations', 'Disorderly Conduct',
                'Driving Under the Influence', 'Drunkenness'
                ))

# remove rows with missing values.
small_crime_data <- small_crime_data %>% drop_na() %>% filter_all(all_vars(. != ''))

# convert Offense.Start.DateTime from string into DateTime objects
small_crime_data <- mutate(
              small_crime_data,
              Offense.Start.DateTime = mdy_hms(Offense.Start.DateTime)
              )
