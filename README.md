# Modeling Take Rate for Internet Services

## Introduction
This project focuses on developing a predictive model to estimate the internet take rate—defined as the ratio of the number of subscribers to the total number of subscriber passings in a given region—for an internet service provider operating across New England. The model leverages demographic, economic, and infrastructure-related variables to predict take rate in specific population areas. MATLAB functions such as `fitlm` for fitting linear models, `anova` for analysis of variance, `predict` for generating predictions based on the model, and `coefCI` for computing confidence intervals of the model coefficients were utilized to conduct regression analysis and evaluate the model's performance.

## Purpose
The primary objective of this project is to develop and refine a mathematical model that can accurately predict internet take rates across different regions. The project includes two phases: constructing an initial model using state-level data and subsequently refining this model by incorporating adjustments to better represent real-world conditions and validating it with community-level data.

## Significance
Understanding and predicting internet take rates is crucial for service providers looking to expand their networks and offer services in underserved areas. A reliable predictive model helps in making informed decisions about network expansion, optimizing resource allocation, and enhancing service availability. This project is particularly significant as it not only develops an initial model but also highlights the importance of refining predictive models to account for real-world data discrepancies, thus improving their reliability and applicability.

## Project Overview
### Data Collection:
Data was sourced from the 2010 U.S. Census, the FCC, and other publicly available datasets. Ten variables were initially considered, including population, median income, age distribution, home ownership rates, education levels, and the number of available internet providers. The training data used to build the model is available in the file `Training_Data.txt`, and the test data for model validation is in `Testing_Data.txt`.

### Part 1: Initial Model Construction:
1. Linear Model Fitting: The initial model was constructed using the `fitlm` function in MATLAB, which fit a linear model to the data. This model included all ten variables to assess their impact on internet take rates.
2. Analysis of Variance: The significance of the model was further evaluated using the `anova` function, which performed an analysis of variance to determine the contribution of each predictor variable to the model.

### Part 2: Model Refinement and Validation:
3. Model Prediction: Predictions based on the refined model were generated using the `predict` function, which applied the model to new data to estimate take rates.
4. Confidence Intervals: The confidence intervals for the model coefficients were computed using the `coefCI` function, providing insights into the reliability and significance of each predictor in the model.
5. Validation with Community-Level Data: The model was further validated using take rate data from small towns, obtained from municipal broadband networks and stored in the `Testing_Data.txt` file. This step revealed mixed results, indicating that while the state-level model provided some predictive value, it might not fully capture the dynamics at the community level, necessitating further refinement and potentially the development of a town-level model.

## Findings and Conclusions
### Model Performance:
The initial model explained a significant portion of the variability in internet take rates. The refined model, which accounted for real-world data discrepancies, provided a realistic representation of take rates, but its accuracy varied at different geographic levels.

### Significant Predictors:
The original (full) model identified key predictors such as the percentage of the population over 65, median household income, percentage of the population who work at home, and the percentage of the population with 3+ internet providers as being the most influential in determining take rates. The revised (reduced) model found median household income and percentage of the population with 3+ internet providers to be statistically significant at predicting internet take rates.

### Model Limitations:
The validation step with community-level data indicated that the state-level model might not be fully reliable for smaller regions, suggesting the need for a more localized model to improve accuracy.

## References
This project utilized MATLAB for data analysis and model construction, employing functions such as fitlm, anova, predict, and coefCI for model fitting, evaluation, and prediction. The training data used is available in Training_Data.txt, and the test data in Testing_Data.txt. Detailed code and further documentation are available in the repository.
