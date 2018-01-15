df = read.csv("./data/creditcard.csv")
str(df)
sum(is.na(df))
library(caTools)
library(rms)
s1 = sample.split(df$Class,SplitRatio = 0.8)
train = subset(df,s1==T)
test = subset(df,s1==F)
m1 = glm(Class~.,data=train)
summary(m1)
?step
null = glm(Class~1,data=train)
full = glm(Class~.,data=train)
step(null,scope = list(lower=null,upper=full),direction = 'forward')
m2 =  glm(formula = Class ~ V17 + V14 + V12 + V10 + V16 + V3 + V7 + 
            V11 + V4 + V18 + V1 + V9 + V5 + V2 + V6 + V21 + V19 + V20 + 
            V8 + V27 + Amount + V28 + V24 + V25 + V13 + V26 + V15 + V22 + 
            Time + V23, data = train)
str(test)
pred = predict(m2,type = 'response',newdata = test[,1:30])
pred[1:5]
pred2 = ifelse(pred>0.5,1,0)
pred2[1:5]
test$p = pred2
table(test$Class,test$p)
56852+42
acc1 = 56894/56961
acc1#0.9988
