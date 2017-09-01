v1 <- c('T1','T2','T1','T1')
f1 <- factor(v1)
f1
f1[5] <- 'T3'#invalid factor level, NA generated
levels(f1)[3] <- 'T3'
levels(f1)
f1[5] <- 'T3'
f1
f2 <- factor(f1,levels=c('T3','T2','T1'),ordered=T)
f2
str(f2)
class(f2)
levels(f2) <- c(levels(f2),'T4')
levels(f2)
f2[6] <- 'T4'
f2
f3 <- factor(f2,labels=c('a','b','c','d'))
f3
f3[2]
f3[3] <- NA
f3
is.na(f3)
sum(is.na(f3))
