v1 <- c(13,45,76,89,43,26)
v2 <- c(TRUE,FALSE,TRUE,FALSE,FALSE,FALSE)
v3 <- c('Abel','John','Tom')
v1[2]
v1[3:5]
v1[-3]
v1[-5]
v1[v2]
v1[c(2,6)]
v1[c(1,3,5)]
v1[-2:-4]
names(v3) <- c('F','S','T')
v3
v3[c('F')]
v3[c('S','T')]
v4 <- c(1,2,3,4,5,6)
v1+v4
v1-v4
v1*v4
v1/v4
mean(v1)
median(v1)
sd(v1)
cor(v1,v4)
plot(v1,v4)
v5 <- c('a'=34,'b'=67,'c'=89,'d'=54)
v5
v5[c('a','d')]
v5[3]/v1[2]
v5['a']
v5['c']/v1[2]
ls()
history(5)
options(digits=3)
v6 <- runif(3)
v6
v7 <- runif(3)*10
v7
v5[3] = 97
v5
v5['c'] = 102
v5
v5[c(2,3)] = c(500,600)
v5
v5[v5>100]
v5[v5>35 & v5<600]
v8 <- 'seaborn'
v8[2] # gives NA
length(v8) # gives 1
v9 <- substr(v8,4,6)
v9
v10 <- substr(v8,1,3)
v10
v5
sort(v5)
order(v5)
v5[order(v5)]
v11 <- rep(47,5)
v11
v12 <- rep(c(4,2,3),3)
v12
v13 <- rep(c(4,2,3),c(1,2,3))
v13
v14 <- paste(1:5,16:20,sep='-')
v14
v15 <- paste('a',1:5,sep='-')
v15
