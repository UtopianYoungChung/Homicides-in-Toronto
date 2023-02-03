#### Preamble ####
# Purpose: Download data on Toronto Plolice Annual Statistical report - Homicides
# Author: Joseph Chung
# Data: 30 January 2023
# Contact: yj.chung@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(opendatatoronto)

#### Download Data ####
#From https://open.toronto.ca/dataset/police-annual-statistical-report-homicide/

#Datasets on opendatatoronto contains several different datasets within it.
#We must look at a package obtained from the website with a specific code
#in order to see these specific datasets within the main dataset.

#Get Package

package <- show_package("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")
package

resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")
resources

#This package has only one dataset within it and must be selected by default

homicides_data_unclean <- get_resource(resource ="e00a84d9-2229-4f8e-b2a2-c7cde3ccd37d")
homicides_data_unclean

#### Save Data ####
write.csv(homicides_data_unclean, "inputs/data/homicides_data_unclean.csv")
