#Multivariate Relationship Models

#MLR- Multiple Linear Regression analysis
  #extension of the simple linear regression 
      #Used to model linear relationships between a single numerical response variable(dependent) - and multiple predictor variables (Independent)
          
#We must first do some data cleaning, we will check for data errors, treat missing data, inspect outliers
    #apply the following steps:
      #1) select the set of independent variables and run the regression
      #2) Evaluate Model Fit
      #3) Test Model Assumptions
      #4) Address potential problems with the data
      #5) Predict the final model

#Clean Data
  setwd("C:/Stat Data")
  mlr = read.csv("MLRdata.csv")  
  View(mlr)  
  #Check the the data type
  library(tidyverse)
  data("starwars")
  View(starwars)
  
  glimpse(starwars)
  
  #The gender is the wrong data type and changing it into a factor
  class(starwars$gender)
  unique(starwars$gender)
  starwars$gender = as.factor(starwars$gender)
  class(starwars$gender)  
  
  #Changing the levels for the gender
  levels(starwars$gender)
  starwars$gender = factor((starwars$gender), levels = c("masculine", "feminine"))  
  
  levels(starwars$gender)


  
  #Select what you are working with
  names(starwars)
  
  starwars %>% select(name, height, ends_with("color")) %>% names()
  
  #Find missing data
  mean(starwars$height, na.rm = TRUE)  #REMOVE every box that has no value
  
  #Find duplicates
  #Recoding Values
  
  