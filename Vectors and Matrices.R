x1 = c(1,3,5,7,9)
gender = c("male", "female")

2:7

seq(from = 1, to = 7, by=1)
seq(from = 1, to = 100, by = 0.5)
rep(1, times = 100)

rep(1:5, times = 5)

rep(seq(from = 2,to = 5, by = 0.5), times=5)

x = 1:5

y = c(1,3,5,7,9)

x+10

#if vectors have the same number of elements you can add/sub/mult/div

x+y

x*y

#Extracting

y[3]

y[-3]

y[c(1,5)]


#Matrices
mat = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)

mat[1,2]

mat[c(1, 3), 2]
