#Q1
saledate = rep(c("2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01","2016-06-01"),4)
dept = c(rep('Dept1',6),rep('Dept2',6),rep('Dept1',6),rep('Dept2',6))
city = c(rep('Delhi',12),rep('Noida',12))
set.seed(1234)
saleamt = ceiling(runif(24,100,200))
set.seed(1234)
advamt = ceiling(runif(24,25,40))
df = data.frame(saledate,dept,city,saleamt,advamt,stringsAsFactors = F)
str(df)
df$dept = as.factor(df$dept)
levels(df$dept) = c("Dept2","Dept1")
df$city = as.factor(df$city)
str(df)
#Manipulation
t1 = xtabs(saleamt~dept+city,df)
t1
xtabs(saleamt~city,df)
addmargins(t1,c(2,1,1),FUN=list(sum,sd,mean))
prop.table(t1)
head(df)
df
df2 = df[df$city=='Noida',c('dept','saleamt','advamt')]
df2
df2[order(df2$saleamt,-df2$advamt),]
with(df2,boxplot(saleamt,dept))
within(df2,profit<-saleamt-advamt)
library(reshape2)
melt(df2,variable.name = "amttype",value.name="amt")
sweep(as.matrix(df2[,c(2,3)]),2,1,FUN='+')
#Descriptive Stats
plot(df$saleamt,df$advamt)
cor(df$saleamt,df$advamt)#0.9978086
#graph
boxplot(df$saleamt,df$dept)

