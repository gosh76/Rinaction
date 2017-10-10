m1 = matrix(1:16,nrow=4)
m1
mean(m1[1,])
for (i in 1:nrow(m1)){
  print(mean(m1[i,]))
}
for (j in 1:ncol(m1)){
  print(mean(m1[,j]))
}
rowMeans(m1)
colMeans(m1)
addmargins(m1,c(1,2),FUN=list(mean,mean))
apply(m1,1,mean)
apply(m1,2,mean)
a1 = array(1:24,dim=c(3,4,2))
a1
apply(a1,c(1,3),sum)
apply(a1,1,sum)
apply(a1,2,sum)
apply(a1,3,sum)
apply(a1,1,mean)
apply(a1,c(1,2),mean)
apply(a1,c(1,3),mean)
apply(a1,c(2,3),mean)
apply(a1,c(1,2,3),sum)
apply(a1,c(2,3),sum)
apply(a1,c(1,3),sum)
(x = list(a=1,b=1:3,c=10:100))
lapply(x,FUN=length)
sapply(x,FUN=length)
(y = list(1:3,4:6,7:10))
lapply(y,FUN=length)
sapply(1:5,function(x) rnorm(3,x))
func2 = function(x){
  rnorm(3,x)
}
func2(1)
sapply(1:5,func2)
sapply(1:5,function(x) matrix(x,2,2))
sapply(1:5,function(x) runif(x,10,100))
Q1 <- matrix(c(rep(1,4),rep(2,4),rep(3,4),rep(4,4)),4,4)
Q1
Q2 <- mapply(rep,1:4,4)
Q2
Q3 <- mapply(rep,1:3,5)
Q3
mapply(function(x,y) x^y,x=c(4,3),y=c(1,2))
mapply(function(x,y) x+y,x=c(4,3),y=c(1,2))
mapply(function(x,y) x^y,c(a=2,b=3),c(A=3,B=4))
mapply(function(x,y) x-y,x=c(5,8),y=c(9,4))
mapply(function(x,y,z,k){(x+k)^(y+z)},c(a=2,b=3),c(A=3,B=4),MoreArgs = list(1,2))
mapply(function(x,y,z,k){(x+k)^(y+z)},x=c(a=2,b=3),y=c(A=3,B=4),MoreArgs = list(z=1,k=2))
A <- c(1,3,5,7,9)
C <- list(x=1,y=2)
D <- function(x) {x+1}
eapply(.GlobalEnv,is.function)
unlist(eapply(.GlobalEnv,is.vector))
by(mtcars$mpg,mtcars$am,FUN=mean)
by(warpbreaks[,1:2],warpbreaks[,"tension"],summary)
by(mtcars[,'disp'],INDICES = mtcars[,c('vs','am')],mean)
x
vapply(x,FUN=length,FUN.VALUE = 0L)
library(MASS)
school=painters$School
str(painters)
tapply(painters$Composition,painters$School,mean)
(M=matrix(1:12,ncol=3))
M+1
M+c(1,2)
M
M+c(1,2,3)
cbind(M,M+c(1,2,3))
(dx = colMeans(M))
sweep(M,2,dx,FUN='-')
(dy=rowMeans(M))
sweep(M,1,dy,FUN='+')
M
sweep(M,c(1,2),3,FUN='+')
