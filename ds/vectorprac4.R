v1 <- c(23,45,67,87,43)
v1[3]
v1[2:4]
names(v1) <- c('F','G','H','I','J')
v1
v1[-3]
v1[-5]
v1[-2:-5]
v1[c(1,3,5)]
v1[c(2,4)]
v1['G']
v1[c('G','I')]
v2 <- c(T,F,F,T,F)
v1[v2]
v3 <- c(1,2,3,4,5)
v1 + v3
v1 - v3
v1/v3
v1*v3
mean(v1)
median(v1)
sd(v1)
cor(v1,v3)
plot(v1,v3)
v4 <- c('a'=57,'b'= 89,'c'= 43)
v4[c(2,3)]
v4[c('a','c')]
v4[2]/v1[4]
v4['b']/v1['I']
ls()
history(7)
options(digits = 5)
v5 <- runif(5)
v5
v6 <- runif(5,10,50)
v6
v7 <- runif(3)*10
v7
v5[2] = 23
v5
v1
v1[c(2,4)] <- c(234,587)
v1
v1[c('F','J')] = c(123,980)
v1
v1[v1>200]
v1[v1 > 200 | v1 < 100]
sort(v1)
order(v1)
v1[order(v1)]
v8 <- 'disgusting'
v8[4]#gives NA
substr(v8,4,7)
v9 <- substr(v8,1,7)
v9
v10 <- rep(23,5)
v10
v11 <- rep(c(2,5),3)
v11
v12 <- rep(c(1,4,6),c(2,5,7))
v12
v13 <- paste(1:5,10:15,sep='-')
v13
v14 <- paste('c',1:6,sep = '_')
v14
