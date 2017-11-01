iris
str(iris)
i = iris
i
names(i) = c('SL','SW','PL','PW','SP')
str(i)
is.na(i)
sum(is.na(i))
complete.cases(i)
!complete.cases(i)
i$SP = factor(i$SP,levels=c(0,1,2))
library(caTools)
s1 = sample.split(i$SL,SplitRatio=0.8)
trn = subset(i,s1=T)
test = subset(i,s1=F)
c1 = glm(SP~.,family = binomial,data=trn)
i
str(i)
