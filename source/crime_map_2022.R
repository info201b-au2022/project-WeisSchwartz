# Project Avoid Assault: Data Cleaning
#   Map of Seattle displaying frequency and location of violent crimes in 2022.
#   Kensho Gendzwill
#   Autumn 2022

library(dplyr)
library(leaflet)

# source('data_cleaning_small.R')
source('data_cleaning.R')


# add a Year column to the dataframe so that the dataframe can be subset to
# contain only data from 2022. 
crime_data_2022 <- crime_data %>%
              mutate(
                Year = format(
                  as.POSIXct(
                    Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
                  '%Y'
                )
              ) %>% filter(Year == '2022')

# initialize a color palette for the map so each crime appears as a different
# color
pal <- colorFactor(
                   rainbow(n_distinct(crime_data_2022$Offense)),
                   crime_data_2022$Offense
                  )

# initialize a leaflet map
crime_map_2022 <- leaflet(crime_data_2022) %>% addTiles() %>%
                  addLegend(
                    'bottomleft', pal = pal, values = ~Offense,
                    title = 'Crime Category'
                  )

#initialize a 'group' vector to add each crime as a unique layer later
groups <- c()

# loop through each crime in the dataframe and visualize the location where each
# crime occurred
for (n in unique(crime_data_2022$Offense)) {
  df <- crime_data_2022 %>% filter(Offense == n)
  crime_map_2022 <- addCircles(
    crime_map_2022, data=df, color = ~pal(Offense), group = paste(n)
  )
  groups <- c(groups, paste(n))
}

# add layer control so that the user can filter which crimes they want to see
crime_map_2022 <- addLayersControl(
  crime_map_2022, overlayGroups = groups,
  options = layersControlOptions(collapsed = FALSE)
)

crime_map_2022
