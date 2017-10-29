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

M+1
M+c(1,2)
M+c(1,2,3)
cbind(M,M+c(1,2,3))
(dx = colMeans(M))
sweep(M,2,dx,FUN='-')
sweep(M,2,dx,FUN='*')
sweep(M,2,dx,FUN='^')
cbind(M,M[,1]*M[,2])
rbind(M,M[1,]*M[2,])
