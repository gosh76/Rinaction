library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
library(MASS)
library(nnet)
tr = read.csv("./data/CFhousing.csv")
str(tr)
sum(is.na(tr))
colSums(is.na(tr))
plot(tr$total_bedrooms,tr$households,xlim=c(0,2000),ylim = c(0,2000))
cor(tr$total_bedrooms,tr$households,method='pearson',use='complete.obs')#0.9797283
head(tr)
tr[is.na(tr$total_bedrooms),'total_bedrooms'] = tr$households[is.na(tr$total_bedrooms)]
colSums(is.na(tr))
length(unique(tr$longitude))
length(unique(tr$latitude))
length(unique(tr$ocean_proximity))
agg1 = aggregate(tr$median_house_value,by=list(tr$ocean_proximity),FUN='mean')
agg1
op = agg1$Group.1[agg1$x==max(agg1$x)]
op#ISLAND
length(unique(tr$housing_median_age))
plot(tr$housing_median_age,tr$median_house_value)#no correlation
plot(tr$total_rooms,tr$median_house_value,xlim=c(0,10000))
plot(tr$population,tr$median_house_value,xlim=c(0,5000))
plot(tr$households,tr$median_house_value,xlim=c(0,2000))
plot(tr$median_income,tr$median_house_value,xlim=c(0,8))
cor(tr$median_income,tr$median_house_value,method='pearson',use='complete.obs')#0.688
plot(tr$latitude,tr$median_house_value)
plot(tr$longitude,tr$median_house_value)

# splitting into train & test sets
set.seed(1234)
s1 = sample.split(tr$median_house_value,SplitRatio = .80)
train = subset(tr,s1==T)
test = subset(tr,s1==F)
dim(train)
dim(test)

#lm model
m1 = lm(median_house_value~.,data=train)
summary(m1)# r2 - 0.6465
null = lm(median_house_value~1,data=train)
full = lm(median_house_value~.,data=train)
step(null, scope=list(lower=null, upper=full), direction="forward")
m2 = lm(formula = median_house_value ~ median_income + ocean_proximity + 
          housing_median_age + total_bedrooms + population + households + 
          total_rooms + longitude + latitude, data = train)
summary(m2)# r2 - 0.6465

#taking latitude & longitude as factors
tr1 = tr
str(tr1)
tr1$longitude = as.factor(tr1$longitude)
tr1$latitude = as.factor(tr1$latitude)

#splitting
set.seed(1234)
s2 = sample.split(tr1$median_house_value,SplitRatio = 0.8)
train1 = subset(tr1,s2==T)
test1 = subset(tr1,s2==F)
m3 = lm(median_house_value~.,data=train1)
summary(m3)#0.7447
#adjusted r2 has improved from 0.64 to 0.74 after taking latitude & longitude as factors
pred3 = predict(m3,test1)#error that factor longitude has new levels
