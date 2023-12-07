setwd(getwd())

# Loading all the necessary packages from library

library(tidyverse)
library(skimr)
library(dplyr)
library(ggplot2)
library(rcompanion)
library(rpart)
library(randomForest)
library(tidymodels)
library(reshape2)
library(vip)

# Reading the data

df_heart <- read.csv("heart.csv")
skim(df_heart)
str(df_heart)

# Converting the characters into factor data types

df_heart[sapply(df_heart, is.character)] <- lapply(df_heart[sapply(df_heart, is.character)], 
                                       as.factor)
str(df_heart)

df_heart$HeartDisease <- as.factor(df_heart$HeartDisease)
str(df_heart)


#View(df_heart)
# Heart disease no = 0 and Heart disease Yes = 1

# Checking the correlation

corr_heart_df <- df_heart %>% select(Age, RestingBP,Cholesterol, FastingBS,
                                     MaxHR, Oldpeak, HeartDisease)
corr_heart_df$HeartDisease <- as.numeric(corr_heart_df$HeartDisease)
str(corr_heart_df)
corr_heart <- round(cor(corr_heart_df),2)
head(corr_heart)

melt_corr_heart <- melt(corr_heart)

plot_corr <- ggplot( data = melt_corr_heart, aes( x= Var1, y= Var2, 
                                                  fill=value)) + geom_tile() +
  geom_text(aes(Var2, Var1, label= value))
plot_corr

# Splitting the data into test & train sets

set.seed(174)

split_heart <- initial_split(df_heart, prop = 0.70, strata = HeartDisease)

test_heart <- split_heart %>% testing()

train_heart <- split_heart %>% training()

# Feature Engineering using recipe

recipe_heart <- recipe(HeartDisease ~., data = train_heart) %>%
  step_YeoJohnson(all_numeric(), -all_outcomes()) %>%
  step_normalize(all_numeric(), -all_outcomes()) %>%
  step_dummy(all_nominal(), -all_outcomes())

recipe_heart %>% prep(training = train_heart) %>%
  bake(new_data = NULL)

##### Logistic Regression #####

# Specify the model

logistic_model <- logistic_reg() %>%
  set_engine('glm') %>%
  set_mode('classification')

# Creating a workflow

workflow_heart <- workflow() %>%
  add_model(logistic_model) %>%
  add_recipe(recipe_heart)

# Fitting the model

logistic_fit_heart <- workflow_heart %>% fit(data = train_heart)

# Evaluating the model

trainedmodel_heart <- logistic_fit_heart %>% 
  extract_fit_parsnip()

vip(trainedmodel_heart)

# Chest pain type, Sex, Cholesterol, Fastings and Exercise Angina are the top
# important features

predictions_heart <- predict(logistic_fit_heart, 
                                  new_data = test_heart)

predictions_prob_heart <- predict(logistic_fit_heart, 
                                     new_data = test_heart, 
                                     type = 'prob')

test_results <- test_heart %>% select(HeartDisease) %>% 
  bind_cols(predictions_heart) %>% 
  bind_cols(predictions_prob_heart)

test_results

# Evaluating performance of the model

conf_mat(test_results, 
         truth = HeartDisease, 
         estimate = .pred_class)

# ROC curve

roc_curve(test_results, 
          truth = HeartDisease,
          estimate = .pred_0)

roc_curve(test_results, 
          truth = HeartDisease, 
          estimate = .pred_0) %>% 
  autoplot()

roc_auc(test_results,
        truth = HeartDisease, 
        estimate = .pred_0)

# Accuracy = 92%

#### Decision Tree ####

set.seed(174)

heart_folds <- vfold_cv(train_heart, v = 5)

heart_tree_model <- decision_tree(cost_complexity = tune(),
                            tree_depth = tune(),
                            min_n = tune()) %>%
  set_engine('rpart') %>%
  set_mode('classification')

heart_tree_workflow <- workflow() %>% 
  add_model(heart_tree_model) %>% 
  add_recipe(recipe_heart)

heart_tree_grid <- grid_regular(cost_complexity(),
                          tree_depth(),
                          min_n(), 
                          levels = 2)

heart_tree_grid <- grid_regular(parameters(heart_tree_model), 
                          levels = 2)

set.seed(174)

tree_tuning <- heart_tree_workflow %>% 
  tune_grid(resamples = heart_folds,
            grid = heart_tree_grid)

tree_tuning %>% show_best('roc_auc')

best_tree <- tree_tuning %>% 
  select_best(metric = 'roc_auc')
best_tree

final_tree_workflow <- heart_tree_workflow %>% 
  finalize_workflow(best_tree)

tree_wf_fit <- final_tree_workflow %>% 
  fit(data = train_heart)

tree_fit <- tree_wf_fit %>% 
  extract_fit_parsnip()

vip(tree_fit)

# ST_Slope, Oldpeak, Max HR, Exercise Angina and Chest pain type are top 5 imp features

tree_last_fit <- final_tree_workflow %>% 
  last_fit(split_heart)

tree_last_fit %>% collect_metrics()

tree_last_fit %>% collect_predictions() %>% 
  roc_curve(truth  = HeartDisease, estimate = .pred_0) %>% 
  autoplot()

# Accuracy = 83%

#### Random Forest ####

heart_rf_model <- rand_forest(mtry = tune(),
                        trees = tune(),
                        min_n = tune()) %>% 
  set_engine('ranger', importance = "impurity") %>% 
  set_mode('classification')

tree_rf_workflow <- workflow() %>% 
  add_model(heart_rf_model) %>% 
  add_recipe(recipe_heart)

set.seed(174)

rf_grid <- grid_random(mtry() %>% range_set(c(2, 4)),
                       trees(),
                       min_n(),
                       size = 10)
rf_grid

set.seed(174)

rf_tuning <- tree_rf_workflow %>% 
  tune_grid(resamples = heart_folds,
            grid = rf_grid)

rf_tuning %>% show_best('roc_auc')

best_rf <- rf_tuning %>% 
  select_best(metric = 'roc_auc')
best_rf

final_rf_workflow <- tree_rf_workflow %>% 
  finalize_workflow(best_rf)

rf_wf_fit <- final_rf_workflow %>% 
  fit(data = train_heart)

rf_fit <- rf_wf_fit %>% 
  extract_fit_parsnip()

vip(rf_fit)

# ST_slope, Exercise Angina, OldPeak, MaxHR and Cholesterol are the 5 imp features

rf_last_fit <- final_rf_workflow %>% 
  last_fit(split_heart)

rf_last_fit %>% collect_metrics()

rf_last_fit %>% collect_predictions() %>% 
  roc_curve(truth  = HeartDisease, estimate = .pred_0) %>% 
  autoplot()

# Accuracy = 87%

# We have used 3 models for prediction. 
# 1. Logistic Regression
# 2. Decision Tree
# 3. Random Forest
# After evaluating the accuracy of the model based on the ROC_curve, we find that the
# the accuracy of the Logistic Regression is the best which is 92% 