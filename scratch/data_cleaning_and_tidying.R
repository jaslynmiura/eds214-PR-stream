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

# read in the moving_average function ------------------------------------------
source(here("moving_avg_func.R"))

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

# using the moving_average function to calculate the moving average of concentrations
stream_moving_avg <- stream_data %>% 
  group_by(sample_id, nutrient) %>% 
  mutate(sample_id = as.factor(sample_id),
         nutrient = as.factor(nutrient)) %>% 
  mutate(moving_avg = sapply(
    sample_date,
    moving_average,
    dates = as.Date(sample_date),
    conc = concentration,
    win_size_wks = 9
  ))

# creating a year column to so we can filter our data to our time frame of interest (1989-1998)
stream_moving_avg <- stream_moving_avg %>% 
  mutate(year = year(sample_date))

# creating subsets of each nutrient concentrations to create seperate graphs
potassium_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "k") %>% 
  filter(year >= 1988,
         year <= 1998 )
nitrate_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "no3_n") %>% 
  filter(year >= 1988,
         year <= 1998 )
magnesium_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "mg") %>% 
  filter(year >= 1988,
         year <= 1998 )
calcium_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "ca") %>% 
  filter(year >= 1988,
         year <= 1998 )
amm_nitrate_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "nh4_n") %>% 
  filter(year >= 1988,
         year <= 1998 )

# defining the date of Hurricane Hugo, so it can be highlighted on our graph
hugo <- as.Date("1989-09-20")
