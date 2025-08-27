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
# also want to try to pivot the dataframe so that all the concentrations are in one column but nutrient is defined by row
PRM_clean <- PRM %>% 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n) # %>% 
  # pivot_longer(k:nh4_n,
  #              names_to = ,
  #              values_to = concentration)

# running the analysis on just the PRM data set --------------------------------
# testing that our moving_avg function works on one stream data set
source("moving_avg_func.R")

# testing that the function gives us a realistic output for ONE input
ca_ma_once <- moving_average(focal_date = as.Date("1991-09-03"),
                             dates = PRM_clean$sample_date,
                             conc = PRM_clean$ca,
                             win_size_wks = 9)

# applying our function to the entire PRM data set
PRM_clean$calc_rolling_ca <- sapply(
  PRM_clean$sample_date,
  moving_average,
  dates = PRM_clean$sample_date,
  conc = PRM_clean$ca,
  win_size_wks = 9
)

# full analysis combined data sets ---------------------------------------------
