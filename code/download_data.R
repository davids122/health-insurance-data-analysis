## Load Libraries 
library(tidycensus)
library(tidyverse)
library(tigris)
library(sf)


## Census_API Key
census_api_key("db2a1697ae2c7a4b62e9a08778a72d60d6f8b775", overwrite = TRUE)


## Get USA health insurance data from American Community Survey API. Retrieve
## population of people aged 19-34 that are non-institutionalized, and number 
## of those  who have at least one type of health insurance. 
health_insurance_data <-get_acs(geography = "state",
                                variables = c("B27010_018E", 
                                              "B27010_019E"), 
                                year = 2020,
                                output = "wide")


## Get Cartographic Boundary File for USA
usa_boundaries_sf <- states(cb = TRUE, 
                            resolution = "500k",
                            year = "2020")


## Write 2020 health insurance data to data folder as .csv file
write_csv(health_insurance_data, 
          file = "../raw_data/usa_health_insurance_data.csv")


## Write spatial layer to data folder as .gpkg file
write_sf(usa_boundaries_sf, "../raw_data/usa_states.gpkg")