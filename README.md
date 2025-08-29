# Nutrients in Puerto Rico Streams Before and After Hurricane Hugo

This is the GitHub repository for Jaslyn Miura's analysis of Puerto Rico Stream data for EDS 214.

For this assignment we were tasked with recreating the following figure (Schaefer, et al, 2000):

![](images/eds214-figure3.png)

## Directory

The eds214-PR-stream directory contains:

**data**: raw and derived data

**outputs**: intermediate data sets that have been cleaned and/or mutated and then saved as rds files to be called into paper.qmd

**figs**: final plot

**paper**: final qmd document that renders to a GitHub Page

**scratch**: R scripts that attempt the analysis

**images**: images used in README

### R Files: Operations that have been done on the data to complete the analysis and get to the visualization process. R scripts should be run in numerical order before rendering the quarto document (paper.qmd)

**0_initalization.R** : first step, install packages required for analysis

**01_data_cleaning.R** : cleaning the raw data

**02_moving_avg_cal**: using the moving_average function to calculate the moving average on our entire cleaned dataset

**03_individ_nutri_subsets.R** : creating subsets based on nutrient for plotting purposes

The following work flow was used to recreate the figure:

![](images/eds214_PRstreams_flowchart.png)

Using the data within this directory and the workflow the following figure was produced along with a final paper.qmd file that creates a GitHub Page upon rendering:

![](figs/figure_3.png)

### References

Schaefer DouglasA, McDowell WH, Scatena FN, Asbury CE. Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico. *Journal of Tropical Ecology*. 2000;16(2):189-207. <doi:10.1017/S0266467400001358>

McDowell, W. and International Institute of Tropical Forestry(IITF), USDA Forest Service.. 2024. Chemistry of stream water from the Luquillo Mountains ver 4923064. Environmental Data Initiative. <https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458> (Accessed 2025-08-29).
