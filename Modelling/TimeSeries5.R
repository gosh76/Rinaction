trn = read.csv('./data/TimeSeries/Train.csv',na.strings = c(""))
tst = read.csv('./data/TimeSeries/Test.csv',na.strings = c(""))
str(trn)
str(tst)
acf(diff(log(trn$Count)))
pacf(diff(log(trn$Count)))
(fit <- arima(log(trn$Count), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))
pred <- predict(fit, n.ahead = 5112)
pred$pred[1:5]
sub1 = data.frame(ID=tst$ID)
head(sub1)
sub1$Count = pred$pred
head(sub1)
write.csv(sub1,'TimeSeries5.csv',row.names = F)
