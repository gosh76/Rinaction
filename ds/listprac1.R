g = 'my first list'
h = c(23,43,67,54)
f <- matrix(1:20,nrow=5,byrow=T,dimnames=list(c('r1','r2','r3','r4','r5'),c('c1','c2','c3','c4')))
f
df1 <- data.frame(form=c(12,14,16),name=c('a','b','c'),gender=c('m','f','m'))
df1
str(df1)
list1 <- list(g,h,f,df1)
list1[2]
list1[4]
sum(list1[[2]])
list1[[4]]
list1[[4]]$form
sum(list1[[4]]$form)
list2 <- list(first=g,second=h,mat=f,students=df1)
list2$first
list2$mat
list2$students
list2$students$name
