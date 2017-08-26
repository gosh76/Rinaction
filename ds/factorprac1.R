d <- c('T1','T2','T1','T1')
d <- factor(d)
d
status <- c("Poor", "Improved", "Excellent", "Poor")
s1 <- factor(status,ordered=T)
s1
s2 <- factor(status,levels=c('Excellent','Improved','Poor'),ordered=T)
s2
class(s2)
s3 <- factor(status,levels=c('Poor','Improved','Excellent'),ordered=T)
s3
str(s2)
str(s3)
summary(s2)
months = c('Mar','May','Jun','Aug','Dec')
m1 <- factor(months)
m1
m2 <- factor(months,levels=month.abb,ordered=T)
m2
diabetes <- c('T1','T2','T1','T1')
fd <- factor(diabetes)
levels(fd)
levels(fd) <- c(levels(fd),'T3')
levels(fd)
fd
fd[4]
fd[4] = 'T3'
fd
fd2 <- factor (diabetes)
levels(fd2)
fd2[4] = 'T3'# gives invalid factor level, NA generated
fd2 <- factor(fd2,levels=c(levels(fd2),'T3'))
levels(fd2)
fd2[4] <- 'T3'
fd2
levels(fd2)
levels(fd2)[2]
levels(fd2)[4] <- 'T4'
levels(fd2)
fd2[5] <- 'T4'
fd2
sum(is.na(fd2))
table(fd2,exclude=NULL)
fd2
fd2[5] <- NULL
cp = c(1,2,4,5,3,23)
fcp <- factor(cp,levels=c(1,2,3,4,5,23),ordered=T,labels=c('f','s','t','fr','fif','six'))
fcp
summary(fcp)
fcp2 <- factor(fcp,levels=rev(levels(fcp)))
fcp2
fcp
s <- c('p','i','e')
fs <- factor(s)
fs
fs2 <- relevel(fs,'p')
fs2
