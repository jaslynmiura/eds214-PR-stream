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

PRM_clean <- PRM %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994) %>% 
  select(Sample_ID, Year, Month, Day, K, `NO3-N`, Mg, Ca, `NH4-N`)

BQ1_clean <- BQ1 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994) %>% 
  select(Sample_ID, Year, Month, Day, K, `NO3-N`, Mg, Ca, `NH4-N`)

BQ2_clean <- BQ2 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994) %>% 
  select(Sample_ID, Year, Month, Day, K, `NO3-N`, Mg, Ca, `NH4-N`)

BQ3_clean <- BQ3 %>% 
  separate(col = Sample_Date,
           into = c("Year", "Month", "Day"),
           sep = "-") %>% 
  filter(Year == 1988:1994) %>% 
  select(Sample_ID, Year, Month, Day, K, `NO3-N`, Mg, Ca, `NH4-N`)


# joining the cleaned data 
join1 <- PRM_clean %>% 
  full_join(BQ1_clean) %>% 
  full_join(BQ2_clean) %>% 
  full_join(BQ3_clean)

# another cleaning of joined data set, where we remade the date column and also cleaned the names
join1_clean <- join1 %>% 
  mutate(date = make_date(Year, Month, Day)) %>% 
  clean_names() %>% # this function could be moved up to a prior step
  select(sample_id, k, no3_n, mg, ca, nh4_n, date) %>% 
  mutate(week_of_yr = week(date)) %>% 
  mutate(day_of_year = yday(date)) 

test <- PRM_clean %>% 
  mutate(date = make_date(Year, Month, Day)) %>% 
  clean_names() %>% # this function could be moved up to a prior step
  select(sample_id, k, no3_n, mg, ca, nh4_n, date) %>% 
  mutate(week_of_yr = week(date)) %>% 
  mutate(day_of_year = yday(date))
  
PRM_bins <- test %>% 
  mutate(bin = round((((week_of_yr - 1) / 9) + 1))) %>% # may need to rethink this bin calculation since 52 (weeks in a year/9 is 6ish) but the graph of the numbers looks correct, trunc function to give us the whole number
  mutate(year = year(date))

PRM_mean <- PRM_bins %>% 
  group_by(year, bin) %>% 
  summarise(mean = mean(ca)) 

# makes the graph and the ranges look correct, the line is not as jagged 
ggplot(data = PRM_mean,
       aes(x = year, y = mean)) +
  geom_smooth()
  


for (i in join1yearfor (i in join1_clean$week_of_yr) {
  if(join1_clean$week_of_yr[i] == ) {
    
  }
  
}

for (i in 1:ncol(join1_clean)) {
  if (join1_clean[[i]])) {
    penguin_medium <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_medium)
  }




