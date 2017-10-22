# Assignment-3 Q-2
v1 <- sample(c('A','P'), size=30, replace=T, prob = c(0.3,0.7))
v1
table(v1)
# Q-1
q = c('Q1','Q2','Q3','Q4')
s = c(10000,13000,12000,15000)
df1 = data.frame(q,s)
df1
barplot(df1$s,names.arg=df1$q,xlab='Quarter',ylab='Sales',main='Coy Sales',ylim=c(0,20000))
df1[df1$s>11000,]
df1[df1$q=='Q3',2]
# Q-3
set.seed(1000)
P1 <- ceiling(runif(10,30,100))
set.seed(1100)
P2 <- ceiling(runif(10,30,100))
set.seed(1200)
P3 <- ceiling(runif(10,30,100))
set.seed(1300)
P4 <- ceiling(runif(10,30,100))
set.seed(1400)
P5 <- ceiling(runif(10,30,100))
df2 <- data.frame(P1,P2,P3,P4,P5)
rownames(df2) <- c('M1','M2','M3','M4','M5','M6','M7','M8','M9','M10')
df2
mean(df2$P1) # returns 60.3
mean(df2$P2) # returns 56.8
mean(df2$P3) # returns 70.5
mean(df2$P4) # returns 64.7
mean(df2$P5) # returns 68.5
sum(df2['M1',])/ncol(df2) # returns 59.2
sum(df2['M2',])/ncol(df2) # returns 66.2
sum(df2['M3',])/ncol(df2) # returns 69.6
sum(df2['M4',])/ncol(df2) # returns 61.6
sum(df2['M5',])/ncol(df2) # returns 60.4
sum(df2['M6',])/ncol(df2) # returns 50.4
sum(df2['M7',])/ncol(df2) # returns 65.2
sum(df2['M8',])/ncol(df2) # returns 74.8
sum(df2['M9',])/ncol(df2) # returns 70.2
sum(df2['M10',])/ncol(df2) # returns 64
# Q-4
# Create a list for storing  various info 
g <- c('Achal','Apoorva','Lalit','Goldie') # vector for guests
course <- c('BSc','LLB','MSc')
school <- c('Animation','Law','Data Science')
number <- c(50,20,24)
males <- c(40,16,19)
females <- c(10,4,5)
hosts <- data.frame(course,school,number,males,females)
food <- c(100,300,400,500,230)
decoration <- c(500,200,150,400,700)
list1 <- list(g,hosts,food,decoration)
sum(list1[[3]])
sum(list1[[4]])
list1[[2]]$males
list1[[2]]$females
length(list1[[1]])
# Q-6
Students <- c('S1','S2','S3','S4','S5')
Gender <- c('M','F', 'M', 'M', 'F')
Age <- c(23, 22, 21, 25, 22)
City <- c('Delhi','Noida','Lucknow','Delhi','Noida')
Cat <- c('Gen','OBC','Gen','SCST','Gen')
sdf <- data.frame(Students,Gender,Age,City,Cat,stringsAsFactors = F)
table(sdf$Cat,sdf$Students)
table(sdf$Gender,sdf$Students)
sdf[1,'Students'] = 'Student1'
sdf[2,'Students'] = 'Student2'
sdf[3,'Students'] = 'Student3'
sdf[4,'Students'] = 'Student4'
sdf[5,'Students'] = 'Student5'
# Q-5
set.seed(1234)
m1 <- ceiling(runif(30,1000,2000))
m1
a1 <- array(m1,dim=c(5,3,2),dimnames=list(c('S1','S2','S3','S4','S5'),c('Graduate','PG','Diploma'),c('DS','Law')))
a1
a1['S5','PG','DS']
a1['S1','Diploma','Law']
mean(a1)
apply(a1,c(1),sum)
apply(a1,c(2),sum)
apply(a1,c(3),sum)
a1['S1',,]
a1[,,'DS']
