library(AER)
data(Affairs)
mydata = Affairs
str(mydata)
mydata
summary(mydata)
dim(mydata)
x = mydata$affairs
table(x)
round(prop.table(table(x)),3)
y = mydata$gender
round(prop.table(table(y))*100)
z = mydata$children
round(prop.table(table(z))*100)
median(mydata$age)
mydata$ynaffair[mydata$affairs>0] = 1
mydata$ynaffair[mydata$affairs==0] = 0
mydata$ynaffair=factor(mydata$ynaffair,levels=c(0,1),labels=c('No','Yes'))
table(mydata$ynaffair)
