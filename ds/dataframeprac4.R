v1 <- c(12,3,45,678,78)
v2 <- c('tom','morris','jim','dey','tim')
v3 <- c(T,T,F,T,F)
df1 <- data.frame(v1,v2,v3)
df1
str(df1)
df1[2,3]
df1[4,1]
df1[4:5,]
df1[3:4,2:3]
df1[c(1,4),c(1,3)]
df1[2,c('v2','v3')]
dim(df1)
nrow(df1)
ncol(df1)
rownames(df1) <- paste('R',1:5,sep='-')
df1
colnames(df1) <- paste('C',1:3,sep='-')
df1
df1[c('R-1','R-2'),c('C-1','C-3')]
df1$'C-1'
df1$'C-3'
df1['R-2','C-2'] = 'mir'#invalid factor level, replaced with NA generated
str(df1)
factor(df1$`C-2`)
df1
levels(df1$`C-2`)[6] = 'mir'#'mir' added to levels of factor df1$'C-2'
df1['R-2','C-2'] = 'mir'# successful
df1
df1['R-4','C-1'] = 988
df1
head(mtcars)
str(mtcars)
summary(mtcars)
v4 <- c(12,34,54,67,78,88)
v5 <- c(19,69,954,934,356,6879)
m1 <- matrix(c(v4,v5),nrow=2)
m1
m1[2,][m1[2,]>100]
m1[,3][m1[,3]>80]
m1[1,][m1[1,]>50]
sort(mtcars[1,])
sort(mtcars$wt)
attach(mtcars)
hp[hp>100]
disp[disp>150]
gear[gear>3]
plot(hp,disp)
plot(hp,gear)
hp[1]
hp
detach(mtcars)
hp <- c(12,23,45)
attach(mtcars)#The following object is masked _by_ .GlobalEnv:hp