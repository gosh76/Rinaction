# Linear Regression
# myfit = lm(formula,data)
data(women) # load women data set
women
?women # weight depends on height
# height (in)
# weight (lbs)
attach(women)
cov(height,weight)
cor(height,weight)
(weight.lm = lm(weight ~ height ,data=women))
summary(weight.lm)
plot(height,weight)
abline(weight.lm,col='red')
abline(v=c(62,64,66))
abline(h=140)
fitted(weight.lm)
weight.lm2 = lm(weight~height + I(height^2),data=women)
weight.lm2
