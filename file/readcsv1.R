x1 <- data.frame(m1=1:10,m2=11:20)
x1
x2 <- list(a1='dof',a2=1:12,m3=matrix(1:12,nrow=3))
x2
x3 <- array(1:24,dim=c(2,3,4))
x3
getwd()
sp = read.csv('StatsPrac.csv')
sp
class(sp)
sp[3:5,'Marks']
# read data
df1 = read.csv('./data/dsstudents.csv')
df1
str(df1)
df2 = read.csv('./data/dsstudents.csv',stringsAsFactors = F)
df2
str(df2)
head(df2)[1:4]
df2$course <- factor(df2$course)
df2$gender <- factor(df2$gender)
head(df2)
str(df2)
df2[1:2]
df2[4:8]
df2[1:5,'gender']
df2[1:5,1:2]
table(df2$course,df2$gender)
df2[c('name','gender')]
names(df2)#column names
row.names(df2)
df2$rollno[df2$rollno == 170113] = 17013#change rollno
df2$rollno[df2$name == 'Lalit Sahni'] = 17013
fix(df2)# edit DF & save back
