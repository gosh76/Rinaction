v1 = ceiling(seq(10,200,length.out = 40))
v1
m1 = matrix(v1,nrow = 5,ncol=8)
m1
apply(m1,1,FUN='prod')
apply(m1,2,FUN='sum')
m2 = sweep(m1,1,10,FUN = '%%')
m2
m3 = sweep(m2,1,2,FUN='%%')
colSums(m3)
i = iris
i
aggregate(i,by=list(i$Species),FUN='mean')
e = new.env()
e$a = matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
e$a
mean(e$a)
mean(e$b)
class(e$a)
l1 = list(1:20,55:100,mtcars$mpg,mtcars$wt)
lapply(l1,sum)
sapply(l1,sum)
a = attitude
str(a)
me1 = apply(a,2,FUN='median')
sweep(a,2,me1,FUN = '-')
arr1 = array(1:24,dim=c(4,3,2))
arr1
sweep(arr1,1,5,FUN='-')
min1 = apply(arr1,1,FUN='min')
sweep(arr1,1,min1,FUN='-')
arr1
med1 = apply(arr1,c(1,2),FUN='median')
med1
sweep(arr1,c(1,2),med1)
(x = data.frame(subject = c("Lalit", "Vijay"), time = c(1,1), age = c(33,NA), weight = c(80, NA), height =
                  c(2,2)) )
library(reshape2)
c1 = melt(x)
melt(x,na.rm = T)
c1
air1 = airquality
air1
air2 = melt(air1)
dcast(air2,variable~.)

rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha
Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS',
           'PGDDS','PGDDS','PGDDS')
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp = c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel = c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
df1 = data.frame(rollno,sname,course)
df1
df2 = data.frame(rollno,gender,exp,hostel)
df2
merge(df1,df2)
ID = c(17010,17045,17012,1)
SEX = c('M','F','M','M')
SUB1 = c(50,60, 70,80)
(df3 = data.frame(ID, SEX, SUB1))
df1$gender = gender
merge(df1,df3,by.x = c('rollno','gender'),by.y = c('ID','SEX'))
merge(df1,df3,by.x = c('rollno'),by.y = c("ID"),all = T)
merge(df1,df3,by.x = c('rollno'),by.y = c("ID"),all = F)
merge(df1,df3,by.x = c('rollno'),by.y = c("ID"),all.x = T)
merge(df1,df3,by.x = c('rollno'),by.y = c("ID"),all.y = T)

classA = c(10,14,15) ; classB = c(20,25,27); classC = c(13,15,17)
?stack
classmarks = data.frame(classA,classB,classC)
stack(classmarks)
s1 = stack(classmarks,select = c('classA','classB'))
unstack(s1)
?by
df1
df5 = read.csv('./data/dsstudents.csv')
df5
b1 = by(df5[,11],df5$course,FUN = mean)
b2 = by(df5[,12],df5$course,FUN = mean)
b3 = by(df5[,13],df5$course,FUN = mean)
b4 = by(df5[,14],df5$course,FUN = mean)
save(b1,b2,b3,b4,file = 'gd.RData')
aggregate(mtcars,by=list(mtcars$cyl,mtcars$am),FUN=mean)
aggregate(df5[,11:14],by=list(df5$hostel,df5$gender),FUN=sum)
