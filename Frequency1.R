S <- c('a','p','a','a','p','a')
C <- c('green','red','black','red','green','red')
table(S)
table(S)[1]
table(C)
table(C)[3]
table(C)['red']
set.seed(1235)
marks = ceiling(runif(25,30,70))
marks
x <- ceiling(rnorm(25,3,5))
x
cat(x)
breaks <- seq(10,90,by=5)
breaks
marks.cut <- cut(marks,breaks)
marks.cut[5]
marks.table = table(marks.cut)
marks.table
x
b1 <- seq(-10,25,by=5)
b1
x.cut <- cut(x,b1)
x.cut
x.table <- table(x.cut)
x.table