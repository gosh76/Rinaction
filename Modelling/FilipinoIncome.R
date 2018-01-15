library(caTools)
library(rms)
df1 = read.csv("./data/FilipinoIncome.csv")
str(df1)
attach(df1)
plot(Total.Household.Income,Region)
sum(is.na(df1))
colSums(is.na(df1))
plot(Household.Head.Highest.Grade.Completed,Household.Head.Occupation)
length(unique(Household.Head.Highest.Grade.Completed))
unique(Household.Head.Highest.Grade.Completed)[1]
h1 = unique(df1$Household.Head.Highest.Grade.Completed[is.na(df1$Household.Head.Occupation)])
for (x in h1){
  df1[df1$Household.Head.Highest.Grade.Completed==x & is.na(df1$Household.Head.Occupation),'Household.Head.Occupation'] = 
    names(sort(table(df1$Household.Head.Occupation[df1$Household.Head.Highest.Grade.Completed==x]),decreasing = T))[1]
}
h2 = unique(df1$Household.Head.Highest.Grade.Completed[is.na(df1$Household.Head.Class.of.Worker)])
length(h2)
for (x in h2){
  df1[df1$Household.Head.Highest.Grade.Completed==x & is.na(df1$Household.Head.Class.of.Worker),'Household.Head.Class.of.Worker'] = 
    names(sort(table(df1$Household.Head.Class.of.Worker[df1$Household.Head.Highest.Grade.Completed==x]),decreasing = T))[1]
}
sum(is.na(df1))
a1 = aggregate(df1$Total.Household.Income,by=list(df1$Region),mean)
HIR = a1[a1$x==max(a1$x),'Group.1']
HI = max(a1$x)
HI#420861.9
HIR#NCR
plot(a1$Group.1,a1$x)
str(df1)
a2 = aggregate(df1$Total.Household.Income,by = list(df1$Household.Head.Occupation),mean)
HIO = a2[a2$x==max(a2$x),'Group.1']
HIO#Aircraft pilots, navigators and flight engineers
IO = max(a2$x)
IO#2089931
plot(House.Floor.Area,Total.Household.Income,ylim=c(0,2000000))
cor(House.Floor.Area,Total.Household.Income)#0.343209
c1 = colnames(df1[,c(3,6:16,18:24)])
length(c1)
c1[1:5]
v1 = c()
v2 = c()
n = 1
for (u in c1){
  l1 = aggregate(df1[[u]],by = list(df1$Household.Head.Occupation),mean)
  v1[n] = as.character(l1[l1$x==max(l1$x),'Group.1'])
  v2[n] = max(l1$x)
  n = n + 1
}
length(v1)
v1
length(v2)
v2
ef1 = data.frame(c1,v1,v2)
ef1
str(df1)
s1 = sample.split(df1$Total.Household.Income,SplitRatio = 0.8)
trn = subset(df1,s1==T)
tst = subset(df1,s1==F)
str(trn)
str(tst)
m1 = lm(Total.Household.Income~.,data=trn)
summary(m1)
m1$xlevels[["Household.Head.Marital.Status"]] <- union(m1$xlevels[["Household.Head.Marital.Status"]], levels(tst$Household.Head.Marital.Status))
m1$xlevels[["Household.Head.Occupation"]] <- union(m1$xlevels[["Household.Head.Occupation"]], levels(tst$Household.Head.Occupation))
pred = predict(m1,newdata = tst)
pred[1:6]
pred1 = ifelse(pred > 0,pred,0)
pred1[1:10]
error = tst$Total.Household.Income - pred1
rmse=sqrt(mean(error*error))
rmse#267000
null = lm(Total.Household.Income~1,data=trn)
step(null,scope=list(lower=null,upper=m1),direction = 'forward')
m2 = lm(formula = Total.Household.Income ~ Communication.Expenditure + 
          Total.Income.from.Entrepreneurial.Acitivites + Miscellaneous.Goods.and.Services.Expenditure + 
          Housing.and.water.Expenditure + Total.Food.Expenditure + 
          Main.Source.of.Income + Transportation.Expenditure + Household.Head.Occupation + 
          Special.Occasions.Expenditure + Medical.Care.Expenditure + 
          Total.number.of.family.members.employed + Clothing..Footwear.and.Other.Wear.Expenditure + 
          Education.Expenditure + Number.of.Airconditioner + Household.Head.Highest.Grade.Completed + 
          Crop.Farming.and.Gardening.expenses + Imputed.House.Rental.Value + 
          Household.Head.Job.or.Business.Indicator + Region + Number.of.Personal.Computer + 
          Bread.and.Cereals.Expenditure + Household.Head.Age + Number.of.Stove.with.Oven.Gas.Range + 
          Number.of.bedrooms + Members.with.age.5...17.years.old + 
          Household.Head.Marital.Status + Vegetables.Expenditure + 
          Household.Head.Class.of.Worker + Number.of.Car..Jeep..Van + 
          Number.of.Landline.wireless.telephones + Alcoholic.Beverages.Expenditure + 
          Household.Head.Sex + Members.with.age.less.than.5.year.old + 
          Electricity + Number.of.Refrigerator.Freezer + Number.of.Component.Stereo.set + 
          Total.Number.of.Family.members + Number.of.Motorcycle.Tricycle + 
          Tobacco.Expenditure + House.Age, data = trn)
summary(m2)

m2$xlevels[["Household.Head.Occupation"]] <- union(m2$xlevels[["Household.Head.Occupation"]], levels(tst$Household.Head.Occupation))

m2$xlevels[["Household.Head.Marital.Status"]] <- union(m2$xlevels[["Household.Head.Marital.Status"]], levels(tst$Household.Head.Marital.Status))
pred2 = predict(m2,newdata = tst)
pred2[1:5]
pred3 = ifelse(pred2>0,pred2,0)
pred3[1:5]
error1 = tst$Total.Household.Income - pred3
rmse1=sqrt(mean(error1*error1))
rmse1#40308571
