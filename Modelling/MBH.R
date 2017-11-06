# Regression of MelBourne Housing data
library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
df1 = read.csv("./data/Melbourne_house.csv")
str(df1)
colSums(is.na(df1))
df1$Address <- NULL
str(df1)
df1[1:10,c('Bedroom2','Bathroom','Landsize',"BuildingArea")]
df1$Bedroom2[is.na(df1$Bedroom2)] = median(df1$Bedroom2,na.rm = T)
colSums(is.na(df1))
df1$Bathroom[is.na(df1$Bathroom)] = median(df1$Bathroom,na.rm = T)
df1$Car[is.na(df1$Car)] = median(df1$Car,na.rm = T)
df1$Landsize[is.na(df1$Landsize)] = median(df1$Landsize,na.rm = T)
df1$BuildingArea[is.na(df1$BuildingArea)] = median(df1$BuildingArea,na.rm = T)
df1$YearBuilt[is.na(df1$YearBuilt)] = median(df1$YearBuilt,na.rm = T)
df1$Lattitude[is.na(df1$Lattitude)] = median(df1$Lattitude,na.rm = T)
df1$Longtitude[is.na(df1$Longtitude)] = median(df1$Longtitude,na.rm = T)
str(df1)
length(df1$Distance[df1$Distance=="#N/A"])
length(df1$Postcode[df1$Postcode=="#N/A"])
colSums(is.na(df1))
df1$Price[is.na(df1$Price)] = median(df1$Price,na.rm = T)
colSums(is.na(df1))
plot(df1$Price,df1$BuildingArea,ylim=c(0,500))
cor(df1$Price,df1$BuildingArea)
split = sample.split(df1$Price,SplitRatio = 0.8)
trn = subset(df1,split == T)
str(trn)
tst = subset(df1,split==F)
str(tst)
trn1 = trn[1:5000,]
str(trn1)
m1 = lm(Price~.-Price,data=df1)
summary(m1)
pred1 = predict(m1,newdata = df1[,-4])
str(pred1)
df1$pred = pred1
df1$diff = df1$pred - df1$Price
summary(df1$diff)
var(df1$diff)
