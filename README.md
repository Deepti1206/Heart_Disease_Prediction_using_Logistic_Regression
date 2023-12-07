# Heart_Disease_Prediction_using_Logistic_Regression

</div>

<h3 align="right-aligned" style="font-size: 20px; color: #800080; font-family: Georgia;">
    <span style="color: #008080;"> Author:</span> 
    <span style="color: black;">Deepti Vijay Khandagale</span>
</h3>
<p align="right-aligned">
  <img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/images%20(1).jpeg" width="600" height="400">
</p>

## Table of Contents
- [Project Objective](#project-objective)
- [Business Understanding](#business-understanding)
- [Background](#background)
- [Dataset Overview](#dataset-overview)
- [Methodology](#methodology)
- [Data Cleaning](#data-cleaning)
- [Exploratory Analysis](#exploratory-analysis)
- [Training Model](#training-model)
- [Prediction and Model Comparison](#prediction-and-model-comparison)
- [Conclusion](#conclusion)
- [References](#references)
- [File Directory](#file_directory)

## Project Objective

- The objective of this project is to develop a prediction models to predict the risk of a heart disease in a patients by utiliziing 11 clinical measures.

## Business Understanding

The World Health Organization (WHO) estimates that millions of people die from cardiovascular diseases (CVDs), which are the leading cause of death worldwide in the year 2022. It is possible to reduce the numbers of premature death caused by cardiovascular diseases (CVDs) if it is diagnosed in earlier stage. By studying the diagnostic test results of the people, it is possible to detect if the patient is at the high risk of cardiovascular disease. This analysis can be achieved with the help of the machine learning models. Through this project, I intend to develop a prediction models to understand existing data and filter out the target population who could benefit by taking precautionary measures at early stages. This analysis will help the patients who are at high risk of cardiovascular disease to take precautionary measures. The goal of this project is to predict how susceptible a patient is to a cardiovascular disease (CVD) based on the various diagnostic test measures in the database.

## Background

- This project is entirely based on the **Heart Failure Prediction Dataset** Kaggle Competition. With a dataset comprising **12 variables** and **918 observations**, it covers nearly every aspect of residential homes in Ames, Iowa. 
- You can access the dataset by following this link: [Heart Failure Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)
- This project will utilize R language for analysis and developing predicting model.

## Dataset Overview

- There is a single dataset. The dataset consists of 12 variables and 918 observations. This heart disease dataset is a combination of 5 heart datasets pooled across 11 shared features.
- The target variable that I want to predict is the 'Heart Disease'. This column has a Boolean datatype (for instance, '1' or '0')

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/1h.png" width="500" height="350">

## Methodology
This project followed these steps:
1. **Data Quality and Cleaning:** Exploratory data analysis was conducted to check data quality and data cleaning was performed.
2. **Exploratory analysis:** To find the correlation between heart disease and differnt factors
3. **Training Model:** 3 machine learning models are used.
4. **Prediction and Model Comparison:** Compared model performances using metrics Area uder ROC curve.

## Data Cleaning
There are no missing values in this data. The data is very clean. There are 6 categorical columns, 5 integer columns and 1 decimal columns. The only data quality issue was found with the 6 character variables, which are converted into the factor variables.

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/2h.png" width="500" height="350">

## Exploratory Analysis

A correlation analysis was used to study the linear relation between different variables. Here is the heatmaop of correlation analysis.

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/3h.png" width="500" height="400">

## Training Model

I am going to use 3 classification model since out target variable **Heart Disease**, which is a categorical column with '0' and '1'.

I employed Logistic Regression, Decision Tree and, Random Forest models.

**1. Logistic Regression**

In logistic regression, the output of the data predicted is a categorical variable. Below is the ROC of the logistic regression. If the curve is close senstivity line, the  model is performing better.

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/5h.png" width="500" height="350">

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/4h.png" width="500" height="350">

**2. Decision Tree**

In Decision tree, a data is split as per the most important features in order to classify or predict data in classes.
It also finds out important features such as 

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/6h.png" width="500" height="350">

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/6.1h.png" width="500" height="350">

3. Random Forest 

Random forest is an algorithm for supervised learning. An ensemble of decision trees making it a forest, often trained using the bagging approach.

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/7h.png" width="500" height="400">

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/8.1h.png" width="500" height="400">

## Prediction and Model Comparison

After evaluating the accuracy of the model based on the ROC_curve, we find that the accuracy of the **Logistic Regression** is the best which is 92%.

<img src="https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Image/8h.png" width="650" height="500">

## Conclusion
As per the analysis on the test data, it is seen that the area under ROC curve of Logistic regression is the best **(92%)** and hence we select the **Logistic Regression** the best fit for our prediction of heart disease. The topmost variables are **Chest Pain type, Sex, Cholesterol, Fastings and Exercise Angina.**

## Recommendation

As per the analysis, it is identified that the factors such as Chest Pain type, Sex, Cholesterol, Fastings and Exercise Angina plays an important factors in predicting the heart disease. The Logistic Regression model will give the best estimate than any other model for predicting the heart disease in a patient with 92% accuracy.

## References

- [Heart Failure Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction)
- R Documentation: [Link](https://www.rdocumentation.org/)

## File Directory

[Codes](https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/blob/main/Heart_disease_prediction.R)   
[Data](https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/tree/main/Data)   
[Images](https://github.com/Deepti1206/Heart_Disease_Prediction_using_Logistic_Regression/tree/main/Image)




