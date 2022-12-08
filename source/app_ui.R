#P3: Final Deliverable
#    Setup UI for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

# ui.R
library(shiny)
library(leaflet)
library(plotly)

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
  h1(strong("Crime in Seattle")),
  h4(em("Authors: Angela Menge, Ellen Huynh, Kensho Gendzwill, Nathan Lee")),  
  h4("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h2('Introduction'),
  p('Too often, pedestrians fall victim to incidents of robbery, battery and gun
    violence. As students, safety on the streets is a concern even near campus, 
    where rates of violent crimes are increasing. This project will parse through 
    the SPD Crime dataset to analyze where and when crimes against persons have 
    happened in Seattle. Through patterns highlighted, this project aims to 
    provide a tool that makes it safer for college students to travel Seattle 
    safely.'),
  h2('Questions'),
  p("- How does the time of day impact crime committed?\n- What are the most common types of violent crime in Seattle?\n- Where in Seattle do violent crimes occur most?"),
  h2('About the Dataset'),
  p('Our questions were answered using the Seattle Police Department’s
    (SPD) crime data collected from 2008-Present. The data collected relies on 
    the National Incident-Based Reporting System (NIBRS), the standardization of
    crime classifications allows for comparison over time. It’s important to note
    that only finalized (Uniform Crime Reporting approved) reports are released 
    and included in this data set. As a whole, this dataset included 17 columns 
    and 1.02 million rows. To provide a more specific report, we decided within 
    the data set, to focus only on crimes that would affect pedestrians which 
    include: '),
  p("Aggravated Assault, Simple Assault, Intimidation,
      Murder & nonnegligent manslaughter,Robbery, Kidnapping/Abduction,
      Forcible Rape,Forcible Sodomy, Sexual Assault with an Object,
      Forcible Fondling,Weapon Law Violations,Disorderly Conduct,
      Driving Under the Influence, Drunkenness"),
  h2("Explore our Interactive Visualizations"),
  h4("1. Visualization of Crime by Hour"),
  p("How does the time of day impact crime committed?"),
  h4("2. Common Types of Violent Crime"),
  p("What are the most common types of violent crime in Seattle?"),
  h4("3. Map of Violent Crime in Seattle"),
  p("Where in Seattle do violent crimes occur most?"),
  img('University of Washington makes news because of crime. (Image courtesy foxnews.com)', src = "picture.jpg")
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
              max(crime_data$Year), value=range(crime_data$Year)[2]),
  p("The hour '00' stands for midnight")
)

# Define a variable `chart1_main_content` that is a `mainPanel()` for my
# chart 1 page that contains
chart1_main_content <- mainPanel(
  plotOutput('line'),
  h1('Summary'),
  h2('About This Chart'),
  p("This line graph shows the number of crimes committed per hour in Seattle for a given year. Data before 2007 was omitted due to a lack of sufficient data 
    to produce a useful visualization on the graph. We chose a line graph so that users can see how much crime is committed at what time in the day. Users 
    can use the slider to select which year they'd like to look at to potentially see the difference in crime rates over the years. This line graph may help 
    pedestrians to be more cautious and aware of certain times in the day where crime appears to more frequent."),
  h2('Overall Trends and Insights'),
  p("Across all years from 2007-2022, there is a noticeable spike in the number of crimes committed around midnight. It can be observed that the number of crimes 
    committed appears to be very high right before midnight as well until around 2019. Crime reached an all-time high in Seattle in 2021 with the number of crimes 
    reaching almost 1250 around midnight. This increase could be related to the appearance of COVID-19 and social justive movements such as Black Lives Matter and 
    Stop Asian Hate."),
  p("Similarly, the decline in crime during the day since the pandemic started could be a result of the stay-at-home mandate and self distancing. 
    The most infrequent times of crime are consistently around 5-6 am, with crime then rising steadidly throughout the day. The amount and pattern of crimes reported 
    in 2007 is low and infrequent compared to the rest of the years which could be due to a lack of data and/or reports.")
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
              max(crime_data$Year), value=range(crime_data$Year)[2]),
  p('Slices that appear as 0% may be disproportionate in size as there may
    be a minimum threshold for the size of a slice')
)

# Define a variable `chart2_main_content` that is a `mainPanel()` for my
# chart 2 page that contains
chart2_main_content <- mainPanel(
  plotlyOutput('pie'),
  h1('Summary'),
  h2('About This Graph'),
  p("This pie chart showcases the most common types of violent crime in Seattle. Data before 2007 was omitted due to a lack of sufficient 
    data to produce a useful visualization on the chart. We chose a pie chart so that users can see the percentages and ratios of different types of crime.
    Users can use the slider to choose which year they'd like to look at and potentially see how the percentages have changed over time. This pie chart may help
    pedestrians be informed on what types of crime are more likely to occur and to be cautious of."),
  p("For the main types of crime shown, we filtered violent crimes from the dataset that we thought would be most relevant to pedestrians. There are 7 shown."),
  h2('Overall Trends and Insights'),
  p("Across all years from 2007-2022, Simple Assault remains as the most frequent type of crime at around consistely 40% with Aggravated Assault and Intimidation 
    following behind. This may be due to the fact that Simple Assault can be an act of unwanted physical contact. Weapon Law Violations, Robbery, and Drunkenness
    appear to be the lowest committed crime types. Drunkenness was absent until 2019."),
  p("The year 2007 has only 4 types shown which may be due to lack of data and/or reports. Additionally, a crime type being highly common is not equivalant to its
    level of risk, it simply means that it occurs more. Pedestrians should keep in mind both how common and how dangerous a crime is.")
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
  htmltools::includeMarkdown("final-report.Rmd")
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
