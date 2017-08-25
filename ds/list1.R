v1 = c(25,26,18,39)
m1 = matrix(1:10,nrow=2,byrow=T)
m1
v2 = c('one','two','three')
df1 = data.frame('formno'=c(17010,17045,17012),'name'=c('Achal','Apoorva','Goldie'),'gender'=c('M','F','M'))
df1
g = 'My First List'
str(df1)
df2 = data.frame(formno=c(17010,17045,17012),name=c('Achal','Apoorva','Goldie'),gender=c('M','F','M'),stringsAsFactors = F)
mylist = list(g,v1,m1,v2,df2)
str(df2)
str(mylist)
mylist1 = list(title=g,ages=v1,m1,v2,students=df2)
mylist1[2]
mylist1[[2]]
mylist1[['ages']]
mylist1$ages
sum(mylist1[[3]]) # returns m1 as vector
mylist1$students$name
sum(mylist1[3]) # does not work because it is list
mylist1$students$name
mylist1[[5]]
mylist1[[5]]$name
