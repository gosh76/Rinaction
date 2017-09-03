a1 <- array(1:24,dim=c(4,3,2),dimnames=list(c('x1','x2','x3','x4'),c('y1','y2','y3'),c('z1','z2')))
a1
a2 <- array(1:40,dim=c(2,4,5),dimnames=list(c('x1','x2'),c('y1','y2','y3','y4'),c('z1','z2','z3','z4','z5')))
a2
a1[1,2,2]
a1[c(1,3),1,1]
sum(a1[c(1,3),1,1])
a1
a1[3,c(2,3),2]
sum(a1[3,c(2,3),2])
a2
a2[2,3,5]
a2[2,3,]
a2[,2,]
a2[1,,]
colnames(a2)
rownames(a2)
dim(a2)
dimnames(a2)
nrow(a2)
ncol(a2)
apply(a2,c(1),sum)
apply(a2,c(2),sum)
apply(a2,c(3),sum)
