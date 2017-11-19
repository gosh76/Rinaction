df = read.csv("./data/Suicide.csv")
str(df)
library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
colSums(is.na(df))
#initial model
m1 = lm(Total~.,data=df)
summary(m1)
#variable selection by AIC
null = lm(Total~1,data=df)
full = lm(Total~.,data=df)
step(null, scope=list(lower=null, upper=full), direction="forward")
m2 = lm(formula = Total ~ State + Type + Gender + Age_group + Year, 
        data = df)
summary(m2)
#splitting into train & test
split = sample.split(df$Total,SplitRatio = 0.8)
trn = subset(df,split==TRUE)
tes = subset(df,split==F)
#final model & prediction
m3 = lm(formula = Total ~ State + Type + Gender + Age_group + Year, 
        data = trn)
summary(m3)#r2-0.4514
p1 = predict(m3,newdata=tes)
length(p1)
p1[p1<0]=0
p1[1:5]
error = tes$Total - p1
rmse=sqrt(mean(error*error))
rmse#306.1186
plot(m3)