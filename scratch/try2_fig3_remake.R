# attempt 2

# Jaslyn Miura

# jaslyntmiura@ucsb.edu

# load in libraries ------------------------------------------------------------
library(tidyverse)
library(here)
library(lubridate)
library(janitor)
library(patchwork)

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

# applying our function to the entire PRM data set
# stream_data$calc_moving_avg <- sapply(
#   stream_data$sample_date,
#   moving_average,
#   dates = stream_data$sample_date,
#   conc = stream_data$concentration,
#   win_size_wks = 9
# )

# full analysis combined data sets ---------------------------------------------

# calculates the moving average for all streams and all nutrients
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

# recreate figure 3 ------------------------------------------------------------

stream_moving_avg <- stream_moving_avg %>% 
  mutate(year = year(sample_date))

potassium_moving_avg <- stream_moving_avg %>% 
  filter(nutrient == "k") %>% 
  filter(year >= 1989,
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

# plotting potassium
potassium_plot <- ggplot(data = potassium_moving_avg,
       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  # geom_vline(aes(xintercept = c(1998, 0)), linewidth = 1.5,
  #            color = "black", linetype = "dashed") +
  theme_minimal() + 
  labs(x = NULL,
       y = "K mg l^-1") + 
  theme(legend.position = c(0.9, 0.9)) 
potassium_plot

# plotting nitrate
nitrate_plot <- ggplot(data = nitrate_moving_avg,
       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  theme_minimal() + 
  labs(x = NULL,
       y = "NO3-N mg l^-1") +
  theme(legend.position = "none")
nitrate_plot

# plotting magnesium
magnesium_plot <- ggplot(data = magnesium_moving_avg,
       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  theme_minimal() +
  labs(x = NULL,
       y = "Mg l^-1") + 
  theme(legend.position = "none")

# plotting calcium
calcium_plot <- ggplot(data = calcium_moving_avg,
       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() + 
  theme_minimal() +
  labs(x = NULL,
       y = "Ca l^-1") + 
  theme(legend.position = "none")

# plotting ammonium nitrate
amm_nitrate_plot <- ggplot(data = amm_nitrate_moving_avg,
       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() + 
  theme_minimal() +
  labs(x = "Years",
       y = "NH4-N mg l^-1") + 
  theme(legend.position = "none")

(potassium_plot / nitrate_plot / magnesium_plot / calcium_plot / amm_nitrate_plot)
