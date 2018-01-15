df = read.csv("./data/auto-mpg.csv",stringsAsFactors = F)
str(df)
length(unique(df$horsepower))
colSums(is.na(df))
sum(is.na(df))
length(unique(df$car.name))
df$horsepower = as.numeric(df$horsepower)
colSums(is.na(df))
df$car.name = NULL
colSums(is.na(df))
df$horsepower[is.na(df$horsepower)] = mean(df$horsepower,na.rm=T)
colSums(is.na(df))
library(caTools)
s1 = sample.split(df$mpg,SplitRatio = .8)
train = subset(df,s1==T)
test = subset(df,s1==F)
str(train)
str(test)
m1 = lm(mpg~.,data=train)
summary(m1)
null = lm(mpg~1,data=train)
full = lm(mpg~.,data=train)
step(null,scope=list(lower=null,upper=full),direction = 'forward')
m2 = lm(formula = mpg ~ weight + model.year + origin + acceleration + 
          displacement, data = train)
summary(m2)
str(test)
pred = predict(m2,newdata = test[,2:8])
pred[1:5]
error = df$mpg - pred
error[1:5]
rmse1 = sqrt(mean(error*error))
rmse1#10.18
