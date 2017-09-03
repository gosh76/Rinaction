v1 <- c(2,6,54,87,9)
m1 <- matrix(1:15,nrow=3,byrow=T,dimnames=list(c('r1','r2','r3'),c('c1','c2','c3','c4','c5')))
m1
v2 <- 'lists of list'
df1 <- data.frame(f=c(1,2,3),g=c('a','b','c'),h=c(F,T,F))
df1
l1 = list(v1,m1,v2,df1)
l1[1]
l1[1][3]
l1[[1]][3]
l1[[2]][2,3]
l1[[3]]
l1[[4]]
l1[[4]][2,2]
str(l1)
l1[[4]]$f
l1[[4]][1:2]
l1[[4]][2,]
l2 = list(first=v1,second=m1,third=v2,fourth=df1)
l2$first
l2$first[3]
l2$second
l2$second[c('r1','r2'),c('c1','c3')]
l2$third
l2$fourth
l2$fourth[2,c('h')]
l2$fourth[3,c('g')]
l2$third
