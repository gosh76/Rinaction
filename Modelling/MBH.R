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
library(car)
par(mar=c(3,3,3,3))
plot(df1$Landsize,df1$BuildingArea,ylim=c(0,300),xlim=c(0,900))
plot(df1$Price,df1$Landsize,ylim=c(0,800),xlim=c(0,2000000))
plot(df1$Price,df1$BuildingArea,ylim=c(0,400),xlim=c(0,2000000))
plot(df1$Price,df1$Bathroom,ylim=c(0,8),xlim=c(0,500000))
plot(df1$Price,df1$Rooms,ylim=c(0,8),xlim=c(0,800000))
#min.price for 1room-200000,2room-250000,3room-300000,4room-400000,5r-600000)
plot(df1$BuildingArea,df1$Bedroom2,ylim=c(0,8),xlim=c(0,300))
plot(df1$BuildingArea,df1$Bathroom,ylim=c(0,8),xlim=c(0,300))
plot(df1$Price,df1$Suburb)




#scatterplotMatrix(df1)
cor(df1$Price,df1$BuildingArea,method = "pearson", use = "complete.obs")#0.09
cor(df1$Price,df1$Landsize,method = "pearson", use = "complete.obs")#0.037
cor(df1$Landsize,df1$BuildingArea,method = "pearson", use = "complete.obs")#0.47
cor(df1$Price,df1$Bedroom2,method = "pearson", use = "complete.obs")#0.47
cor(df1$Price,df1$Bathroom,method = "pearson", use = "complete.obs")#0.46
cor(df1$BuildingArea,df1$Bathroom,method = "pearson", use = "complete.obs")#0.13
cor(df1$Landsize,df1$Bathroom,method = "pearson", use = "complete.obs")#0.03
cor(df1$BuildingArea,df1$Bedroom2,method = "pearson", use = "complete.obs")#0.14
cor(df1$Price,df1$Rooms,method = "pearson", use = "complete.obs")#0.496
cor(df1$Price,df1$Car,method = "pearson", use = "complete.obs")#0.238
cor(df1$Price,df1$YearBuilt,method = "pearson", use = "complete.obs")#-0.32
cor(df1$Price,df1$Lattitude,method = "pearson", use = "complete.obs")#-0.203
cor(df1$Price,df1$Longtitude,method = "pearson", use = "complete.obs")#0.196

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
null = lm(Price~1,data=df1)
full = lm(Price~.,data=df1)
step(null, scope=list(lower=null, upper=full), direction="forward")
m1 = lm(formula = Price ~ Suburb + Rooms + Type + Method + Bathroom + 
          Car + Date + YearBuilt + CouncilArea + Bedroom2 + Landsize + 
          BuildingArea, data = df1)
summary(m1)
split = sample.split(df1$Price,SplitRatio = 0.8)
trn = subset(df1,split == T)
str(trn)
tst = subset(df1,split==F)
str(tst)
trn1 = trn[1:5000,]
str(trn1)
m2 = lm(formula = Price ~ Suburb + Rooms + Type + Method + Bathroom + 
          Car + Date + YearBuilt + CouncilArea + Bedroom2 + Landsize + 
          BuildingArea, data = trn)
summary(m2)
pred1 = predict(m2,newdata = tst[,-4])
str(pred1)
df1$pred = pred1
df1$diff = df1$pred - df1$Price
summary(df1$diff)
var(df1$diff)
