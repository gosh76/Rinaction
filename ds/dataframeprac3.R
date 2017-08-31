v1 <- c(12,45,76,84)
v2 <- c(TRUE,FALSE,FALSE,TRUE)
v3 <- c('A','B','C','D')
df1 <- data.frame(v1,v2,v3)
df1
df1[2,3]
dim(df1)
nrow(df1)
ncol(df1)
df1[c(1,4),c(2,3)]
df1[c(2,4),]
df1[,c(1,3)]
df1[1:3,2:3]
rownames(df1) <- c('r1','r2','r3','r4')
df1
colnames(df1) <- c('c1','c2','c3')
df1
df1[c('r1','r3'),c('c1','c2')]
df1[c(1,2),c('c1','c3')]
str(df1)
df1$c1
df1[2,3]
df1[2,3] <- 5
df1[2,3] <- 'A'
df1
df1[3,1]
df1[3,1] <- 34
table(df1$c2,df1$c3)
head(df1)
head(mtcars)
head(mtcars,n=15)
tail(mtcars,n=10)
v4 <- c(12,34,67,65)
m1 <- matrix(c(v1,v4),nrow=2,byrow=T)
m1
m1[2,]
m1[2,][m1[2,]>35]
m1[1,][m1[1,]>50]
sort(mtcars[1,])
sort(mtcars[,'mpg'])
summary(mtcars)
summary(mtcars$hp)
summary(mtcars$disp)
plot(mtcars$hp,mtcars$disp)
attach(mtcars)
hp
hp>100
hp[hp>100]
mpg[mpg>6]
summary(mpg)
summary(hp)
plot(hp,disp)
plot(mpg,hp)
hp[1]
mpg[10]
detach(mtcars)
hp <- c(12,34,65)
attach(mtcars)#The following object is masked _by_ .GlobalEnv:hp
with(mtcars,summary(hp))
