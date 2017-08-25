m1 <- matrix(1:12,nrow=3,byrow=T)
m1
m1[2,3]
m1[3,4]
m1[,c(1,3)]
m1[, c(1,3,4)]
m1[,1:3]
m1[2:3,2:4]
class(m1)
dim(m1)
m1[-2,-3]
m1[2,4]
colnames(m1) <- c('a','b','c','d')
m1
rownames(m1) <- c('r1','r2','r3')
m1
m1['r1','b']
m1['r2','c']
m1[c('r1','r2'),]
m1[c('r1','r3'),c('a','c')]
v1 = paste('s',1:5,sep='-')
v1
m2 = matrix(1:9,nrow=3,byrow=T)
m2
m2[2:3,1:2]
colnames(m2) <- paste('c',1:3,sep='')
m2
rownames(m2) <- paste('r',1:3,sep='-')
m2
m2[c('r-1','r-3'),c('c2','c3')]
z = c(23,34,45)
cbind(m2,z)
m2
d = c(65,75,98)
rbind(m2,d)
m2 <- cbind(m2,d)
m2
f = c(12,23,45,67)
m2 <- rbind(m2,f)
m2
y = t(m2)
y
e = c(m2)
e
m1
m1[m1[,2]>5,]
q()
