
stream_data <- readRDS(here("outputs", "stream_data.rds"))

source(here("moving_avg_func.R"))

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

stream_moving_avg <- saveRDS(stream_moving_avg, file = here("outputs", "stream_moving_avg.rds" ))
