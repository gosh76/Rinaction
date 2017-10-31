x <- c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3)
y <- c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1)
df  = data.frame(x,y)
length(x)
sum(x)
mean(y)
cor(x,y)
cor.test(x,y)
plot(x,y)
abline(lm(y~x),col='red')
fit = lm(y~x)
fit
summary(fit)
df$X = round(x- mean(x),2)
df
df$Y = round(y - mean(y),2)
df
df$XY = round(df$X*df$Y,2)
df$X2 = round(df$X^2,2)
df
SSXY = sum(df$XY)
SSXY
SSX = sum(df$X2)
SSX
b1 = SSXY/SSX
b1
mx = mean(df$x)
mx
my = mean(df$y)
b0 = my - b1*mx
b0
df$yh = round(fitted(fit),2)
df
plot(df$yh,x)
df$residuals = round((df$y - df$yh),2)
summary(df$residuals)
df$SSr = round((df$yh - mean(y))^2,2)
df$SSe = round((df$y - df$yh)^2,2)
df
colSums(df)
R2 = sum(df$SSr)/(sum(df$SSe)+sum(df$SSr))
R2
n = length(x)
SE = sqrt(sum(df$SSe)/(n-2))
SE
plot(x,y)
text(x=4,y=10,labels=paste0('(',x,',',y,')'),cex=1,col='red')
(SSR = round(sum(df$SSr),2))
(SSE = round(sum(df$SSe),2))
p=1# no. of IV variables
(MSR = SSR/p)
(MSE = SSE/(n-p-1))
(Fstats = MSR/MSE)
summary(fit)
(stderror = sqrt(sum(df$SSe)/(n-2)))
data("women")
?women
cor.test(women$height,women$weight)
fit = lm(women$weight~women$height)
summary(fit)
attach(women)
plot(height,weight)
abline(lm(weight~height),col='red')
fit1 = lm(weight~height,data=women)
summary(fit1)
fitted(fit)
coefficients(fit)
fit2 = lm(weight~height+I(height^2),data=women)
summary(fit2)
plot(fit2)
plot(height,weight)
lines(women$height,fitted(fit2))
fit3 = lm(weight~height+I(height^2)+I(height^3),data=women)
summary(fit3)
library(car)
car::scatterplot(weight~height,data=women,spread=F,lty.smooth=2,pch=19,main='Women age 30-39',
                 xlab='Height(inches)', ylab='weight(lbs.)')
