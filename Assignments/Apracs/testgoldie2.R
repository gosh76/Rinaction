i = airquality
str(i)
dim(i)
colnames(i)
summary(i)
?aggregate
aggregate(i,by=list(i$Month),FUN=mean,na.action=na.omit)

#Matrix
matrix1 = as.matrix(i)
colSums(is.na(matrix1))

matrix1[is.na(matrix1[,1]),1] = round(mean(matrix1[,1],na.rm=T))
matrix1[is.na(matrix1[,2]),2] = round(mean(matrix1[,2],na.rm=T))
apply(matrix1,2,FUN=mean)
