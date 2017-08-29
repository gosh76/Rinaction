m1 <- matrix(1:6,nrow=2,byrow=T)
m1
m1[1,3]
m1[2,2]
m1[1:2,2:3]
m1[,2:3]
m1[2,]
m2 <- matrix(c(23,43,54,67,89),ncol=1)
m2
m3 <- matrix(c(23,43,54,67,89,78),ncol=2)
m3
m4 <- matrix(c(54,67,98,54,38,91),nrow=2,byrow=T)
m4
m3[1:2,2]
m3[2:3,]
v1 <- c(12,23,34,45,56,67)
v2 <- c(46,43,21,75,73,95)
v3 <- c(90,80,70,60,50,40)
m5 <- matrix(c(v1,v2,v3),nrow=3,byrow=T)
m5
m6 <- matrix(c(v1,v2,v3),ncol=3)
m6
m6[2:4,1:2]
colnames(m5) <- c('a','b','c','d','e','f')
rownames(m5) <- c('r1','r2','r3')
m5
nrow(m5)
ncol(m5)
m7 <- matrix(c(v1,v2),nrow=2,byrow=T,dimnames=list(c('r1','r2'),c('c1','c2','c3','c4','c5','c6')))
m7
dim(m7)
m7['r1',c('c1','c3','c5')]
colnames(m7) <- paste('c',1:6,sep='-')
m7
v4 <- c(13,24,36,57,58,69)
m7 <- rbind(m7,v4)
m7
m7 <- cbind(m7,c(45,76,89))
m7
m8 <- t(m7)
m8
e = c(m7)
e
m7
colnames(m7)[7] = 'c-7'
m7
rownames(m7)[3] = 'r3'
m7
m7[m7>50]
m7[m7[2,]>50]
m7[2,]
m7[2,]>50
