vec1=c(1,4,6,8,10)
vec2=1:100
vec2
vec3=c(vec1,0,vec2)
vec3
vec1[5]
vec1[1:3]
vec1[3]=12
vec2 = seq(from=0,to=1,by=0.25)
vec2
1/vec1
length(vec1)
vec2[vec2>50 & vec2<60]
vector("numeric",5)
u = c(10,20,30)
v = c(1,2,3,4,5,6,7,8,9)
u+v
v[-3]
v[c(2,3)]
s = c("aa","bb","cc","dd',"ee")
L=c(FALSE,TRUE,FALSE,TRUE,FALSE)
s[L]
s = c("aa","bb","cc","dd","ee")
s[L]
v=c("Mary","Sue")
names(v)=c("First","Last")
v[c("Last","First")]
m=c('a','b')
names(m)=c('F','L')
m[c('L','F')]
x=c("first"=3,"second"=0,"third"=5)
x[c('first')]
x = 'Goldie'
substr(x,1,3)
x[1:3]
x<-NULL
x <- c(23,43,21,56)
sort(x)
x<-sort(x)
x
order(x)
y<- c(23,31,12,42,32)
order(y)
y(order(y))
y[order(y)]
v=rep(2,3)
v
v=rep(c(1,3),3)
v
x=1:3
g=rep(x,c(1,2,3))
g
v=paste(1:3,4:5,sep='&')
v
t=paste('stu',1:10,sep='-')
t
