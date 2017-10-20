m1 <- matrix(1:24,nrow = 6)
m1
m1[1,2]
m1[,c(2,4)]
m1[c(1,4),c(2,4)]
m1[1:2,]
m1
m1[2:5,3:4]
m2 <- matrix(c(12,34,56),ncol = 1)
m2
m3 <- matrix(c(13,54,76,89),ncol = 2,dimnames = list(c('r1','r2'),c('c1','c2')))
m3
m4 <- matrix(c(18,29,38,47,46,23),nrow = 2,byrow = T)
m4
m3['r1','c2']
m3[,'c2']
v1 <- c(1,4,5,6,7)
v2 <- c(9,8,7,6,3)
v3 <- c(23,545,677,78,665)
m5 <- matrix(c(v1,v2,v3),nrow = 3,byrow = T)
m5
m6 <- matrix(c(v1,v2,v3),ncol = 3)
m6
colnames(m6) <- paste('c',1:3,sep='-')
m6
rownames(m6) <- paste('r',1:5,sep = '-')
m6
m6['r-1','c-3']
m6[c('r-1','r-3'),c('c-2','c-3')]
dim(m6)
m6
v4 <- c(345,567,876)
m7 <- rbind(m6,v4)
m7
v5 <- c(12,33,23,65,78,89)
m8 <- cbind(m7,v5)
m8
m9 <- t(m8)
m9
e = c(m8)
e
m9
m9['c-1','r-2']=67
m9
colnames(m9)[3] = 'col3'
m9
rownames(m9)[4] = 'c-4'
m9
m9
m9[m9>300]
m9[,2]>500
which(m9==max(m9),arr.ind = T)# to find location of max element
which(m9>600,arr.ind = T)# to find elements > 600