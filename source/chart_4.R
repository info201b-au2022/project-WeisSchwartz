#A pie chart displaying the most common occurring categories of crime in Seattle
#Angela Menge

library(tidyverse)
library(dplyr)
library(ggplot2)
#install.packages("scales")

source("data_cleaning.R")

#create pie chart
crime_data %>%
  count(Offense.Parent.Group) %>%
  mutate(Offense.Parent.Group = factor(Offense.Parent.Group), percentage = n / sum(nrow(crime_data))) %>%
  ggplot(aes(x="", y = percentage, fill = Offense.Parent.Group)) +
  geom_col(color = "black") +
  coord_polar(theta = "y") +
  labs(title = "Most Common Categories of Crime in Seattle") +
  geom_text(aes(label = scales::percent(percentage)),
            position = position_stack(vjust = 0.5),
            color = "white") +
  guides(fill = guide_legend(title = "Offense Categories")) +
  theme_void()

#This pie chart shows the proportion of common categories of crime committed.
#The chart reveals that assault offenses comprise the majority of crime at around 74 while drunkenness had the lowest percentage.
