#P3: Final Deliverable
#    Setup UI for Shiny app
#    Kensho Gendzwill
#    Autumn 2022

# ui.R
library(shiny)

# Pull dataframe from data cleaning file
source('data_cleaning_small.R')
#source('data_cleaning.R')


###
# Introduction
###

# Define a variable `intro_main_content` that is a `mainPanel()` for the
# introduction page that contains the text and formatting for the introduction
# page
intro_main_content <- mainPanel(
  h1('Header 1'),
  p('text'),
  h2('Header 2'),
  p('text')
)

# Create a variable `intro_panel` that stores a `tabPanel()` for my first page
intro_panel <- tabPanel(
  titlePanel('Introduction'), 
  intro_main_content
)


###
# Chart 1
###


# Define a variable `chart1_sidebar_content` that is a `sidebarPanel()` for 
# my chart 1 page:

chart1_sidebar_content <- sidebarPanel(
  p('chart 1 sidebar')
)

# Define a variable `chart1_main_content` that is a `mainPanel()` for my
# chart 1 page that contains
chart1_main_content <- mainPanel(
  p('chat 1 main panel')
)

# Create a variable `chart1_panel` that stores a `tabPanel()` for my chart 1
# page
chart1_panel <- tabPanel(
  titlePanel('chart 1'),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)


###
# CHART 2
###


# Define a variable `chart2_sidebar_content` that is a `sidebarPanel()` for 
# my chart 2 page:

chart2_sidebar_content <- sidebarPanel(
  p('chart 2 sidebar')
)

# Define a variable `chart2_main_content` that is a `mainPanel()` for my
# chart 2 page that contains
chart2_main_content <- mainPanel(
  p('chat 2 main panel')
)

# Create a variable `chart2_panel` that stores a `tabPanel()` for my chart 2
# page
chart2_panel <- tabPanel(
  titlePanel('chart 2'),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)


###
# Chart 3
###


# Define a variable `chart3_sidebar_content` that is a `sidebarPanel()` for 
# my chart 3 page:

chart3_sidebar_content <- sidebarPanel(
  p('chart 3 sidebar')
)

# Define a variable `chart3_main_content` that is a `mainPanel()` for my
# chart 3 page that contains
chart3_main_content <- mainPanel(
  p('chat 3 main panel')
)

# Create a variable `chart3_panel` that stores a `tabPanel()` for my chart 3
# page
chart3_panel <- tabPanel(
  titlePanel('chart 3'),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)


###
# Summary
###

# Define a variable `summary_sidebar_content` that is a `sidebarPanel()` for 
# my summary page:

summary_sidebar_content <- sidebarPanel(
  p('sumary sidebar')
)

# Define a variable `summary_main_content` that is a `mainPanel()` for my
# summary page that contains
summary_main_content <- mainPanel(
  p('summary main panel')
)

# Create a variable `summary_panel` that stores a `tabPanel()` for my summary
# page
summary_panel <- tabPanel(
  titlePanel('summary'),
  sidebarLayout(
    summary_sidebar_content,
    summary_main_content
  )
)


###
# Report
###


# Define a variable `report_sidebar_content` that is a `sidebarPanel()` for 
# my report page:

report_sidebar_content <- sidebarPanel(
  p('report sidebar')
)

# Define a variable `report_main_content` that is a `mainPanel()` for my
# report page that contains
report_main_content <- mainPanel(
  p('report main panel')
)

# Create a variable `report_panel` that stores a `tabPanel()` for my report
# page
report_panel <- tabPanel(
  titlePanel('report'),
  sidebarLayout(
    report_sidebar_content,
    report_main_content
  )
)


# Define a variable `ui` storing a `navbarPage()` element containing
# my two pages defined above
ui <- navbarPage('Final Project Page',
                 intro_panel, chart1_panel, chart2_panel, chart3_panel,
                 summary_panel, report_panel)
