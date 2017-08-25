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
