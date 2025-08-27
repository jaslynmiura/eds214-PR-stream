# attempt 2

# Jaslyn Miura

# jaslyntmiura@ucsb.edu

# load in libraries ------------------------------------------------------------
library(tidyverse)
library(here)
library(lubridate)
library(janitor)

# read in the files ------------------------------------------------------------
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv")) %>% 
  clean_names()
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv")) %>% 
  clean_names()
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv")) %>% 
  clean_names()
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv")) %>% 
  clean_names()

# cleaning data ----------------------------------------------------------------

PRM_longer <- PRM %>% 
  select(sample_id, sample_date, k, no3_n, mg, ca, nh4_n) %>% 
  pivot_longer(k:nh4_n,
               names_to = ,
               values_to = concentration)
  
  