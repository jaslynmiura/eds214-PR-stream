# Self Assessment

## Automate

### [ ] **Running the entire analysis requires rendering one Quarto document**

-   Meets spec: My final analysis will be done in a final quarto doc (paper.qmd) that renders into a GitHub page.

### [ ] The analysis runs without errors

-   Not yet: Calculated moving average produces a large number that is incorrect. Something is wrong in the groupby() or sapply() function.

### [ ] **The analysis produces the expected output**

-   Not yet: Once moving average calculation is fixed I can produce the expected outcome - the figure remake. I will do this by creating a ggplot and using geom_smooth.

### [ ] **Data import/cleaning is handled in its own script(s)**

-   Not yet (Exceeds spec): If I have extra time I will create a script that cleans the data and then use the source function to call in that data.

## **Organize**

### [ ] Raw data is contained in its own folder

-   Meets spec: All raw data is in the data folder within the main directory.

### [ ] Intermediate outputs are created and saved to a separate folder from raw data

-   Not yet: I want to save my final figure in my output folder. I'll do this by using ggsave.

### [ ] **At least one piece of functionality has been refactored into a function in its own file**

-   Meets spec (Exceeds spec): The moving average function was created and saved in the moving_avg_func.R file and is then sourced in to my final quarto doc.

## **Document**

### [ ] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

-   Not yet: Initial README document was drafted, as I near completion I will add more detail into the README after doing some organization.

### [ ] **The README includes a flowchart and text explaining how the analysis works**

-   Not yet: After completing the final analysis I will create a flowchart.

### [ ] **The code is appropriately commented**

-   Meets spec (Exceeds spec): I provided detailed comments of what the lines of code are doing.

### [ ] **Variable and function names are descriptive and follow a consistent naming convention**

-   Meets spec (Exceeds spec): Variable and function names are named based on what was done to the variable. Example: PRM_clean_long indicates that PRM data set was cleaned, selecting only the columns we are interested in and pivoting the table from wide to long.

## **Scale**

### [ ] Running the environment initialization script installs all required packages

-   Meets spec: Installation of required packages happens at the beginning of the quarto doc.

### [ ] The analysis script runs without errors

-   Not yet: Script is running with errors since the moving average calculation is not working
