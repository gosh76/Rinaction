set.seed(1234)
v1 = ceiling(rnorm(120,50,10))
marks = array(v1,dim=c(5,4,3,2),dimnames = list(c('S1','S2','S3','S4','S5'),c('Sb1','Sb2','Sb3','Sb4'),c('C1','C2','C3'),c('D1','D2')))
marks
max1 = apply(marks,2,max)
max1
min1 = apply(marks,4,mean)    
min1
sd1 = apply(marks,2,sd)
sd1
sum1 = apply(marks,4,sum)
sum1
