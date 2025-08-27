# attempt 1 of stream analysis

# Jaslyn Miura

# jaslyntmiura@ucsb.edu

# load in libraries ------------------------------------------------------------
library(tidyverse)
library(here)
library(lubridate)
library(janitor)

# read in the files ------------------------------------------------------------
PRM <- read_csv(here("data", "RioMameyesPuenteRoto.csv"))
BQ1 <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"))
BQ2 <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"))
BQ3 <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"))

# cleaning data ----------------------------------------------------------------
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


# joining the cleaned data -----------------------------------------------------
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




#### RUNNING ONLY ONE STREAM ---------------------------------------------------

test <- PRM_clean %>% 
  mutate(date = make_date(Year, Month, Day)) %>% 
  clean_names() %>% # this function could be moved up to a prior step
  select(sample_id, k, no3_n, mg, ca, nh4_n, date) %>% 
  mutate(week_of_yr = week(date)) %>% 
  mutate(day_of_year = yday(date))

# creating bins to find the average of 9 week intervals
PRM_bins <- test %>% 
  mutate(bin = trunc((((week_of_yr) / 9) + 1))) %>% # may need to rethink this bin calculation since 52 (weeks in a year/9 is 6ish) but the graph of the numbers looks correct, trunc function to give us the whole number
  mutate(year = year(date))

PRM_mean <- PRM_bins %>% 
  group_by(year, bin) %>% 
  mutate(mean = mean(ca)) 

# analysis on only the PRM stream ----------------------------------------------
## here i want to find a way to number the bins so they are consecutive and don't restart at 1 at the beginning of each year

# making a vector to possibly store our results from our for loop
bins <- vector(PRM_bins$bin, mode = "numeric", length = PRM_bins$bin )




# can we number the weeks within our time frame

bin <- vector(mode = "numeric")

for (i in seq_along(test$week_of_yr)) {
  bin[i] <- (((test$week_of_yr[i] - 1) / 9) + 1)
 # bin[i] <- bin[i] + 1
}

# trying to make the bins so that they are not just numbered 1-9
for (i in 2:length(PRM_bins$year)) {
  if (PRM_bins %>% 
    filter(year[i] == 1990)) {
    (bin[i] * 2)
  } else if (in in )
}

# changing the bins so that they are in descending order 
PRM_bins %>% 
  filter(year == 1990) %>% 
  mutate(new_bin = (bin + 7))  
 
PRM_bins %>%  
  filter(year == 1991) %>% 
  mutate(new_bin = (bin + 13))

PRM_bins %>% 
  filter(year == 1992) %>% 
  mutate(new_bin = (bin + 19))

PRM_bins %>% 
  filter(year == 1993) %>% 
  mutate(new_bin = (bin + 24))

PRM_bins %>% 
  filter(year == 1994) %>% 
  mutate(new_bin = (bin + 30))
### need to combine all of this to the same column



# makes the graph and the ranges look correct, the line is not as jagged 
ggplot(data = PRM_mean,
       aes(x = date, y = mean)) +
  geom_smooth()

ggplot(data = PRM_bins,
       aes(x = date, y = ca)) +
  geom_line()
  
# need to change the binning calculations

for (i in join1yearfor (i in join1_clean$week_of_yr) {
  if(join1_clean$week_of_yr[i] == ) {
    
  }
  
}

for (i in 1:ncol(join1_clean)) {
  if (join1_clean[[i]])) {
    penguin_medium <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_medium)
  }




