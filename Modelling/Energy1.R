train = read.csv('F:/EnergyConsume/train.csv')
str(train)
train$obs_id = NULL
meta = read.csv('F:/EnergyConsume/metadata.csv')
weat = read.csv('F:/EnergyConsume/weather.csv')
hols = read.csv('F:/EnergyConsume/holidays.csv')
sub = read.csv('F:/EnergyConsume/sub.csv')
head(sub)
colSums(is.na(train))
train2 = train[!is.na(train$Value),]
rm(train)
colSums(is.na(train2))
colSums(is.na(meta))
c1 = merge(train2,meta,by='SiteId')
dim(c1)
head(c1)
rm(train2)
dim(weat)
c2 = merge(c1,weat,by=c('SiteId','Timestamp'))
dim(c2)
head(c2)
head(weat)
c2$X = NULL
head(hols)
substr(c2$Timestamp[1],1,10)
v1 = c()
for (i in 1:nrow(c2)){
  v1[i] = substr(c2$Timestamp[i],1,10)
}
length(v1)
dim(c2)
c2$Date = v1
rm(v1)
hols$X = NULL
library(data.table)
h1 = as.data.table(hols)
hols1 = unique(h1,by=c('SiteId','Date'))
dim(hols1)
class(hols1)
c3 = merge(c2,hols1,by=c('SiteId','Date'),all.x = T)
dim(c3)
head(c3)
colSums(is.na(c3))
levels(c3$Holiday) = c(levels(c3$Holiday),'None')
c3$Holiday[is.na(c3$Holiday)] = 'None'
y1 = c()
for (i in 1:nrow(c3)){
  y1[i] = substr(c3$Timestamp[i],1,4)
}
length(y1)
c3$y = y1
rm(y1)
m1 = c()
for (i in 1:nrow(c3)){
  m1[i] = substr(c3$Timestamp[i],6,7)
}
m1[1:5]
c3$m = m1
rm(m1)
rm(hols)
rm(h1)
d1 = c()
for (i in 1:nrow(c3)){
  d1[i] = substr(c3$Timestamp[i],9,10)
}
c3$d = d1

head(c3)
hr = c()
for (i in 1:nrow(c3)){
  hr[i] = substr(c3$Timestamp[i],12,13)
}
c3$h = hr
mi = c()
for (i in 1:nrow(c3)){
  mi[i] = substr(c3$Timestamp[i],15,16)
}
c3$mi = mi
head(c3)
c3$SiteId = NULL
c3$Date = NULL
c3$Timestamp = NULL
# test

head(sub)
tst = sub[,c(2,3)]
head(tst)
dim(tst)
t1 = merge(tst,meta,by='SiteId')
dim(t1)
head(t1)
weat1 = as.data.table(weat)
dim(weat1)
weat1 = unique(weat1,by=c('SiteId','Timestamp'))
dim(weat1)
head(weat1)
weat1$X = NULL
t2 = merge(t1,weat1,by=c('SiteId','Timestamp'),all.x = T)
dim(t1)
dim(t2)
u1 = c()
for (i in 1:nrow(t2)){
  u1[i] = substr(t2$Timestamp[i],1,10)
}
length(u1)
t2$Date = u1

t3 = merge(t2,hols1,by=c('SiteId','Date'),all.x = T)
head(t3)
levels(t3$Holiday) = c(levels(t3$Holiday),'None')
t3$Holiday[is.na(t3$Holiday)] = 'None'
dim(t3)
u2 = c()
for (i in 1:nrow(t3)){
  u2[i] = substr(t3$Timestamp[i],1,4)
}
length(u2)
t3$y = u2
head(c3)
u3 = c()
for (i in 1:nrow(t3)){
  u3[i] = substr(t3$Timestamp[i],6,7)
}
t3$m = u3
u4 = c()
for (i in 1:nrow(t3)){
  u4[i] = substr(t3$Timestamp[i],9,10)
}
t3$d = u4
head(t3)

u5 = c()
for (i in 1:nrow(t3)){
  u5[i] = substr(t3$Timestamp[i],12,13)
}
t3$h = u5
u6 = c()
for (i in 1:nrow(t3)){
  u6[i] = substr(t3$Timestamp[i],15,16)
}
t3$mi=u6
head(t3)
t3$SiteId = NULL
t3$Date=NULL
t3$Timestamp=NULL
library(randomForest)
c3$y = as.numeric(c3$y)
c3$m = as.numeric(c3$m)
c3$d = as.numeric(c3$d)
c3$h = as.numeric(c3$h)
c3$mi = as.numeric(c3$mi)
str(c3)

c3$Holiday = NULL
c3$MondayIsDayOff=NULL
c3$TuesdayIsDayOff=NULL
c3$WednesdayIsDayOff=NULL
c3$ThursdayIsDayOff=NULL

library(biglm)
dim(c3)
chunk1 = c3[1:500000,]
chunk2 = c3[500001:1000000,]
chunk3 = c3[1000001:1500000,]
chunk4 = c3[1500001:2000000,]
chunk5 = c3[2000001:2327992,]
b1 = biglm(terms(Value ~ ., data=chunk1), data=chunk1)
b1 = update(b1,chunk2)
b1 = update(b1,chunk3)
b1 = update(b1,chunk4)
b1 = update(b1,chunk5)
summary(b1)

t3$y = as.numeric(t3$y)
t3$m = as.numeric(t3$m)
t3$d = as.numeric(t3$d)
t3$h = as.numeric(t3$h)
t3$mi = as.numeric(t3$mi)
t3$Holiday = NULL
t3$MondayIsDayOff=NULL
t3$TuesdayIsDayOff=NULL
t3$WednesdayIsDayOff=NULL
t3$ThursdayIsDayOff=NULL
t3$Temperature[is.na(t3$Temperature)] = median(t3$Temperature,na.rm = T)
t3$Distance[is.na(t3$Distance)] = median(t3$Distance,na.rm=T)
colSums(is.na(t3))
t3$Value = 0
pred = predict(b1,newdata = t3)
pred[1:5]
length(pred)
head(sub)
sub$Value = pred
head(sub)
write.csv(sub,'Energy1R.csv',row.names = F)
