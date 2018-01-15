library(caTools)
library(rms)
df = read.csv("./data/redwine.csv")
str(df)
length(unique(df$quality))
unique(df$quality)
library(nnet)
s1 = sample.split(df$quality,SplitRatio = 0.8)
train = subset(df,s1==T)
test = subset(df,s1==F)
str(train)
str(test)
m1 = multinom(quality~.,data=train)
pred = predict(m1,test)
pred[1:5]
table(pred,test$quality)
105+79+13
acc1 = 197/321
acc1#0.6137
summary(m1)
null = multinom(quality~1,data=train)
full = multinom(quality~.,data=train)
step(null,scope=list(lower=null,upper=full),direction = 'forward')
m2 = multinom(formula = quality ~ alcohol + volatile.acidity + total.sulfur.dioxide + 
                sulphates + free.sulfur.dioxide + chlorides + pH, data = train)
pred2 = predict(m2,test)
pred2[1:5]
table(pred2,test$quality)
acc2 = 193/321
acc2#0.6012
