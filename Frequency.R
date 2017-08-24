Students = c('A','A','P','P','A','P','A')
color = c('Red','Blue','Green','Magenta','Green','Black','Blue','Black')
siblings = c('2','1','2','4','1','0','1','2','4','2')
table(Students)
table(color)
table(siblings)
color
cbind(table(Students))
marks = ceiling(runif(50,0,100))
marks
set.seed(1234)
marks1 = ceiling(runif(50,0,100))
marks
x = rnorm(100,mean=5,sd=6)
y = ceiling(x)
cat(y)
breaks = seq(0,100,by=10)
breaks
marks.cut = cut(marks,breaks)
marks.cut
marks.table = table(marks.cut)
cbind(marks.table)
pie(marks)
