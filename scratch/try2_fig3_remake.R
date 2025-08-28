# attempt 2

# Jaslyn Miura

# jaslyntmiura@ucsb.edu

# load in libraries ------------------------------------------------------------
library(tidyverse)
library(here)
library(lubridate)
library(janitor)

# read in the files ------------------------------------------------------------
# reading in each file and cleaning the variable names so it's easier handle
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv")) %>% 
  clean_names()
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv")) %>% 
  clean_names()
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv")) %>% 
  clean_names()
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv")) %>% 
  clean_names()

# cleaning data ----------------------------------------------------------------
# selecting the columns of data that we are interested in
# also want to try to pivot the data frame so that all the concentrations are in one column but nutrient is defined by row
PRM_clean_long <- PRM %>% 
  pivot_longer(c("k", "no3_n", "mg", "ca", "nh4_n"),
               names_to = "nutrient",
               values_to = "concentration") %>% 
  select(sample_id, sample_date, nutrient, concentration)

BQ1_clean_long <- BQ1 %>% 
  pivot_longer(c("k", "no3_n", "mg", "ca", "nh4_n"),
               names_to = "nutrient",
               values_to = "concentration") %>% 
  select(sample_id, sample_date, nutrient, concentration)

BQ2_clean_long <- BQ2 %>% 
  pivot_longer(c("k", "no3_n", "mg", "ca", "nh4_n"),
               names_to = "nutrient",
               values_to = "concentration") %>% 
  select(sample_id, sample_date, nutrient, concentration)

BQ3_clean_long <- BQ3 %>% 
  pivot_longer(c("k", "no3_n", "mg", "ca", "nh4_n"),
               names_to = "nutrient",
               values_to = "concentration") %>% 
  select(sample_id, sample_date, nutrient, concentration)

# joinging the data from the different stream sites into one data set
stream_data <- PRM_clean_long %>% 
  full_join(BQ1_clean_long) %>% 
  full_join(BQ2_clean_long) %>% 
  full_join(BQ3_clean_long)

# running the analysis on just the PRM data set --------------------------------
# testing that our moving_avg function works on one stream data set
source("moving_avg_func.R")

# # testing that the function gives us a realistic output for ONE input
# ca_ma_once <- moving_average(focal_date = as.Date("1991-09-03"),
#                              dates = PRM_clean$sample_date,
#                              conc = PRM_clean$ca, # since we are going to pivot longer we it would no longer be data$con
#                              win_size_wks = 9)

# PRM_clean_long %>% 
#   group_by(sample_id, nutrient) %>% 
#   mutate(calc_moving_avg = sapply(PRM_clean_long, moving_average(focal_date = sample_date,
#                         dates = sample_date,
#                         conc = concentration, # since we are going to pivot longer we it would no longer be data$con
#                         win_size_wks = 9)))
# 
# 
#   moving_average(focal_date = sample_date,
#                  dates = sample_date,
#                  conc = concentration, 
#                  win_size_wks = 9)

  
# trying to add this to the entire data set
stream_data %>% 
  group_by(sample_id, nutrient) %>% 
  mutate(sample_id = as.factor(sample_id),
         nutrient = as.factor(nutrient)) %>% 
  mutate(moving_avg = sapply(
    sample_date,
    moving_average,
    dates = stream_data$sample_date,
    conc = stream_data$concentration,
    win_size_wks = 9
  ))









# applying our function to the entire PRM data set
stream_data$calc_moving_avg <- sapply(
  stream_data$sample_date,
  moving_average,
  dates = stream_data$sample_date,
  conc = stream_data$concentration,
  win_size_wks = 9
)

# full analysis combined data sets ---------------------------------------------


