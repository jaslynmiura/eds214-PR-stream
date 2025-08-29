
stream_moving_avg <- readRDS(here("outputs", "stream_moving_avg.rds"))

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

# saving each subset as an rds
potassium_moving_avg <- saveRDS(potassium_moving_avg, file = here("outputs", "potassium_moving_avg.rds"))
nitrate_moving_avg <- saveRDS(nitrate_moving_avg, file = here("outputs", "nitrate_moving_avg.rds"))
magnesium_moving_avg <- saveRDS(magnesium_moving_avg, file = here("outputs", "magnesium_moving_avg.rds"))
calcium_moving_avg <- saveRDS(calcium_moving_avg, file = here("outputs", "potassium_moving_avg.rds"))
amm_nitrate_moving_avg <- saveRDS(amm_nitrate_moving_avg, file = here("outputs", "amm_nitrate_moving_avg.rds"))

