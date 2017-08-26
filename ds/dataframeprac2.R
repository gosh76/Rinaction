pid <- c(1,2,3,4)
age <- c(24,32,54,67)
diabetes <- c('T1','T2','T2','T1')
status <- c('P','I','E','I')
pd <- data.frame(pid,age,diabetes,status)
pd
dim(pd)
nrow(pd)
ncol(pd)
pd[c(1,3),c(3,4)]
pd[,c(2,3)]
pd[c(1,4),c(2,3)]
pd[1:3,2:4]
pd[1:2]
pd[c('pid','status')]
pd[c(1,4),c('pid','age')]
rownames(pd) <- c('r1','r2','r3','r4')
pd
pd[c('r1','r3'),c('age','diabetes')]
str(pd)
pd$status
table(pd$diabetes,pd$status)
head(pd)
head(mtcars)
tail(mtcars)
head(mtcars,n = 10)
mtcars[c(1:3),c('mpg','cyl')]
mtcars[c('Merc 240D','Merc 230','Merc 280'),c('hp','wt')]
mtcars[1:3,c('mpg','cyl')]
subset(mtcars,disp==160)
subset(mtcars,cyl==6)
subset(mtcars,disp==160 & hp==110)
subset(mtcars,hp>110)
subset(mtcars,mpg>20)
mtcars[mtcars$mpg>20 & mtcars$hp>80,c('mpg','hp')]
attach(mtcars)
hp
hp>100
hp[hp>100]
mpg[mpg>25]
gear[gear>3]
pd
pd$pid <- NULL
pd
sort(mtcars[1,])
sort(mtcars[,'hp'])
summary(mtcars$mpg)
plot(mtcars$mpg,mtcars$hp)
summary(mpg)
summary(hp)
plot(hp,disp)
plot(hp,wt)
plot(mpg,cyl)
detach(mtcars)
hp
mpg <- c(23,45,76)# If another mpg is created before attach(mtcars) then msg
attach(mtcars) #The following object is masked _by_ .GlobalEnv: mpg
with(mtcars,summary(mpg))
with(mtcars,summary(hp))
with(mtcars,summary(mpg,disp))
with(mtcars,{summary(mpg,disp)})
with(mtcars,{summary(mpg,disp) plot(hp,mpg)})
rn = c('a','b','c','d')
row.names(pd) <- rn # give or change row names of dataframe
pd
