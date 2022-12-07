# P3: Final Deliverable
#    Setup server for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

library(dplyr)
library(tidyr)
library(plotly)

# Pull dataframe from data cleaning file
#source('data_cleaning_small.R')
source('data_cleaning.R')

# Define shiny server
server <- function(input, output){
  ###
  # Chart 1
  ###
  
  
  ###
  # Chart 2
  ###
  
  
  ###
  # Chart 3 - Crime Map
  ###
  
  # initialize a color palette for the map so each crime appears as a different
  # color
  pal <- colorFactor(
    rainbow(n_distinct(crime_data$Offense)),
    crime_data$Offense
  )
  
  # filter the data according to the user input
  filteredData <- reactive({
    crime_data <- crime_data %>% filter(Year == input$map_year) %>%
      filter(Offense == input$map_crime_type)
  })
  
  # generate a leaflet map
  output$map <- renderLeaflet({
    leaflet(crime_data) %>% addTiles() %>%
      fitBounds(
        ~min(Longitude), ~min(Latitude), ~max(Longitude), ~max(Latitude)
        ) %>%
      addLegend(
        'bottomleft', pal = pal, values = ~Offense,
        title = 'Crime Category'
        )
  })
  
  # set up an observe function to track changes in the widgets and reflect them
  # in the map.
  observe({
    leafletProxy('map', data=filteredData()) %>%
      clearShapes() %>%
      addCircles(color = ~pal(Offense)
      )
  })
  
  
}