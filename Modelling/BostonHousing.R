library(mlbench)
data(BostonHousing)
BH = BostonHousing
str(BH)
r1 = lm(medv~.,data=BH)
summary(r1)
r2 = lm(medv~.-age-indus,data=BH)
summary(r2)
r3 = lm(medv~.-age-indus-crim-chas,data=BH)
summary(r3)
pred1 = predict(r3,data=BH[-c('age','indus','crim','chas','medv')])
length(pred1)
class(pred1)
head(pred1)
BH$pred = pred1
BH$diff = BH$medv - BH$pred
head(BH$diff)
