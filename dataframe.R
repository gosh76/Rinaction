n = c(2,3,5)
s = c('aa','bb','cc')
b = c(TRUE,FALSE,TRUE)
df = data.frame(n,s,b)
n;s;b;
str(df)
summary(df)
d = c('M','F','M')
df1 = data.frame(n,s,b,d,stringsAsFactors = T)
str(df1)
str(mtcars)
?mtcars
head(mtcars)
tail(mtcars)
?head
head(mtcars,n=8)
nrow(mtcars)
ncol(mtcars)
mtcars[1:3]
mtcars[,1:3]
mtcars[1:4,1:3]
names(mtcars)
x = 'cyl'
mtcars[,x]
mtcars[c(1,5),]
mtcars[1:5,4:8]
mtcars[1:5,c('mpg','cyl')]
rownames(mtcars)
mtcars$cyl
mtcars[mtcars$mpg>3.0,]
mtcars[mtcars$mpg>25 & mtcars$hp==110,]
mtcars[mtcars$mpg==21 & mtcars$hp==110,]
mtcars[mtcars$mpg==21 & mtcars$hp==110,c(2,3)]
mtcars[rownames(mtcars)=='Fiat 128',]
subset(mtcars,carb==2)
mtcars[1]
library(dplyr)
slice(mtcars,1L)
df
df
df1
df = data.frame(n,s,b)
df
n = c(2,3,5)
s = c('aa','bb','cc')
b = c(TRUE,FALSE,TRUE)
df = data.frame(n,s,b)
df
colnames(df) = c('a','b','c')
df
dim(df)
rownames(df) = c('d','e','f')
dim(mtcars)
length(mtcars)
attach(df)
df
attach(df)
a
detach(df)
attach(df)
attach(mtcars)
mpg
mean
mean(mpg)
df2 = mtcars
str(df2)
df2$carb = NULL
df2$gear2 = df2$gear
sort(mtcars)
sort(mtcars[1,])
sort(mtcars[,1])
sort(mtcars$mpg,decreasing=T)
