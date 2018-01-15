#Q1
quarter = c('Q1','Q2','Q3','Q4')
sales = c(10000,13000,12000,15000)
df = data.frame(quarter,sales)
df
barplot(sales,xlab='quarters',ylab='sales',main = "Sales per Qtr")
df$quarter[df$sales>11000]
df$sales[df$quarter=='Q3']
#Q2
v1 = sample(c('A','P'),30,replace=T,prob = c(0.3,0.7))
v1
table(v1)
#Q3
set.seed(1000)
P1 = ceiling(runif(10,30,100))
P1
set.seed(1100)
P2=ceiling(runif(10,30,100))
set.seed(1200)
P3=ceiling(runif(10,30,100))
set.seed(1300)
P4=ceiling(runif(10,30,100))
set.seed(1400)
P5=ceiling(runif(10,30,100))
s1 = data.frame(P1,P2,P3,P4,P5)
s1
rownames(s1) = paste('M',1:10,sep='')
s1
mean(s1$P1)
mean(s1$P2)
mean(s1$P3)
mean(s1$P4)
mean(s1$P5)
addmargins(as.matrix(s1),c(1,2),FUN = mean)
s2 = matrix(c(P1,P2,P3,P4,P5),byrow = F,ncol = 5,dimnames=list(paste('M',1:10,sep=''),paste('P',1:5,sep='')))
s2
colMeans(s2)
rowMeans(s2)
mean(s2[1,])
#Q4
g = c('Achal', 'Apoorva', 'Lalit', 'Goldie')
d = c('BSc','LLB','MSc')
s = c('Animation','Law','Data Science')
n = c(50,20,24)
male = c(40,16,49)
female = c(10,4,5)
df1 = data.frame(d,s,n,male,female)
df1
mat1 = matrix(c(100, 300, 400, 500, 230,500, 200 , 150, 400, 700),nrow=2,byrow = T)
mat1
rownames(mat1) = c('food','decoration')
colnames(mat1) = c('B1','B2','B3','B4','B5')
mat1
l1 = list(guests=g,hosts=df1,bills=mat1)
l1
sum(l1$bills[1,])
sum(l1$bills[2,])
l1$hosts[,'male']
l1$hosts$female
#Q5
set.seed(1234)
a1 = array(ceiling(runif(30,1000,2000)),dim=c(3,5,2),dimnames=list(c('Graduate','PG','Diploma'),
c('S1','S2','S3','S4','S5'),c('DS','Law')))
a1
a1[2,5,1]
a1[3,1,2]
a1[,2,]
a1[,,1]
apply(a1,c(1),sum)
apply(a1,c(2),sum)
apply(a1,c(3),sum)
apply(a1,c(2,3),sum)
#Q6
Students =c('S1', 'S2', 'S3', 'S4', 'S5')
Gender = c('M','F', 'M', 'M', 'F')
Age = c(23, 22, 21, 25, 22)
City = c('Delhi', 'Noida', 'Lucknow', 'Delhi', 'Noida')
Cat = c('Gen', 'OBC', 'Gen', 'SCST', 'Gen')
df = data.frame(Students,Gender,Age,City,Cat,stringsAsFactors = F)
df
table(Cat)
table(Gender)
str(df)
df$Students = c(paste('Student',1:5,sep=""))
df
