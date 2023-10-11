# Heart_Disease_Prediction_using_Logistic_Regression

</div>

<h3 align="right-aligned" style="font-size: 20px; color: #800080; font-family: Georgia;">
    <span style="color: #008080;"> Author:</span> 
    <span style="color: black;">Deepti Vijay Khandagale</span>
</h3>
<p align="right-aligned">
  <img src=" " width="600" height="400">
</p>

## Table of Contents
- [Project Objective](#project-objective)
- [Business Understanding](#business-understanding)
- [Background](#background)
- [Dataset Overview](#dataset-overview)
- [Methodology](#methodology)
- [Data Cleaning](#data-cleaning)
- [Exploratory Analysis](#feature-engineering)
- [Training Model](#training-model)
- [Prediction and Model Comparison](#prediction-and-model-comparison)
- [Conclusion](#conclusion)
- [References](#references)
- [File Directory](#file_directory)

## Project Objective

- The objective of this project is to develop a prediction models to predict the risk of a heart disease in a patients by utiliziing 11 clinical measures.

## Business Understanding

The World Health Organization (WHO) estimates that 17.9 million people die from cardiovascular diseases (CVDs), which are the leading cause of death worldwide in the year 2022. It is possible to reduce the numbers of premature death caused by cardiovascular diseases (CVDs) if it is diagnosed in earlier stage. By studying the diagnostic test results of the people, it is possible to detect if the patient is at the high risk of cardiovascular disease. This analysis can be achieved with the help of the machine learning models. Through this project, we intend to develop a prediction models to understand existing data and filter out the target population who could benefit by taking precautionary measures at early stages. This analysis will help the patients who are at high risk of cardiovascular disease to take precautionary measures. The goal of this project is to predict how susceptible a patient is to a cardiovascular disease (CVD) based on the various diagnostic test measures in the database. In this project, we will use multiple machine learning models and test each model’s accuracy using Classification Accuracy, Confusion Matrix, Precision, Recall and the F1 Score. They each help us evaluate the models and chose a robust model. Typically, in a business model, Naive Bayes and Logistic Regression are the go-to for ranking predictions by probability, however, we will also try other tress-based models which are better is interpretation. We will use R language to perform the analysis and building a model. The data which we will be using for the analysis is taken from the Kaggle.

## Background

- This project is entirely based on the **Heart Failure Prediction Dataset** Kaggle Competition. With a dataset comprising **12 variables** and **918 observations**, it covers nearly every aspect of residential homes in Ames, Iowa. 
- You can access the dataset by following this link: [Heart Failure Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)
- This project will utilize R language for analysis and developing predicting model.

## Dataset Overview

- There is a single dataset. The dataset consists of 81 variables and 918 observations. This heart disease dataset is a combination of 5 heart datasets pooled across 11 shared features.
- The target variable that I want to predict is the 'Heart Disease'. This column has a Booean datatype (for instance, '1' or '0')

## Methodology
This project followed these steps:
1. **Data Quality and Cleaning:** Exploratory data analysis was conducted to check data quality and data cleaning was performed.
2. **Feature Engineering:** Feature engineering to enhance model's performance.
3. **Training Model:** 3 machine learning models are used.
4. **Prediction and Model Comparison:** Compared model performances using metrics Area uder ROC curve.

## Data Cleaning
There are no missing values in this data. The data is very clean. There are 6 categorical columns, 5 integer columns and 1 decimal columns. The only data quality issue was found with the 6 character variables, which are converted into the factor variables.

## Exploratory Analysis


## Training Model

Before training model, it is important to check the linearity assumption by plotting a histogram of our target variable sale price. The left graph given below is the distribution of the **Sales Price** and we can see that the sale price distribution is rightly skewed which means that the assumption of linearity may not be true here. In order to mitigate this, I took the natural log of the sale price and check the distribution. On the right it be can seen that the log distribution looks normally distributed, hence I shall be training this model using the Log of the target variable. 

I employed Multiple Linear Regression (with Cross Validation), Ridge Linear Regression (with Cross Validation), Lasso Linear Regression (with Cross Validation), and Random Forest regression models.

1. Multiple Linear Regression (with Cross Validation)

In multiple linear regression, the output of the data is interpreted using the diagnostics plot:
-Residual v/s fitted graph doesn't show any pattern in the graph, which means that there is no non-linear relationship between the predictor and outcome variables 
- Normal Q-Q:The residuals are normally distributed. The points forming but there are few outliers at the lower side
- Scale-Location: This graphs checks the assumption of homoscedasticity and as seen the residuals are scattered randomly which satisfies assumption
- Residual vs Leverage: This graphs help us to identify the influential outliers that might affect the analysis and here outside Cook's distance (red dotted) we find two outliers.


   
2. Ridge Linear Regression (with Cross Validation)

In Ridge linear regression, it penalize using Lamda on the co-efficient, if lamda is increasing, the co-efficients tends towards zero. We find the best lamda, which gives us the important variables for our model. So here, the best lamda is 0.25 and it provides the top 30 important variables as Condition2PosN, Condition2PosA, FunctionalSev, FunctionalMaj2, RoofMatWdshngl, ExtFirstBrkComm and so on.



3. Lasso Linear Regression (with Cross Validation)

In lasso regression, the lamda shrinks coefficient completely to zero and removes the unnecessary predictors. So here, the best lamda is very small 0.05 and it provides the top 30 important variables as . The topmost variables are OverallQual, GarageCars, KitchenQual, MSZoningRM and BsmtQual



4. Random Forest regression

In random forest, Mean of squared residuals: 0.01841201 means the prediction error. 88.45% variance is explained by the variables. In the first plot, the higher the increase in MSE, the important is the variable. we see that GrLivArea, Neighborhood, TotalBsmiSF and so on are most important. In second, node purity is depended on the Gini Index and here the important variables are Overall Qual, Neighborhood, GrLivArea etc.



## Prediction and Model Comparison
We applied the trained models to the test dataset and evaluated their performance using RMSE. The model who has the lowest RMSE is the best from the other in predicting the target variable. In this terms, Lasso regression yielded the lowest RMSE, making it the best choice for predicting house prices.



## Conclusion
As per the analysis on the test data, it is seen that Root Mean Square error of Lasso regression is lowest and hence we select the **Lasso Regression** the best fit for our prediction of sale price.The topmost variables are **OverallQual, GarageCars, KitchenQual, MSZoningRM and BsmtQual.**

## Recommendation

As per the analysis, it is identified that the features/factors such as Overall Quality of the House, Garage size, the location or zone and the basement quality plays importamt role in deciding the price of the house. The Lasso Regression model will give the best estimate than any other model for predicting the house price based on different factors.

## References

- Kaggle House Price Prediction Competition: [Link](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/overview)
- R Documentation: [Link](https://www.rdocumentation.org/)
- Output Summary: [GitHub Repository](https://github.com/Deepti1206/House_Price_Prediction_Project)

## File Directory

- [`Codes`](https://github.com/Deepti1206/House_Price_Prediction_Project/tree/main/Codes)
- [`Visuals`](https://github.com/Deepti1206/House_Price_Prediction_Project/tree/main/Visuals)
- [`Data`](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/overview)


