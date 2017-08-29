# A1
x = c(10,20,30,40,50)
x1 = rep(x,c(3,5,2,4,4))
x1
x2 = c(x1[1:10],c(10,10),x1[11:18])
x2
mean(x2)
table(x2)
# A2
marks = c(10,12,13,14,17)
mean(marks)
students = c(5,7,9,8,4)
DFD = marks*students
DFD
DFDm = sum(DFD)/sum(students)
DFDm
x = rep(marks,students)
x
mean(x)
table(x)
marks2c = c('10-20','20-30','30-40','40-50')
students2c = c(5,7,9,8)
df2c = data.frame(marks2c,students2c)
df2c
str(df2c)
midpt2c = c(15,25,35,45)
df2c$mid2c = midpt2c
df2c
df2c$total = df2c$students2c*df2c$mid2c
df2c
sum(df2c$total)/sum(df2c$students2c)
x = rep(df2c$mid2c,df2c$students2c)
mean(x)
x3a = rep(marks,students)
x3a
hist(x3a)

xmarks1 = c(15,25,35,45)
students1 = c(5,7,8,9)
CFD = marks1*students1
CFD
CFDm = sum(CFD)/sum(students1)
CFDm
# A3
m = c(12,63, 61, 63, 87, 65, 1, 24, 67, 52, 70, 55, 29, 93, 30, 84, 29, 27, 19,
      24, 32, 31, 16, 4, 22, 82, 53, 92, 84, 5, 46, 27, 31, 51, 19, 76, 21, 26,
      100, 81, 56, 65, 32, 63, 33, 51, 68, 49, 25, 77)
cat(m)
breaks = seq(0,100,by=10)
m.cut = cut(m,breaks)
m.cut
m.table = table(m.cut)
m.table
cbind(m.table)
m1 = matrix(marks,students)
hist(m1)
