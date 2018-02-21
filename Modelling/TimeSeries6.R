trn = read.csv('./data/TimeSeries/Train.csv',na.strings = c(""))
tst = read.csv('./data/TimeSeries/Test.csv',na.strings = c(""))
str(trn)
str(tst)
colSums(is.na(trn))
colSums(is.na(tst))
library(forecast)
library(tseries)
head(trn,n=20)
trn$ID = NULL

firstHour <- 24*(as.Date("25-08-2012 00:00")-as.Date("1-01-2012 00:00"))
ts1 <- ts(trn$Count,start=c(2012,firstHour),frequency=24*365)


class(ts1)
start(ts1)
end(ts1)
ts1[1]
plot(ts1)#data has trend and drift
plot(log10(ts1))
plot(diff(ts1,differences = 1))
plot(diff(log10(ts1),differences = 1))#data has become stationary
ts2 = diff(log10(ts1),differences = 1)
require(forecast)
adf.test(ts2,alternative="stationary")#p-value is 0.01 so reject Ho:series non-stationary
acf(ts2)#take q as 0.
pacf(ts2)#take p as 3.

a1 = arima(log10(ts1),c(3,1,2))
summary(a1)

a2 = auto.arima(log10(ts1),approximation = T,trace = T)
summary(a2)
pred <- predict(a1, n.ahead = 5112)
pred$pred[1:5]
sub1 = data.frame(ID=tst$ID)
head(sub1)
sub1$Count = pred$pred
head(sub1)
write.csv(sub1,'TimeSeries6.csv',row.names = F)
