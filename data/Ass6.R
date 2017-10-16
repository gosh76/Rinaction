#Creating a vector of 40 integer values
v1 <- ceiling(seq(10,200,length.out=40))
v1
#Creating a 5X8 matrix
M = matrix(v1,ncol=8)
M
#return product of each of rows
apply(M,1,prod)
#return sum of each of columns
apply(M,2,sum)
# modulo of matrix values
M1 = sweep(M,1,10,FUN='%%')
M1
# odd nos.in each column
M2 = sweep(M1,1,2,FUN='%%')
M2
apply(M2,2,sum)
# viewing iris dataset
i = iris
i
# mean of first 4 variables specieswise
agg <- aggregate(i,by=list(i$Species),FUN=mean,na.rm=TRUE)
agg
# Q2 - create new environment
e <- new.env()
# create 2 environment variables
e$a <- matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
# mean of two variables
mean(e$a)
mean(e$b)
class(e$a)
class(e$b)
# Q3 - list
l1 <- list(1:20,55:100,mtcars$mpg,mtcars$wt)
l1
# apply sum to each element of list l1
lapply(l1,sum)
# results in vector form
sapply(l1,sum)