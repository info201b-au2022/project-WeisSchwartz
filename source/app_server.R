# P3: Final Deliverable
#    Setup server for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

library(dplyr)
library(tidyr)
library(plotly)
library(ggplot2)
library(hrbrthemes)
library(scales)

# Pull dataframe from data cleaning file
#source('data_cleaning_small.R')
source('data_cleaning.R')

# Define shiny server
server <- function(input, output){

  ###
  # Chart 1
  ###

  #remove years before 2007
  crime_data <- crime_data %>%
    filter(Year > 2006)
  
  #create column that assigns the numerical value "1" to each crime
  crime_data <- crime_data %>%
    mutate(
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
    summarise(number_of_crimes_line = sum(number_of_crime))
  
  # filter the data according to the user input
  filteredData <- reactive({
    total_crime_by_hour <-  total_crime_by_hour %>% filter(Year == input$line_year)
  })
  
  # generate a line graph
  output$line <- renderPlot({
    total_crime_by_hour %>% 
      filter(Year == input$line_year) %>%
      mutate(Hour = as.numeric(factor(Hour))) %>%
      ggplot(aes(x = Hour, y = number_of_crimes_line, group = Year, color = "red")) +
      geom_line() +
      theme_ipsum() +
      labs(y = "Number of Crimes Committed") +
      labs(title = "Crime Committed in Seattle 2007-2022")+
      scale_x_continuous(breaks = unique(as.numeric(factor(total_crime_by_hour$Hour))), 
                         labels = unique(total_crime_by_hour$Hour))
  })
  
  
  ###
  # Chart 2
  ###
  
  # remove years before 2007
  crime_data <- crime_data %>%
    filter(Year > 2006)

  # Define the pie chart output
  output$pie <- renderPlotly({
    # Filter and summarize data
    pie_data <- crime_data %>%
            filter(Year == input$pie_year) %>%
            group_by(Offense) %>%
            summarize(Total = n()) %>%
            mutate(Percentage = round(Total / sum(Total), 1))

    # Set up the pie chart
    fig <- plot_ly(pie_data, labels = ~Offense, values = ~Total,
                   type = 'pie',
                   textinfo = 'percent',
                   insidetextfont = list(color = '#FFFFFF'),
                   hoverinfo = 'text',
                   text = ~paste0(Offense,': ',
                                  Total, ' total offenses'),
                   marker = list(colors = colors,
                                 line = list(color = '#FFFFFF', width = 1))
    )

    # set up a layout for the pie chart
    fig <- fig %>%
      layout(
        title = paste0(
          'Breakdown of Violent Crime in Seattle', '(', input$pie_year, ')'
        ),
        margin = list(l = 50, r = 50, b = 50, t = 100,  pad = 4),
        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
      )

    fig
  })

  
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