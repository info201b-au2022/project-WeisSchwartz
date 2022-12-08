#P3: Final Deliverable
#    Setup UI for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

# ui.R
library(shiny)
library(leaflet)

# Pull dataframe from data cleaning file
#source('data_cleaning_small.R')
source('data_cleaning.R')


###
# Introduction
###

# Define a variable `intro_main_content` that is a `mainPanel()` for the
# introduction page that contains the text and formatting for the introduction
# page
intro_main_content <- mainPanel(
  h1('Introduction'),
  p('Too often, pedestrians fall victim to incidents of robbery, battery and gun
    violence. As students, safety on the streets is a concern even near campus, 
    where rates of violent crimes are increasing. This project will parse through 
    the SPD Crime dataset to analyze where and when crimes against persons have 
    happened in Seattle. Through patterns highlighted, this project aims to 
    provide a tool that makes it safer for college students to travel Seattle 
    safely.'),
  h2('Questions'),
  uiOutput("questionList"),
  h3('Data'),
  p('Our questions were answered using the Seattle Police Department’s
    (SPD) crime data collected from 2008-Present. The data collected relies on 
    the National Incident-Based Reporting System (NIBRS), the standardization of
    crime classifications allows for comparison over time. It’s important to note
    that only finalized (Uniform Crime Reporting approved) reports are released 
    and included in this data set. As a whole, this dataset included 17 columns 
    and 1.02 million rows. To provide a more specific report, we decided within 
    the data set, to focus only on crimes that would affect pedestrians which 
    include: '),
  img('description', src = "picture.jpg")
 )

# Create a variable `intro_panel` that stores a `tabPanel()` for my first page
intro_panel <- tabPanel(
  titlePanel('Introduction'), 
  intro_main_content
)


###
# Chart 1 - Line Graph
###


# Define a variable `chart1_sidebar_content` that is a `sidebarPanel()` for 
# my chart 1 page:

chart1_sidebar_content <- sidebarPanel(
  sliderInput('line_year', 'Select Year', min(2007),
              max(crime_data$Year), value=range(crime_data$Year)[2]
              ),
)
# Define a variable `chart1_main_content` that is a `mainPanel()` for my
# chart 1 page that contains
chart1_main_content <- mainPanel(
  plotOutput('line')
)

# Create a variable `chart1_panel` that stores a `tabPanel()` for my chart 1
# page
chart1_panel <- tabPanel(
  titlePanel('Visualization of Crime by Hour'),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)


###
# Chart 2 - Pie Chart
###


# Define a variable `chart2_sidebar_content` that is a `sidebarPanel()` for 
# my chart 2 page:

chart2_sidebar_content <- sidebarPanel(
  sliderInput('pie_year', 'Select Year', min(2007),
              max(crime_data$Year), value=range(crime_data$Year)[2]
  ),
)

# Define a variable `chart2_main_content` that is a `mainPanel()` for my
# chart 2 page that contains
chart2_main_content <- mainPanel(
  plotlyOutput('pie')
  # plotOutput('pie')
)

# Create a variable `chart2_panel` that stores a `tabPanel()` for my chart 2
# page
chart2_panel <- tabPanel(
  titlePanel('Common Types of Violent Crime'),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

###
# Chart 3 - Crime Map
###


# Define a variable `chart3_sidebar_content` that is a `sidebarPanel()` for 
# my chart 3 page:

chart3_sidebar_content <- sidebarPanel(
  sliderInput('map_year', 'Select Year', min(2007),
              max(crime_data$Year), value=range(crime_data$Year)[2]
              ),
  selectInput('map_crime_type', 'Select Crime Type',
              unique(crime_data$Offense)),
  p('Please manually zoom in on Seattle, Leaflet has trouble initializing
    the map with so many data points :,)'),
  p('Also, to start displaying the data points please start by manually
    selecting a new crime type, this is another Leaflet frustration.')
)

# Define a variable `chart3_main_content` that is a `mainPanel()` for my
# chart 3 page that contains
chart3_main_content <- mainPanel(
  leafletOutput('map'),
  h1('Summary'),
  h2('About the Map'),
  p('This map shows where each and every violent crime occured in Seattle in a
    given year. Data before 2007 was omitted due to a lack of sufficient data to
    produce a useful visualization on the map. By exploring this tool, users may
    gain insight into which neighborhoods are most likely to experience a
    certain type of crime. The year-selection tool allows for users to track the
    general incident rate of crime in that neighborhood over time as well. Most
    users would be interested in examining the trends from the past five or so
    years, since that data is most relevant to how crime is distributed across
    Seattle today. This information may be used to inform how a pedestrian
    chooses to stay alert and protect themselves when walking around Seattle.'),
  h2('Overall Trends and Patterns'),
  p("Across all crime types, there is a noticeable cluster around downtown
    Seattle, notably Belltown, the South end of Capitol Hill and International
    District. For person-on-person crimes such as assault and intimidation,
    clusters can be observed around the U District, Ballard and North Aurora
    Avenue as well. These observations are consistent with the average
    Seattelite's impression of these neighborhoods; walking alone at night in 
    downtown, U District or Aurora Ave. is generally considered a bad move.
    However, it is useful to consider that this may be a self-fulfilling
    prophecy - if many people think that a neighborhood is dangerous, it will
    cause people to be more alert and report more crimes in that area. In
    addition, the neighborhoods mentioned are high-activity areas with many
    residents and police availability.", strong("Users should be aware that the
    clusters on the map are a biased representation of crime rate in Seattle."),
    ),
  p("Across time, the crime clusters don't seem to have changed much, with the
    exception of Ballard, which did not seem to have as high of a concentration
    of violent crime pre-2010. Outside of the persistent clusters, crime seems
    to populate the remainder of Seattle in a random manner, showing no obvious
    pattern across different years.")
)

# Create a variable `chart3_panel` that stores a `tabPanel()` for my chart 3
# page
chart3_panel <- tabPanel(
  titlePanel('Map of Violent Crime in Seattle'),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)


###
# Summary
###


# Define a variable `summary_main_content` that is a `mainPanel()` for my
# summary page that contains
summary_main_content <- mainPanel(
  p('summary main panel')
)

# Create a variable `summary_panel` that stores a `tabPanel()` for my summary
# page
summary_panel <- tabPanel(
  titlePanel('summary'),
  summary_main_content
)


###
# Report
###


# Define a variable `report_main_content` that is a `mainPanel()` for my
# report page that contains
report_main_content <- mainPanel(
  htmltools::includeMarkdown("../docs/report.md")
)

# Create a variable `report_panel` that stores a `tabPanel()` for my report
# page
report_panel <- tabPanel(
  titlePanel('Report'),
  report_main_content
)


# Define a variable `ui` storing a `navbarPage()` element containing
# my two pages defined above
ui <- navbarPage('Final Project Page',
                 intro_panel, chart1_panel, chart2_panel, chart3_panel,
                 summary_panel, report_panel)
