
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

# defining the date of Hurricane Hugo, so it can be highlighted on our graph
hugo <- as.Date("1989-09-20")

# plotting potassium concentrations
potassium_plot <- ggplot(data = potassium_moving_avg,
                         aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hugo, color = "dodgerblue", linewidth = 0.8) +
  theme_minimal() + 
  labs(title = "Stream Concentrations Before and After Hurricane Hugo",
       x = NULL,
       y = "K mg l^-1") + 
  theme(legend.title = element_blank()) +
  theme(legend.position = "top" ) +
  theme(plot.title.position = "plot")
potassium_plot

# plotting nitrate concentrations
nitrate_plot <- ggplot(data = nitrate_moving_avg,
                       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hugo, color = "dodgerblue") +
  theme_minimal() + 
  labs(x = NULL,
       y = "NO3-N mg l^-1") +
  theme(legend.position = "none")
nitrate_plot

# plotting magnesium concentrations
magnesium_plot <- ggplot(data = magnesium_moving_avg,
                         aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() +
  geom_vline(xintercept = hugo, color = "dodgerblue") +
  theme_minimal() +
  labs(x = NULL,
       y = "Mg l^-1") + 
  theme(legend.position = "none")
magnesium_plot

# plotting calcium concentrations
calcium_plot <- ggplot(data = calcium_moving_avg,
                       aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() + 
  geom_vline(xintercept = hugo, color = "dodgerblue") +
  theme_minimal() +
  labs(x = NULL,
       y = "Ca l^-1") + 
  theme(legend.position = "none")
calcium_plot

# plotting ammonium nitrate concentrations
amm_nitrate_plot <- ggplot(data = amm_nitrate_moving_avg,
                           aes(x = sample_date, y = moving_avg, linetype = sample_id)) +
  geom_line() + 
  geom_vline(xintercept = hugo, color = "dodgerblue") +
  theme_minimal() +
  labs(x = "Years",
       y = "NH4-N mg l^-1")  +
  theme(legend.position = "none")
amm_nitrate_plot