x = 11:20
for (i in c(5,2,7)){
  s = x[i]**2
  print(s)
}
r1 = function(d){
  g = d**.5
  print(g)
}
r1(x)
f = function(a,b) a^2
f(2)
log(-1)
seq(10,100,by=10)
seq(4)
seq_along(4)
?seq_along
?NaN
v = 34 + NA
class(v)
?aggregate
#Q1
saledate = rep(c("2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01","2016-06-01"),4)
dept = c(rep("Dept1",6),rep("Dept2",6),rep("Dept1",6),rep("Dept2",6))
city = c(rep("Delhi",12),rep("Noida",12))
set.seed(1234)
saleamt = ceiling(runif(24,100,200))
set.seed(1234)
advamt = ceiling(runif(24,25,40))
df = data.frame(saledate,dept,city,saleamt,advamt,stringsAsFactors = F)
df
str(df)
df$saledate = as.Date(df$saledate)
df$dept = as.factor(df$dept)
str(df)
levels(df$dept) = c("Dept2","Dept1")
str(df)
g = xtabs(saleamt~dept+city,df)
g
xtabs(saleamt~city,df)
a = addmargins(g,c(1,1,2),FUN = list(mean,sd,sum))
a
prop.table(g)
df2 = df[df$city=="Noida",c('dept','saleamt','advamt')]
df2[order(df2$saleamt,-df2$advamt),]
with(df2,
     boxplot(saleamt,dept))
within(df2, profit <- saleamt - advamt)
sweep(df2[,c(2,3)],2,1,FUN='+')
library(reshape2)
?melt
melt(df2,variable.name = 'amttype',value.name = 'amt')
plot(df$saleamt,df$advamt)
#abline(lm(df$saleamt~df$advamt))
cor(df$saleamt,df$advamt)
boxplot(df$saleamt,df$dept)
boxplot(df$saleamt,df$dept+df$city)
a1 = aggregate(df$saleamt,by = list(df$dept,df$city),FUN=mean)
a1
pie(a1$x)

#Q2
i = airquality
str(i)
dim(i)
colnames(i)
summary(i)
aggregate(i,by=list(i$Month),FUN=mean,na.rm=T)
#matrix
matrix1 = as.matrix(i)
sum(is.na(matrix1))
colSums(is.na(matrix1))
mean(matrix1[,1],na.rm=T)
matrix1[is.na(matrix1[,1]),1]= round(mean(matrix1[,1],na.rm=T))
colSums(is.na(matrix1))
matrix1[is.na(matrix1[,2]),2] = round(mean(matrix1[,2],na.rm=T))
colSums(is.na(matrix1))
matrix1
apply(matrix1,2,mean)
apply(matrix1[1:10,],2,log)
sapply(matrix1[1:10], log)
#Q3
set.seed(1234)
v = ceiling(rnorm(120,50,10))
marks = array(v,dim=c(5,4,3,2),dimnames = list(c("S1","S2","S3","S4","S5"),c("Sb1","Sb2","Sb3","Sb4"),c("C1","C2","C3"),c("D1","D2")))
marks
apply(marks,c(2),function(x) max(x))
apply(marks,4,mean)
apply(marks,c(1,3,4),sum)
apply(marks,2,sd)
