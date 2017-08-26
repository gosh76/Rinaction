a <- c(1,2,5,3,6,-2,4)
b <- c('one','two','three')
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
a[2]
a[6]
a[c(3,7)]
a[c(2,3,6,7)]
a[2:6]
a[-2]
a[-3:-5]
a1 = c('n1'=1,'n2'=2,'n3'=5,'n4'=9)
a1
a1[c('n1','n4')]
f = c(TRUE,FALSE,TRUE,FALSE)
a1[f]
names(b) <- c('f','s','t')
b
b[c('f','t')]
a1[-c('n1')]
a1[-1]
a1[-c('n2')]
b1 <- c('s1'=3,'s2'=6,'s3'=8,'s4'=11)
a1+b1
a1*b1
a1-b1
a1/b1
b1[c('s3')]/a1[c('n2')]
b1[4]+a1[1]
mean(a1)
median(b1)
mode(a1)
cor(a1,b1)
plot(a1,b1)
ls()
history(3)
options(digits=5)
v1 <- runif(5)
v1
v2 <- runif(5)*10
v2
summary(v1)
hist(v1)
hist(v2)
a1[3]=7
a1
a1[c(2,3)] = c(8,9)
a1
a1[a1>8]
a1[a1>1 & a1<9]
v3 <- 'orchid'
v3[3] # gives NA
v4 <- substr(v3,3,5)
v4
v5 <- substr(v3,5,6)
v5
v6 <- substr(v3,1,3)
v6
p1 = c(45,67,21,34)
sort(p1)
order(p1)
p1[order(p1)]
v7 <- rep(67,3)
v7
v8 <- rep(c(23,45,67),2)
v8
v9 <- rep(c(12,46,89),c(1,3,5))
v9
names(v9) <- c('f','s','t','four','fifth','six','sev','eigth','nine')
v9
v10 <- paste(10:50,20:60,sep='-')
v10
