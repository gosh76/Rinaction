v1 <- c(23,45,6,7,8,9)
m1 <- matrix(1:8,nrow=2,byrow=T,dimnames = list(c('r1','r2'),c('c1','c2','c3','c4')))
m1
df1 <- data.frame(v1,5:10,25:30,row.names=c('R1','R2','R3','R4','R5','R6'))
df1
list1 <- list(v1,m1,df1)
list1
list1[[1]][1]
list1[[1]][4]
list1[[2]][1,2]
list1[[2]]['r2','c3']
list1[[3]]['R3',3]
list1[[3]]$v1
l2 = list(F=v1,S=m1,T=df1)
l2$F
l2$F[2]
l2$S
l2$S['r1','c2']
l2$T
l2$T[1,'v1']
