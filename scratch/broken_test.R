## SCRATCH THIS CODE
# this is to just practice pull requests

source("broken_moving_avg_funct.R")

# testing that the function gives us a realistic output for ONE input
ca_ma_once <- broken_moving_average(focal_date = as.Date("1991-09-03"),
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
