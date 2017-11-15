S1 <- c(18.5,24,17.2,19.9,18)
S2 <- c(26.3,25.3,24,21.2,24.5)
S3 <- c(20.6,25.2,20.8,24.7,22.9)
S4 <- c(25.4,19.9,22.6,17.5,20.4)
df <- data.frame(S1,S2,S3,S4)
df
colMeans(df)
addmargins(as.matrix(df),c(1,2),FUN=list(list(mean,sd,length),list(length)))
df
dfstack = stack(df)
str(dfstack)
aggregate(dfstack$values,by=list(dfstack$ind),FUN=mean)
aggregate(dfstack$values,by=list(dfstack$ind),FUN=sd)
a1 = aov(values~ind,data=dfstack)
summary(a1)
qf(p=0.95,df1=3,df2=16)# for F-critical
boxplot(dfstack$values)
boxplot(df)
boxplot(values~ind,data=dfstack)
gplots::plotmeans(values~ind,data=dfstack)
abline(h=19.52)
abline(h=colMeans(df))#means are not same
TukeyHSD(a1)
plot(TukeyHSD(a1))# S2 - S1 is largest
library(multcomp)
tuk= glht(a1,linfct=mcp(ind="Tukey"))
plot(cld(tuk,level=0.05))
car::qqPlot(a1,simulate=T,labels=F)#check normality of dependent variable
bartlett.test(values~ind,data = dfstack)
car::outlierTest(a1)
