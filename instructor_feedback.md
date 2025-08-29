## **Collaborate**

Peer feed back went well, where I received helpful feed back from Vedika on how to organize my data cleaning code. This was helpful as my paper.qmd is now clean and includes the most important parts of code needed for my analysis. Vedika provided suggestions on how to meet the intermediate output spec. I plan on doing this by saving my individual nutrient plots in my figs folder. Now that I resolved the issues that Vedika and myself made, I feel that I can add more detail to my README file. As I was providing feedback to Lucian, I made sure to make note of specs that were almost met and gave specific ideas of how the spec could be met or what was already done to partly meet the spec. I when reviewing Lucian's code I also noticed that he had a different number of observation values after joining his data and made sure he was aware of this through an issue I created in his repository.

### Closed Issues

<https://github.com/jaslynmiura/eds214-PR-stream/issues/13>

<https://github.com/jaslynmiura/eds214-PR-stream/issues/12>

<https://github.com/jaslynmiura/eds214-PR-stream/issues/10>

### Merge Request

<https://github.com/jaslynmiura/eds214-PR-stream/commit/4cebd521ff39be9338fcb6ef217df652d7765eab>

# Instructor feedback

## Automate

[M] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[NY] **The analysis produces the expected output**

-   Your output looks great! It should be one figure instead of multiples, though.

[NY] **Data import/cleaning is handled in its own script(s)**

-   Your data handling script is in scratch/. That's just for testing things out! Anything your analysis relies on should be moved out of there.

## Organize

[M] Raw data is contained in its own folder

[NY] Intermediate outputs are created and saved to a separate folder from raw data

-   paper.qmd sources data_cleaning_and_tidying.R, but the latter script should be creating outputs that paper.qmd can read in.

[NY] **At least one piece of functionality has been refactored into a function in its own file**

-   Function definitions should go in the R/ directory.

## Document

[NY] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

-   Your README is very light and needs to be fleshed out.

[NY] **The README includes a flowchart and text explaining how the analysis works**

-   See above

[M] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[NY] Running the environment initialization script installs all required packages

-   I don't see a script that installs the required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
