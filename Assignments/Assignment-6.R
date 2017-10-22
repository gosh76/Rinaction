#Creating a vector of 40 integer values
v1 <- ceiling(seq(10,200,length.out=40))
v1
#Creating a 5X8 matrix
M = matrix(v1,ncol=8)
M
#return product of each of rows
apply(M,1,prod)
#return sum of each of columns
apply(M,2,sum)
# modulo of matrix values
M1 = sweep(M,1,10,FUN='%%')
M1
# odd nos.in each column
M2 = sweep(M1,1,2,FUN='%%')
M2
apply(M2,2,sum)
# viewing iris dataset
i = iris
i
# mean of first 4 variables specieswise
agg <- aggregate(i,by=list(i$Species),FUN=mean,na.rm=TRUE)
agg
# Q2 - create new environment
e <- new.env()
# create 2 environment variables
e$a <- matrix(1:12,nrow=4)
e$b <- array(c(1:3*4*2),dim=c(3,4,2))
# mean of two variables
mean(e$a)
mean(e$b)
class(e$a)
class(e$b)
# Q3 - list
l1 <- list(1:20,55:100,mtcars$mpg,mtcars$wt)
l1
# apply sum to each element of list l1
lapply(l1,sum)
# results in vector form
sapply(l1,sum)
# Q4 - Sweep
a1 <- array(c(1:24),dim=c(4,3,2))
a1
sweep(a1,1,mean(a1),FUN="-")
# dataframe - attitude
attitude
dim(attitude)
# median of each column
med <- apply(attitude,2,median)
# subtract median from each column
sweep(attitude,2,med,FUN = "-")
#Create an array
a2 <- array(1:24,dim=c(4,3,2))
#Subtract 5 from each row
sweep(a2,1,5,FUN="-")
# Find minimum of each row
mini = apply(a2,1,min)
mini
# subtract this minimum value from each row
sweep(a2,1,mini,FUN="-")
# subtract median value across row & col 
sweep(a2,1:2,apply(a2,1:2,median))
## warnings 
sweep(a2,1,1:3) # STATS does not recycle
sweep(a2, 1, 6:1) # STATS is longer
# exact recyling
sweep(a2, 1, 1:2,FUN="-")
#Q5 - cast and melt (Reshape2)
library(reshape2)
require(reshape2)
# create data frame
(x = data.frame(subject = c("Lalit", "Vijay"),time = c(1,1),age = c(33,NA),weight = c(80, NA),height = c(2,2)) )
# melting dataframe x
melt(x)
# removing NA values
is.na(x)# TRUE for NA values
x[!complete.cases(x),]#gives row having NA values
colSums(is.na(x))# gives columns with NA values
x$age[is.na(x$age)] = 26
x$weight[is.na(x$weight)] <- 75
x
y = melt(x)
y
# Now reshape the molten data - pending
dcast(y,subject~variable)
# dataset - airquality
airquality
# melting
y1 <- melt(airquality)
#casting - pending


# Q6 - merge
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS', 'PGDDS','PGDDS','PGDDS')
df1 <- data.frame(rollno,sname,course)
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
df2 <- data.frame(rollno,gender,exp,hostel)
#Merge the data frame : automatically
merge(df1,df2)
# Create DF of marks of subject1
ID = c(17010,17045,17012,1)
SEX = c('M','F','M','M')
SUB1 = c(50,60, 70,80)
(df3 = data.frame(ID, SEX, SUB1))
#use to columns to join df1 & df3
df1$gender = gender
df1
df3
merge(df1,df3,by.x = c('rollno','gender'),by.y = c('ID','SEX'))
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = T)#all rows from df1 & df3
merge(df1,df3,by.x='rollno',by.y = 'ID',all.x=T)#all rows from df1
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = F)#intersection of df1$rollno & df3$ID
merge(df1,df3,by.x='rollno',by.y = 'ID',all.y=T)#all rows from df3
#Q7 - stack
classA = c(10,14,15) 
classB = c(20,25,27)
classC = c(13,15,17)
classmarks <- data.frame(classA,classB,classC)
classmarks
stack(classmarks)
d = stack(classmarks,c('classA','classC'))
unstack(d)
#Q8 - by
df5 = read.csv("./data/dsstudents.csv",na.strings = '')
df5
b1 <- by(df5[,c(11)],INDICES = df5$course,mean)
b1
b2 <- by(df5[,c(12)],INDICES = df5$course,mean)
b2
b3 <- by(df5[,c(13)],INDICES = df5$course,mean)
b3
b4 <- by(df5[,c(14)],INDICES = df5$course,mean)
b4
b5 <- by(df5[,c(1)],INDICES = df5$course,mean)
b5
b6 <- by(df5[,c(7)],INDICES = df5$course,mean)
b6
save(b1,b2,b3,b4,b5,b6,file = 'mydata.RData')
#Q9 - Aggregate
aggregate(mtcars,by=list(mtcars$cyl,mtcars$am),FUN='mean')
df5
aggregate(df5[,c('rpgm','excel','sql','stats')],by=list(df5$hostel,df5$gender),FUN='sum')