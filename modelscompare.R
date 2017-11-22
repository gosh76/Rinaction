mtcars
str(mtcars)
dim(mtcars)
t = table(mtcars$am)
amt = addmargins(t)
ppt = prop.table(t)
ppt
amt
(base = glm(am~1,data=mtcars,family = binomial()))
odds = exp(-0.3795)
odds
(fit1 = glm(am~mpg+disp+hp+wt,data=mtcars,family=binomial()))
summary(fit1)
plot(fit1)
anova(fit1)
(factor = glm(am~mpg+hp+wt,data=mtcars,family=binomial()))
(fit2 = glm(am~mpg+hp,data=mtcars,family = binomial()))
summary(factor)
(fit3 = glm(am~hp+wt,data=mtcars,family=binomial()))
summary(fit3)
pred = predict(fit3,type='response',data=mtcars[c('hp','wt')])
pred[1:5]
pred1 = ifelse(pred>0.5,1,0)
pred1[1:5]
mtcars$p = pred1
table(mtcars$p,mtcars$am)
30/32
newdata=data.frame(wt=2,hp=150)
pred2 = predict(fit3,newdata,type='response')
pred2
(p1 = predict(fit3,newdata=mtcars[c('wt','hp')],type='response'))
(p1a = ifelse(p1>0.5,1,0))
mtcars
cbind(mtcars$am,mtcars$wt,mtcars$hp,p1,p1a)
(xtab= table(mtcars$am,p1a))
library(caret)
caret::confusionMatrix(xtab)
car::vif(fit3)
sqrt(car::vif(fit3))>2
