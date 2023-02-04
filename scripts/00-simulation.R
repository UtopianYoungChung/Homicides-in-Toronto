#### Preamble ####
# Purpose: Clean Toronto Homicides Dataset
# Author: Joseph Chung
# Date: 30 January 2023
# Contact: yj.chung@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(opendatatoronto)
library(knitr)
library(lubridate)
library(patchwork)
library(janitor)
library(reshape2)

#### Clean the data and only take the information we wish to use ####
homicides_cleaned <- read_csv(here::here("inputs/data/homicides_data_unclean.csv"))
homicides_cleaned %>%  
  select(Occurrence_year, Homicide_Type,Neighbourhood)
head(homicides_cleaned)


#### Test the homicides_cleaned dataset ####
homicides_cleaned$Occurrence_year |> min() == 2004
homicides_cleaned$Occurrence_year |> max() == 2020
homicides_cleaned$Occurrence_year |> class() == "numeric"
homicides_cleaned$Occurrence_year |>
  unique() |>
  length() == 1166


### Group by Occurrence year and count the numbers ###
homicides_count <- homicides_cleaned %>%
  group_by(Occurrence_year) %>%
  dplyr:: count(Homicide_Type, name = 'ID')

### transform long to wide format###
homicides_each_year = dcast(homicides_count, Occurrence_year~Homicide_Type, value.var = "ID")


### Group by Neighborhood and count the number of Homicide type to summarise the total ### 
homicides_summary <- homicides_cleaned %>%
  group_by(Neighbourhood) %>%
  dplyr:: count(Homicide_Type, name = 'count_neigh')%>%
  summarise(total = sum(count_neigh))

### Filter out the total smaller than/equal to 20 ###
homicides_high <- homicides_summary %>%
    filter(total >=20)

### Only take the information we wish to use and get the total values of each division en route to a call  ###
Homicides_vs_division <- homicides_cleaned %>%
  select(Occurrence_year, Division, Neighbourhood)%>%
  group_by(Division)%>%
  dplyr:: count(Division, name = 'count_division')

### Compares division and neighbourhood ###
Homicides_compare <- homicides_cleaned %>%
  group_by(Division) %>%
  dplyr:: count(Neighbourhood, name = 'ID')

### Filter Homicides_compare >= 20 ###
Homicides_compare_filtered <- Homicides_compare%>%
  filter(ID >= 20)


#### Save the data in our inputs folder in case the data is removed or
# relocated from the URL provided above ####
write.csv(x = homicides_cleaned,
          file = "inputs/data/homicides_cleaned.csv")

write.csv(x = homicides_count,
          file = "inputs/data/homicides_count.csv")

write.csv(x = homicides_each_year,
          file = "inputs/data/homicides_each_year.csv")

write.csv(x = homicides_summary,
          file = "inputs/data/homicides_summary.csv")

write.csv(x = homicides_high,
          file = "inputs/data/homicides_high.csv")

write.csv(x = Homicides_vs_division,
          file = "inputs/data/homicides_vs_division.csv")

write.csv(x = Homicides_compare,
          file = "inputs/data/homicides_compare.csv")

write.csv(x = Homicides_compare_filtered,
          file = "inputs/data/Homicides_compare_filtered.csv")
