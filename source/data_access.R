# Project Avoid Assault: Data Cleaning
#   Code to pull data from Seattle City API.
#   Kensho Gendzwill
#   Autumn 2022

library(RSocrata)

df <- read.socrata("https://data.seattle.gov/resource/tazs-3rd5.json")
