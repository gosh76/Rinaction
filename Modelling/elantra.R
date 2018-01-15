df = read.csv('./data/elantra.csv')
str(df)
trn = df[df$Year<=2012,]
str(trn)
tst = df[df$Year>2012,]
str(tst)
#Q1 - 36 obs in trn.
m1 = lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all,data=trn)
summary(m1)
#Q2 - r2:0.3544
#Q3 - no variables are significant
#Q4 - unemployment coeff:-3179.90.As unemployment increases,elantra sales decreases.
#One unit increase in unemployment decreases sales by 3180.
m2 = lm(ElantraSales~Month+Unemployment+Queries+CPI_energy+CPI_all,data=trn)
summary(m2)
#Q5 - adj. r2:0.3402, r2 - 0.4344
trn$Month = as.factor(trn$Month)
m3 = lm(ElantraSales~Month+Unemployment+Queries+CPI_energy+CPI_all,data=trn)
summary(m3)
#Q6 - adj. r2:0.6837
#Q7 - Month 3 to 9 & 12,Unemployment,CPI_energy,CPI_all
tst$Month = as.factor(tst$Month)
pred = predict(m3,newdata = tst[-2])
pred[1:5]
pred1 = round(pred)
pred1[1:5]
tst$predsale = pred1
tst$error = tst$ElantraSales-tst$predsale
tst$err2 = tst$error^2
tst[1:10,]
s1 = sum(tst$err2)
s1#Q8 - 180472887
max1 = max(abs(tst$error))
max1#Q10-7633
tst[tst$error==max1,1:2]
#Q10-3,2013
avgsales = mean(tst$ElantraSales)
tst$errtotal = tst$ElantraSales-avgsales
tst$sqrerrtotal = tst$errtotal^2
s2 = sum(tst$sqrerrtotal)
s2#276118825
tstR2 = 1 - s1/s2
tstR2#0.3463941
