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
df1[1:10,c('Bedroom2','Bathroom','Rooms','Landsize',"BuildingArea")]
library(car)
par(mar=c(3,3,3,3))
plot(df1$Landsize,df1$BuildingArea,ylim=c(0,300),xlim=c(0,900))
plot(df1$Price,df1$Landsize,ylim=c(0,800),xlim=c(0,2000000))
plot(df1$Price,df1$BuildingArea,ylim=c(0,400),xlim=c(0,2000000))
plot(df1$Price,df1$Bathroom,ylim=c(0,8),xlim=c(0,500000))
#min.price for 1br-200000,2br-350000,3br-500000)
plot(df1$Price,df1$Rooms,ylim=c(0,8),xlim=c(0,800000))
#min.price for 1room-200000,2room-250000,3room-300000,4room-400000,5room-600000)
plot(df1$BuildingArea,df1$Bedroom2,ylim=c(0,8),xlim=c(0,300))
plot(df1$BuildingArea,df1$Bathroom,ylim=c(0,8),xlim=c(0,300))
plot(df1$Rooms,df1$Car,ylim=c(0,6),xlim=c(0,6))
plot(df1$Price,df1$YearBuilt,ylim=c(1900,2017),xlim=c(0,3000000))
plot(df1$Rooms,df1$Bedroom2)
plot(df1$BuildingArea,df1$Rooms,ylim=c(0,6),xlim = c(0,500))
#min.build area for 1room-25,2room-45,3room-70,4room-90,5room-120,6room-170)
plot(df1$Landsize,df1$Rooms,ylim=c(0,6),xlim = c(0,150))
plot(df1$Type,df1$YearBuilt,ylim=c(1960,2017))
#median year by type,h-1960,t-2005,u-1980

df1$Postcode = as.numeric(df1$Postcode)
df1$Distance = as.numeric(df1$Distance)

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
cor(df1$Rooms,df1$Bedroom2,method = "pearson", use = "complete.obs")#0.93
cor(df1$Rooms,df1$Bathroom,method = "pearson", use = "complete.obs")#0.60
cor(df1$Postcode,df1$Lattitude,method = "pearson", use = "complete.obs")#-0.58
cor(df1$Rooms,df1$Car,method = "pearson", use = "complete.obs")#0.40
cor(df1$BuildingArea,df1$Rooms,method = "pearson", use = "complete.obs")


#filling price NAs by min. price according to no. of rooms
df1[df1$Rooms==1 & is.na(df1$Price),'Price'] = 200000
df1[df1$Rooms==2 & is.na(df1$Price),'Price'] = 250000
df1[df1$Rooms==3 & is.na(df1$Price),'Price'] = 300000
df1[df1$Rooms==4 & is.na(df1$Price),'Price'] = 400000
df1[df1$Rooms==5 & is.na(df1$Price),'Price'] = 600000
df1[df1$Rooms==6 & is.na(df1$Price),'Price'] = 600000
df1[df1$Rooms==7 & is.na(df1$Price),'Price'] = 600000
df1$Price[is.na(df1$Price)] = 600000
#putting bedroom NAs equal to no. of rooms
df1$Bedroom2[is.na(df1$Bedroom2)] = df1$Rooms[is.na(df1$Bedroom2)]
#bathrooms NAs according to min. price
df1[df1$Price <= 350000 & is.na(df1$Bathroom),'Bathroom'] = 1
df1[df1$Price < 500000 & is.na(df1$Bathroom),'Bathroom'] = 2
df1[df1$Price >= 500000 & is.na(df1$Bathroom),'Bathroom'] = 3

df1$Car[is.na(df1$Car)] = median(df1$Car,na.rm = T)
#building area & landsize
df1$Landsize[is.na(df1$Landsize)] = df1$BuildingArea[is.na(df1$Landsize)]
df1$BuildingArea[is.na(df1$BuildingArea)] = df1$Landsize[is.na(df1$BuildingArea)]
df1[df1$Rooms==1 & is.na(df1$BuildingArea),'BuildingArea'] = 25
df1[df1$Rooms==2 & is.na(df1$BuildingArea),'BuildingArea'] = 45
df1[df1$Rooms==3 & is.na(df1$BuildingArea),'BuildingArea'] = 70
df1[df1$Rooms==4 & is.na(df1$BuildingArea),'BuildingArea'] = 90
df1[df1$Rooms==5 & is.na(df1$BuildingArea),'BuildingArea'] = 120
df1[df1$Rooms==6 & is.na(df1$BuildingArea),'BuildingArea'] = 170
df1$BuildingArea[is.na(df1$BuildingArea)] = 170
df1$Landsize[is.na(df1$Landsize)] = df1$BuildingArea[is.na(df1$Landsize)]
#YearBuilt by using type
df1[df1$Type=='h' & is.na(df1$YearBuilt),'YearBuilt'] = 1960
df1[df1$Type=='t' & is.na(df1$YearBuilt),'YearBuilt'] = 2005
df1[df1$Type=='u' & is.na(df1$YearBuilt),'YearBuilt'] = 1980

pc = unique(df1$Postcode[is.na(df1$Lattitude)])
for (x in pc){
  df1[df1$Postcode==x & is.na(df1$Lattitude),'Lattitude'] = 
    median(df1[df1$Postcode==x,'Lattitude'],na.rm = T)
}
df1$Lattitude[is.na(df1$Lattitude)] = median(df1$Lattitude,na.rm = T)

pc1 = unique(df1$Postcode[is.na(df1$Longtitude)])
for (x in pc1){
  df1[df1$Postcode==x & is.na(df1$Longtitude),'Longtitude'] = 
    median(df1[df1$Postcode==x,'Longtitude'],na.rm = T)
}
df1$Longtitude[is.na(df1$Longtitude)] = median(df1$Longtitude,na.rm = T)

colSums(is.na(df1))


null = lm(Price~1,data=df1)
full = lm(Price~.,data=df1)
step(null, scope=list(lower=null, upper=full), direction="forward")
m1 = lm(formula = Price ~ Rooms + Suburb + Method + Type + Bathroom + 
          Date + CouncilArea + Car + YearBuilt + Lattitude + Landsize + 
          Longtitude + BuildingArea, data = df1)
summary(m1)
-----------------------------------------------------------------------------------

split = sample.split(df1$Price,SplitRatio = 0.8)
trn = subset(df1,split == T)
str(trn)
str(df1)
tst = subset(df1,split==F)
str(tst)
m2 = lm(formula = Price ~ Rooms + Suburb + Method + Type + Bathroom + 
          Date + CouncilArea + Car + YearBuilt + Lattitude + Landsize + 
          Longtitude + BuildingArea, data = trn)
summary(m2)
pred1 = predict(m2,newdata = tst[,-4])
levels(trn$Suburb) = c(levels(trn$Suburb),'Belgrave', 'Plumpton', 'Wonga Park')
m3 = lm(formula = Price ~ Rooms + Suburb + Method + Type + Bathroom + 
          Date + CouncilArea + Car + YearBuilt + Lattitude + Landsize + 
          Longtitude + BuildingArea, data = trn)
str(trn)
pred2 = predict(m3,newdata = tst[,-4])
str(pred1)
df1$pred = pred1
df1$diff = df1$pred - df1$Price
summary(df1$diff)
var(df1$diff)

-------------------------------------------------------------------------------------
pred = predict(m1,df1[,-4])
error = df1$Price - pred
rmse=sqrt(mean(error*error))
rmse
summary(m1)
length(unique(df1$Suburb))
length(unique(trn$Suburb))
length(unique(tst$Suburb))
levels(trn$Suburb) = levels(df1$Suburb)
str(trn$Suburb)
