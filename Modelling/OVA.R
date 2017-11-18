library(datasets)
library(caTools)
df = iris
str(df)
levels(df$Species)
set.seed(1234)
split = sample.split(df,SplitRatio = 0.80)
train = subset(df,split=T)
test = subset(df,split=F)
i = 0
for (x in unique(train$Species)){
  i = i + 1
  print(i)
  train$Class <- ifelse(train$Species==x,1,0)
  print(head(train))
  m1 = glm(Class~.,data=train[,-5],family = binomial)
  pred = predict(m1,newdata=test[,-5],type='response')
  print(head(pred))
  test[,paste0(x,'_prob')] = pred
}
test[55:60,]
predictions = apply(test[,c(6,7,8)],1,which.max)
predictions[55:60]
predictions[which(predictions==1)] = levels(train$Species)[1]
predictions[which(predictions==2)] = levels(train$Species)[2]
predictions[which(predictions==3)] = levels(train$Species)[3]
predictions[55:60]
test$predictions = predictions
table(test$predictions,test$Species)
