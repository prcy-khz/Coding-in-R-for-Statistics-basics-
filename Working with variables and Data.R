setwd("C:/Stat Data")
marks = read.csv("marks.csv")
View(marks)

mean(marks$Test1)
attach(marks)
mean(Test1)

summary(marks)
s
Test1[11:14]

aveFailed = mean(Test1[Test1 < 50])

dim(aveFailed)

summary(aveFailed)
