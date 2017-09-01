x <- c(1,2,3,4,5,5,7,8,8,8)
table(x)
sort(table(x),decr=T)
names(sort(table(x),decr=T))[1]
x1 <- c(10,20,30,40,50)
x2 <- rep(x1,c(2,4,5,6,7))
x2
x3 <- c(x2[1:12],c(25,35),x2[13:24])
x3
mean(x3)
table(x3)
marks = c(15,25,34,32,78)
students <- c(2,6,8,9,1)
ms = marks*students
ms
msm = sum(ms)/sum(students)
msm
r1 <- rep(marks,students)
r1
mean(r1)
table(r1)
hist(r1)
set.seed(98)
d1 <- runif(10,10,80)
d1
set.seed(98)
d2 <- runif(10,10,80)
d2
brk = seq(0,100,10)
brk
mcut = cut(d1,brk)
mcut
table(mcut)
d1
d2[c(1,10)] <- c(0,100)
d2
mcut1 <- cut(d2,brk)# doesnot include 0
mcut1
table(mcut1,useNA='ifany')
mcut2 <- cut(d2,brk,include.lowest = T)
mcut2
table(mcut2)
set.seed(35)
d3 <- ceiling(rnorm(10,70,25))
d3
range(d3)
brk1 <- seq(50,160,10)
brk1
d3cut <- cut(d3,brk1)
d3cut
table(d3cut)
d3[c(1,10)] <- c(45,168)
d3
d3cut1 <- cut(d3,brk1)# gives 2 NA for 45 & 168 since brk1 is defined from 50 to 160
d3cut1
d3cut2 <- cut(d3,brk1,include.lowest=T)# same as above
d3cut2
brk2 <- seq(40,180,20)
brk2
d3cut3 <- cut(d3,brk2)
d3cut3
table(d3cut3)
length(d3cut3)
d3cut4 <- cut(d3,brk2,labels = letters[1:length(brk2)-1])
d3cut4
d3
