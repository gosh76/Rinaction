df = read.csv("./data/home_data.csv")
library('caTools')
library('rms')
dim(df)
str(df)
df$zipcode = as.factor(df$zipcode)
str(df)
length(unique(df$zipcode))
sum(is.na(df))
ha = aggregate(df[,'price'],by=list(df$zipcode),FUN='mean')
dim(ha)
ha
zip1 = ha[ha$x==max(ha$x),'Group.1']
zip1#98039
price1 = max(ha$x)
price1#2160607
head(df)
sqft1 = df[df$sqft_living>2000 & df$sqft_living <= 4000,]
dim(sqft1)[1]#9118
fr1 = dim(sqft1)[1]/dim(df)[1]
fr1#0.4218757
#myfeatures model
my_features = c('bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'zipcode')
df1 = df[,c(my_features,'price')]
dim(df1)
set.seed(0)
split = sample.split(df1$price,SplitRatio = 0.8)
train1 = subset(df1,split=T)
test1 = subset(df1,split=F)
m1 = lm(price~.,data=train1)
summary(m1)#r2 - 0.7387
pred1 = predict(m1,newdata = test1[,my_features])
head(pred1)
error1 = test1$price - pred1
rmse1 = sqrt(mean(error1*error1))
rmse1#187340.7
#advanced_features
advanced_features = c('bedrooms','bathrooms','sqft_living','sqft_lot','floors','zipcode',
  'condition', # condition of house       
  'grade', # measure of quality of construction       
  'waterfront', # waterfront property       
  'view', # type of view        
  'sqft_above', # square feet above ground        
  'sqft_basement', # square feet in basement        
  'yr_built', # the year built        
  'yr_renovated', # the year renovated        
  'lat', 'long', # the lat-long of the parcel       
  'sqft_living15', # average sq.ft. of 15 nearest neighbors         
  'sqft_lot15')
df2 = df[,c(advanced_features,'price')]
dim(df2)
set.seed(0)
split1 = sample.split(df2$price,SplitRatio = 0.8)
train2 = subset(df2,split1=T)
test2 = subset(df2,split1=F)
m2 = lm(price~.,data=train2)
summary(m2)#r2 - 0.8075
pred2 = predict(m2,newdata = test2[,advanced_features])
head(pred2)
error2 = test2$price - pred2
rmse2 = sqrt(mean(error2*error2))
rmse2#160740.4
#rmse difference
diff1 = rmse1 - rmse2
diff1#26600.29 - model m2 using advanced_features is better.
# backward elimination from advanced_features
# m2 model is trained with advanced_features
attach(train2)
#fm1 = fastbw(ols(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+zipcode+condition       
                 #+grade+waterfront+view+sqft_above+sqft_basement+yr_built+yr_renovated+       
                 #lat+long+sqft_living15+sqft_lot15),rule='p')
summary(m2)
m3 = lm(price~.-floors-sqft_basement,data=train2)
summary(m3)
#significant variables = [
'bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'zipcode',
'condition', # condition of house       
'grade', # measure of quality of construction       
'waterfront', # waterfront property       
'view', # type of view        
'sqft_above', # square feet above ground        
'yr_built', # the year built        
'yr_renovated', # the year renovated        
'lat', 'long', # the lat-long of the parcel       
'sqft_living15', # average sq.ft. of 15 nearest neighbors         
'sqft_lot15']
# prediction for id = 5309101200
str(df)
#prediction using my_features
df3 = df[df$id==5309101200,my_features]
price2 = df[df$id==5309101200,'price']
price2#620000
pred3 = predict(m1,newdata = df3 )
pred3#730386
difference1 = price2 - pred3
difference1#-110386
#prediction using advanced_features
df4 = df[df$id==5309101200,advanced_features]
pred4 = predict(m2,newdata = df4)
pred4#651893.2
difference2 = price2 - pred4
difference2#-31893.23
#m2 using advanced_features performs better 
