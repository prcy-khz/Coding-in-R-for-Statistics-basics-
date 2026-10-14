#lm() is used to fit the linear regression
  #For multiple independent variables - Y~X1 + X2 +X3
    #4) plots as apart of linr=ear regression (residuals vs fitted, normal QQ, scale-location, Cooks Distance)
      

setwd("C:/Stat Data")
sales = read.csv("sales.csv")
View(sales)
attach(sales)

sales_reg = lm(sales~advertising + promotion + expenses, data = sales)

summary(sales_reg)

#Based on the F-statistic the model is highly significant
#Based on the RSE the model predicts sales with 1.292 error
#Based on the R^2 approximately 90% of the variation in the sales is explained by the three independent variables

#Check multicollinearity
cor(sales)

#The three independent variables are not highly correlated, the VIF values are relatively low
#There is no multicollinearity

#DIFFERENT PLOTS
    #Residual plot : shows if the residuals have nonlinear patterns; if thre residuals are equally spread around horizontal line, it is a good indication that there is linear relation
      plot(sales_reg, 1)
      
      
    #Normal QQ : shows if the residuals are normally distributed
      plot(sales_reg, 2)
      #Show approximate normality, 13 and 22 could be outliers
      
    
    #Scale Location : This plot shows if residuals are spread eqiually along the ranges and predictors
      #Also used to check the assumption of equal variences
      plot(sales_reg, 3)
      
    #Cooks Distance
      plot(sales_reg, 4)
      #This graph shows that 13, 16, 22 are outliers
      
      #We would try remove the outliers, and insignificant variables to improve the model