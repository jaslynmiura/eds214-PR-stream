# attempt 1

# load in libraries 
library(tidyverse)
library(here)
library(lubridate)
library(janitor)

# read in the files
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))

PRM %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994)

BQ1 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994)

BQ2 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994)

BQ3 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994)
