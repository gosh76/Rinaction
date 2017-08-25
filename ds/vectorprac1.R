a <- c(23,43,56,87,23)
b <- c(12,32,34,54,67)
a*b
a+b
a-b
a/b
mean(a)
median(a)
sd(a)
cor(a,b)
plot(a,b)
getwd()
ls()
history(5)
options(digits=3)
x <- runif(10)
x
y <- runif(5)*20
y
summary(x)
hist(x)
summary(y)
hist(y)
library()
search()
# vector commands practice
v1 = c(2,43,76,8,97,54)
v2 = 1:45
v2
v3 = c(v2,0,v1)
v3
v4 = c(v3,100)
v4
v1[3]
v3[1:3]
v1[2:6]
v1[4]=15
v1
v5 = seq(from=0,to=1,by=0.2)
v5
1/v1
length(v4)
v4[-3:-10]
v4
v4 <- v4[-3:-30]
v4
v4 <- v4[-c(1,2,3,4,5)]
v4
v4[v4>40]
v4[v4>35 & v4<70]
v4[c(1,5)]
v2
v5
f = c(TRUE,FALSE,TRUE,FALSE,FALSE)
v5[f]
v6 <- c('Adam','Gosh')
names(v6) <- c('F','L')
v6
v6[c('L')]
v6[c('F')]
v7 <- c('V','G','K')
names(v7) <- c('F','M',"L")
v7
v7[c('F','L')]
v8 <- c('F'= 4,'S'= 6,'T'= 8)
v8
rm(v8)
v8 <- c('f'=3,'S'=7,'t'=9)
v8
v8[c('f')]
v8 <- v8[-c('f')]
v8 <- v8[-2:-3]
v8
v9 = 'swelling'
substr(v9,1,4)
substr(v9,3,6)
v9 <- NULL
v9
v10 <- c(23,76,54,35,89,75)
sort(v10)
v10
order(v10)
v10[order(v10)]
v11 <- c(12,23,34,56,78,59)
sort(v11)
order(v11)
v11[order(v11)]
v12 <- rep(12,3)
v12
v12[2]
v12[4]  # gives NA 
v13 <- rep(456,5)
v13
names(v13) <- c('A','B','C','D','E')
v13
v13[c('A','C')]
v14 <- rep(c(2,5),3)
v14
v14[2:5]
v14 <- v14[-2:-4]
v14
v15 <- c(2,5,8)
v16 <- rep(v15,c(1,2,3))
v16
v17 = paste(1:3,4:5,sep='&')
v17
v18 <- paste('son',1:10,sep='-')
v18
v18[2:6]
