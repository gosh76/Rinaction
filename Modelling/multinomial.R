library(datasets)
library(caTools)
library(nnet)
df = iris
str(iris)
set.seed(1234)
split = sample.split(df,SplitRatio = 0.75)
train = subset(df,split=T)
test = subset(df,split=F)
m1 <- multinom(Species~.,data=df)
pred = predict(m1,test,"probs")
head(pred)
preds = apply(pred,1,which.max)
head(preds)
preds[which(preds==1)] = levels(df$Species)[1]
preds[which(preds==2)] = levels(df$Species)[2]
preds[which(preds==3)] = levels(df$Species)[3]
test$preds = preds
table(test$preds,test$Species)
