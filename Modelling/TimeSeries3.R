trn = read.csv('./data/TimeSeries/Train.csv',na.strings = c(""))
tst = read.csv('./data/TimeSeries/Test.csv',na.strings = c(""))
str(trn)
str(tst)
trn$Datetime[1]
target = trn$Count
trn$Count=NULL
c1 = rbind(trn,tst)
str(c1)
v1 = c()
for (i in 1:nrow(c1)){
  v1[i] = substr(c1$Datetime[i],1,2)
}
length(v1)
v2 = c()
for (i in 1:nrow(c1)){
  v2[i] = substr(c1$Datetime[i],4,5)
}
v3 = c()
for (i in 1:nrow(c1)){
  v3[i] = substr(c1$Datetime[i],7,10)
}
v3[1:5]
v4 = c()
for (i in 1:nrow(c1)){
  v4[i] = substr(c1$Datetime[i],12,13)
}
c1$r1 = v1
c1$r2 = v2
c1$r3 = v3
c1$r4 = v4
head(c1)
c1$Datetime = NULL
c1$r1 = as.numeric(c1$r1)
c1$r2 = as.numeric(c1$r2)
c1$r3 = as.numeric(c1$r3)
c1$r4 = as.numeric(c1$r4)
train = head(c1,nrow(trn))
test = tail(c1,nrow(tst))
train$Count = target
str(train)
str(test)
library(randomForest)
rf1 = randomForest(Count~.,data=train,ntree=1000)
pred = predict(rf1,newdata = test,type='class')
pred[1:5]
sub1 = data.frame(ID=test$ID)
head(sub1)
sub1$Count = pred
head(sub1)
write.csv(sub1,'TimeSeries3.csv',row.names = F)
