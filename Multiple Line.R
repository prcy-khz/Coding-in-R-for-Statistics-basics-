#Import the marks data into R
setwd("C:/Stat Data")
marks = read.csv("marks.csv")
attach(marks)

cor(marks)

#Creating Multiple Linear Regression - with Test 1 and Test 2as the multiple predictor variables
model1 = lm(Exam~Test1 + Test2)  #add the independent variables
summary(model1)
model1$coefficients

#The Linear Regression line for the :
  #For Test 1 : H(x) = 55.8701984 + 0.3967300x
  #For Test 2 : H(x) = 55.8701984 - 0.2732336x

#For the P-Vlaue:  the test is the null hypothesis that all the model coefficients are zero
    #p-value: 8.603e-15 < 0.05, reject the Ho, there is sufficient evidence that coefficients are zero

#Calculate Pearson correlation
cor(Test1, Test2, method = "pearson")
  #Strong positive linear Correlation

#Check the confidence Intervals for the model coefficients
confint(model1, conf.level= 0.95)

#Fit a model using all X variables
model2 = lm(Exam~Test1 + Test2)

#Ask for summary for the model

summary(model2)
#Based on F-statistic, the model is significant. 
#Based on the RSE we can say that the two semester test marks accurately predicts exam mark with about 0.48% error,
#Based on the R2, approximately 75% of the variation in exam marks is explained by the variation in the semester test marks in the mod
plot(model2)