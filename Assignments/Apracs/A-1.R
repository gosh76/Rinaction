v1 = c(10 , 12, 13, 14 , 17)
mean(v1)
sum(v1)/length(v1)
m = c(10,12,13,14,17)
s = c(5,7,9,8,4)
m*s
mean1 = sum(m*s)/sum(s)
mean1
x = rep(m,s)
x
table(x)
mean(x)
m1 = c("10-20","20-30","30-40","40-50")
s1 = c(5,7,9,8)
df = data.frame(m1,s1)
df
str(df)
df$mp = c(15,25,35,45)
df
mean2 = sum(df$mp*df$s1)/sum(df$s1)
mean2
seq(10,25,5)
x2 = rep(c(10,20,30,10,40,50),c(3,5,2,2,4,4))
x2
mean(x2)
set.seed(1234)
x3 = ceiling(runif(50,0,100))
x3
b1 = seq(0,100,10)
b1
cm = cut(x3,b1)
cm
table(cm)
hist(x3)
cbind(table(cm))
