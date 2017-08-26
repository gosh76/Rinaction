a1 <- array(1:24,c(2,3,4))
a1
a2 <- array(1:24,c(4,3,2))
a2
dimnames(a2) <- list(c('x1','x2','x3','x4'),c('y1','y2','y3'),c('z1','z2'))
a2
a3 <- array(1:6,c(3,2,1),dimnames=list(c('x1','x2','x3'),c('y1','y2'),c('z1')))
a3
a4 <- array(1:60,c(3,4,5),dimnames=list(c('x1','x2','x3'),c('y1','y2','y3','y4'),c('z1','z2','z3','z4','z5')))
a4
a5 <- array(1:60,c(5,4,3),dimnames=list(c('x1','x2','x3','x4','x5'),c('y1','y2','y3','y4'),c('z1','z2','z3')))
a5
a5[2,3,2]
a5[c(2,3),3,2]
a5[c(4,5),c(2,3),c(2,3)]
colnames(a5)
rownames(a5)
dimnames(a5)
dimnames(a5)[2]
dimnames(a5)[3]
dim(a5)
nrow(a5)
ncol(a5)
dimnames(a5)
dimnames(a5)[1]
length(a5)
class(a5)
a5
a5[,,3]
a5[2,,]
apply(a5,c(1),sum)
apply(a5,c(2),sum)
apply(a5,c(3),sum)
