#Simple Linear Regression
setwd("C:/Stat Data")
marks = read.csv("marks.csv")
View(marks)

attach(marks)

#Model the relationship between test 2 and the exam

plot(Test2, Exam, main = "Scatterplot")
cor(Test2, Exam)


#Fit the linear regression in the date using lm()
mod = lm(Exam~Test2)
mod
summary(mod)
# The Linear Regression Line - H(x) = 51.84901 + 0.12382x

attributes(mod)

mod$coefficients           #That'll give you the y-intercept and the slope


#Add the Regression line to the plot
plot(Test2, Exam, main = "Scatterplot")
abline(mod, col = "red", lwd = 2)


#Create the Confidence Intervals for sig level = 0.01
confint(mod, level = 0.99)
summary(mod)
