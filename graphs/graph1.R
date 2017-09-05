par()
par(pin=c(2,3))# changing dimensions of plot area
par(col.lab='red')# changing color of label
hist(mtcars$mpg)
opar = par(no.readonly=T)
opar
par(opar)# resetting parameters to default
par('mar')# margins in cm
par('mai')#margins in inch
hist(mtcars$mpg)
par(mar=c(1,1,1,1))
hist(mtcars$mpg)
attach(mtcars)
hist(mpg)
par(opar)
hist(mpg)
par(mfrow=c(2,2))#for multiple frames per row
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
hist(hp,main='4')
par(mfcol=c(2,2))#for multiple frames per column
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
hist(hp,main='4')
layout(matrix(c(1,1,2,3),byrow=T,nrow=2))# top row-1,bottom row-2&3
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
layout(matrix(c(1,1,1,2,3,4),byrow=T,nrow=2))#top row-1,bottom row-2,3,4
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
hist(hp,main='4')
layout(matrix(c(1,2,3,3,4,5),byrow=T,nrow=3))#top row-1,2,mid row-3,br-4,5
par('mar')
par(mar=c(1,1,1,1))
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
hist(hp,main='4')
hist(hp,main='5')
layout(matrix(c(1,1,2,3),byrow=T,nrow=2),width=c(3,1),height=c(1,2))
hist(mpg,main='1')
hist(cyl,main='2')
hist(wt,main='3')
par(opar)
par(mar=c(2,2,2,2))
plot.new()
par(fig=c(0,0.8,0,0.8),new=T)
plot(wt,mpg)
par(fig=c(0,0.8,0.65,1),new=T)
boxplot(wt,horizontal=T,axes=F)
par(fig=c(0.65,1,0,0.8),new=T)
boxplot(mpg,axes=F)
