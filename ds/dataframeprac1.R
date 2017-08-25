f = c('a','b','c')
g = c(TRUE,FALSE,TRUE)
h = c(7,8,9)
df = data.frame(f,g,h)
df
dim(df)
dim(df)[1]
dim(df)[2]
df[1:2,2:3]
df[1:2,c('g','h')]
rownames(df) <- c('R1','R2','R3') 
df
df[c('R2','R3'),c('f','h')]
str(df)
k = c('aa','bb','cc')
df$f <- k
df
str(df)
df1 = data.frame(k,g,h,stringsAsFactors = T)
df1
str(df1)
head(mtcars)
head(mtcars,n=10)
tail(mtcars,n=8)
names(mtcars)
mtcars[1:4]
nrow(mtcars)
ncol(mtcars)
mtcars[1:5,c('disp','hp')]
mtcars[c('Merc 230','Merc 280','Merc 280C'),c('mpg','cyl')]
rownames(mtcars)
subset(mtcars,disp==160)
subset(mtcars,gear==3)
mtcars[1]
mtcars[mtcars$mpg>15 & mtcars$cyl==6,c('disp','hp')]
df1
rownames(df1) <- c('d','e','f')
df1
colnames(df1) <- c('s','t','u')
df1
attach(df1)
s
t
detach(df1)
df1$s = NULL
df1
df1$a = df1$u
df1
sort(mtcars[1,])
sort(mtcars[,1])
