letters = read.csv('./data/letters_ABPR.csv')
str(letters)
colSums(is.na(letters))
library(caTools)
set.seed(1000)
s1 = sample.split(letters$letter,SplitRatio = 0.85)
trn = subset(letters,s1==T)
str(trn)#2649 obs.
tst = subset(letters,s1==F)
str(tst)#467 obs
#building cart model
library(rpart)
cart1 = rpart(letter~.,data=trn,method='class')
library(rpart.plot)
prp(cart1)
pred = predict(cart1,newdata = trn,type='class')
pred[1:5]
library(caret)
confusionMatrix(pred,trn$letter)
#Accuracy : 0.8811 - on trn set
pred1 = predict(cart1,newdata = tst,type='class')
confusionMatrix(pred1,tst$letter)
#Accuracy : 0.8522 - on tst set

# building random forest model
library(randomForest)
set.seed(1000)
rf1 = randomForest(letter~.,data=trn)
rfpred = predict(rf1,newdata = tst,type='class')
rfpred[1:5]
confusionMatrix(rfpred,tst$letter)
#Accuracy : 0.9872 - on tst set
varImpPlot(rf1, main = "Variable Importance Chart_Letters Recognition")
