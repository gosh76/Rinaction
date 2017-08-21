age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
mean(weight)
sd(weight)
cor(age,weight)
plot(age,weight)
getwd()
ls()
history(4)
options(digits=3)
x <- runif(20)
summary(x)
hist(x)
y <- runif(20)*10
library()
search()
# practising a & b
a = c(23,34,12,54,67,87)
b = c(13,23,32,14,89,90)
a*b
a+b
a-b
a/b
mean(a)
median(a)
mean(b)
median(b)
sd(a)
sd(b)
cor(a,b)
plot(a,b)
pdf("Rinaction.pdf")
myymatrix <- matrix(1:10, nrow=2, ncol=5,byrow=TRUE)
mymatrix
myymatrix
myymatrix*2
matrix2 <- matrix(5:20,nrow=3,byrow=TRUE)
matrix2
rm(matrix2)
file.edit("~/.Renviron")
file.exists("~/.Renviron")
R_LIBS="E:/rWork/rLibrary"
matrix2 <- matrix(6:20,nrow=3,byrow=TRUE)
matrix2
rm(myymatrix)
matrix1 <- matrix(1:10,nrow=2,byrow=TRUE)
matrix1
m1 <- matrix1*matrix2
rm(matrix1)
rm(matrix2)
m1 <- matrix(1:6,nrow=3,byrow=TRUE)
m1
m2<- matrix(4:5,nrow=2)
m2
