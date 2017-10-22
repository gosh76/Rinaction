attach(mtcars)
hist(mpg)
par(col.lab='red')#makes labels color red
hist(mpg)
par(pin=c(2,3))# shrinks graph area
hist(mpg)
par(pin=c(1,1))# further shrinks graph area
hist(mpg)
opar = par(no.readonly = T)
par(opar)# resets parameters
hist(mpg)
par('pin')# 3.280833 1.785000 -default length width
par('mar')# 5.1 4.1 4.1 2.1 - default margin
par(mar=c(1,1,1,1))# shrinks margin area
hist(mpg)
par(mar=c(2,3,4,5))#increases margin area
hist(mpg)
par(mar=c(7,4,2,1))
hist(mpg)
barplot(mpg,xlab='cars',ylab='mpg',col=c(1,2,3,4,5,6,7,8),main='Miles per gallon',ylim=c(0,35),names.arg = row.names(mtcars),las=2)
par(opar)
par('mar')
par(mar=c(2,1,1,1))
par(mfrow=c(2,1))# 2 rows & 1 column for displaying graphs
hist(mpg,main='1')
hist(wt,main='2')
par(mfrow=c(1,3))# 1 row & 3 columns for displaying graphs
hist(hp,main='1')
hist(wt,main='2')
hist(disp,main='3')
par(mfrow=c(2,2))# 2 rows & 2 cols
hist(mpg,main='1')
hist(hp,main='2')
hist(wt,main='3')
hist(gear,main = '4')
par(mfcol=c(2,2))
hist(mpg,main='1')
hist(hp,main='2')
hist(wt,main='3')
hist(gear,main = '4')
layout(matrix(c(1,1,2,3),byrow=T,nrow=2))
hist(mpg,main='1')
hist(hp,main='2')
hist(cyl,main='3')
