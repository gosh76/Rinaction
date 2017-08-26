m1 <- matrix(1:20,nrow=5,byrow=T)
m1
m2 <- matrix(c(2,34,56,89),ncol=1)
m2
v1 <- c(53,56,678,987)
v2 <- c(23,12,32,43)
v3 <- c(1,4,6,8)
m3 <- matrix(c(v1,v2,v3),nrow=3,byrow=T,dimnames=list(c('r1','r2','r3'),c('c1','c2','c3','c4')))
m3
m3[2,4]
m3[2:3,2:4]
m3[,c(2,4)]
m3['r1','c3']
m3[c('r1','r2'),c('c3','c4')]
m3[1,]
m3[,'c4']
m3[2,c(3,4)]
dim(m3)
m4 <- matrix(c(v3,v2,v1),ncol=6,dimnames=list(c('R1','R2'),c('C1','C2','C3','C4','C5','C6')))
m4
rownames(m4) <- c('r1','r2')
colnames(m4) <- c('c1','c2','c3','c4','c5','c6')
m4
rownames(m4) <- paste('R',1:2,sep='-')
m4
colnames(m4) <- paste('C',1:6,sep='-')
m4
m4[c('R-1','R-2'),c('C-1','C-2')]
m4['R-2','C-4']
v4 <- c(14,76)
m4 <- cbind(m4,v4)
m4
v5 <- c(12,23,34,56,45,32,21)
m4 <- rbind(m4,v5)
m4
m5 <- t(m4)
m5
e = c(m5)
e
m5[m5>43]
m5[m5>23,]
m5[m5[,2]>23,]
m5[m5[3,]>12,] # what is it doing?
m5[m5[5,]>45,]
