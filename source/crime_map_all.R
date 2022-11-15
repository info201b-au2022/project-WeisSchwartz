# Project Avoid Assault: Data Cleaning
#   Map of Seattle displaying frequency and location of violent crimes for all
#   SPD records.
#   Kensho Gendzwill
#   Autumn 2022

library(dplyr)
library(leaflet)

#source('data_cleaning_small.R')
source('data_cleaning.R')


# add a Year column to the dataframe so that the location of crime can be seen
# by year.
crime_data <- crime_data %>%
              mutate(
                Year = format(
                  as.POSIXct(
                    Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
                  '%Y'
                  )
                )

# initialize a color palette for the map so each crime appears as a different
# color
pal <- colorFactor(
        rainbow(n_distinct(crime_data$Offense)), crime_data$Offense
        )

# initialize a leaflet map
crime_map <- leaflet(crime_data) %>% addTiles() %>%
              addLegend(
                'bottomleft', pal = pal, values = ~Offense,
                title = 'Crime Category'
              )

#initialize a 'group' vector to add each year as a unique layer later
groups <- c()

# loop through each Year in the dataframe and visualize the location where each
# crime occurred
for (n in unique(crime_data$Year)) {
  df <- crime_data %>% filter(Year == n)
  crime_map <- addCircles(
                crime_map, data=df, color = ~pal(Offense), group = paste(n)
               )
  groups <- c(groups, paste(n))
}

# add layer control so that the user can filter which year they want to see
crime_map <- addLayersControl(
              crime_map, baseGroups = groups,
              options = layersControlOptions(collapsed = FALSE)
             )

crime_map
