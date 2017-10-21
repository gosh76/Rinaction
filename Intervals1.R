x1 <- c(1,2,2,2,3,5,6,7,7,8)
table(x1)
sort(table(x1),decreasing =T)
names(sort(table(x1),decreasing = T))[1]#gives mode of x1
x2 <- c(23,12,45,67)
x3 <- rep(x2,c(1,3,2,4))
x3
x4 <- c(x2,x3)
x4
mean(x4)
table(x4)
m1 <- c(12,65,87)
s1 <- c(1,3,2)
p1 <- m1*s1
p1
mean1 <- sum(p1)/sum(s1)
mean1
r1 <- rep(m1,s1)
r1
mean(r1)
table(r1)
hist(r1)
marks <- ceiling(runif(100,5,95))
marks
breaks <- seq(10,100,by=10)
breaks
marks.cut = cut(marks,breaks)
marks.cut# no intervals for marks <= 10;NA
table(marks.cut)# table counts elements in (10,20]
breaks
breaks[1]
breaks[11] = 0# adding 0 to breaks
breaks
marks1.cut <- cut(marks,breaks)
marks1.cut# (0,10] has been added
table(marks1.cut)
marks2.cut <- cut(marks,breaks,labels = letters[1:length(breaks)-1])
marks2.cut
table(marks2.cut)