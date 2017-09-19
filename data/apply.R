a1 = array(1:24,dim=c(4,3,2),dimnames=list(c('c1','c2','c3','c4'),c('d1','d2','d3'),c('s1','s2')))
a1
m1= matrix(c(10:1,rep(5,10),rep(c(5,6),5),seq_len(length.out=10)),byrow=F,ncol=4)
colnames(m1) <- c('sub1','sub2','sub3','sub4')
rownames(m1) <- paste('R',1:10,sep = '')
m1
(df1 = data.frame(sub1=10:1,sub2=5,sub3=rep(c(5,6),5),sub4 = seq_len(length.out=10)))
(list1 = list(sub1=10:1,sub2=rep(5,3),sub3=rep(c(5,6),4),sub4=seq_len(length.out = 10)))
a1
m1
df1
list1
?apply
X = a1
apply(X,1,sum)
apply(X,1,mean)
apply(X,2,sum)
apply(X,3,sum)
apply(X,c(1,2),sum)
apply(X,c(1,2,3),sum)#original
apply(X,c(2,3),sum)
apply(X,c(2,1),sum)
X
addmargins(X,1,sum)# sum columns
addmargins(X,2,sum)
addmargins(X,3,sum)
addmargins(X,c(1,2),sum)
addmargins(X,c(1,3),sum)
addmargins(m1,c(1,2),FUN=list(list(sum,sd)))
m2 = matrix(1:12,nrow=3)
addmargins(m2,c(1,2),FUN=list(list(sum,sd),list(mean,var,IQR)))
