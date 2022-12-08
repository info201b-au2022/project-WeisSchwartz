# P3: Final Deliverable
#    Setup server for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

library(dplyr)
library(tidyr)
library(plotly)
library(shiny)

# Pull dataframe from data cleaning file
#source('data_cleaning_small.R')
source('data_cleaning.R')

# Define shiny server
server <- function(input, output){
  
  ###
  #elements for intro
  ###
  
  #create bullet list of questions
  output$questionList<- renderUI(HTML(markdown::renderMarkdown(
    text = "- What are the most common types of violent crime in Seattle?\n- How does the time of day impact crime committed?\n- Where in Seattle do violent crimes occur the most?\n")))
 
  #create bullet list of focused crimes
  crimes <- c("Aggravated Assault", "Simple Assault", "Intimidation",
              "Murder & nonnegligent manslaughter", "Robbery",
              "Kidnapping/Abduction", "Forcible Rape", "Forcible Sodomy",
              "Sexual Assault with an Object", "Forcible Fondling",
              "Weapon Law Violations", "Disorderly Conduct",
              "Driving Under the Influence", "Drunkenness")
  output$focusedCrimes <- renderUI(HTML(markdown:: renderMarkdown(paste(paste0("- ", crimes, "\n", collapse = "")))))
  
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