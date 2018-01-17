stocks = read.csv('./data/StocksCluster.csv')
str(stocks)
#Q1 - 11580 obs.
length(stocks$PositiveDec[stocks$PositiveDec==1])/nrow(stocks)
#Q2 - 0.546114
colSums(is.na(stocks))# no NAs
v1 = colnames(stocks)
v1
stocks[[v1[1]]][1:5]
v2 = c()
n = 1
for (x in 1:11){
  for (y in 1:11){
    if (y > x){
      c = cor(stocks[[v1[x]]],stocks[[v1[y]]])
      v2[n] = c
      n = n + 1
    }
  }
}
print(n)
v2[1:5]
m1 = max(abs(v2))
m1#Q3 - 0.1916728
# splitting data
library(caTools)
set.seed(1234)
s1 = sample.split(stocks$PositiveDec,SplitRatio = 0.85)
trn = subset(stocks,s1==T)
tst = subset(stocks,s1==F)
str(trn)
str(tst)
# creating logistic regression model without any clustering
model1 = glm(PositiveDec~.,data=trn,family = binomial(link='logit'))
summary(model1)
#ReturnAug is insignificant with p-value of 0.603
#ReturnApr    1.12063
#ReturnJuly   0.78394
#ReturnMay    0.68935
#ReturnNov   -0.84449
#ReturnOct   -0.56311
#ReturnFeb   -0.47577
#exp(coeff) to be done
# predicting
EreturnApr = exp(1.12063)
EreturnApr#3.066786
EreturnJuly = exp(0.78394)
EreturnJuly#2.190084
EreturnMay = exp(0.68935)
EreturnMay# 1.99242
pred = predict(model1,newdata = tst,type = 'response')
pred[1:5]
pred1 = ifelse(pred>0.5,1,0)
pred1[1:5]
library(caret)
confusionMatrix(tst$PositiveDec,pred1)
#Accuracy : 0.5613
#Sensitivity : 0.5359
#Specificity : 0.5680


# Clustering
preproc = preProcess(stocks)
stocksn = predict(preproc,stocks)
set.seed(1234)
scluster = kmeans(stocksn, centers = 5, iter.max = 1000)
table(scluster$cluster)
#cluster sizes- 773 4467  282 1048 5010
stocks1 = data.frame(stocks,scluster$cluster)
head(stocks1)
class(scluster)
head(scluster)
# cluster1 - splitting,modelling & prediction
cluster1 = stocks1[stocks1$scluster.cluster==1,]
head(cluster1)
cluster1$scluster.cluster = NULL
set.seed(1234)
s2 = sample.split(cluster1$PositiveDec,SplitRatio = 0.85)
trn1 = subset(cluster1,s2==T)
colSums(is.na(trn1))
tst1 = subset(cluster1,s2==F)
cmodel1 = glm(PositiveDec~.,data = trn1,family = binomial(link='logit'))
summary(cmodel1)
cmodel12 = glm(PositiveDec~ReturnMar+ReturnNov+ReturnOct+ReturnJune+ReturnJuly+ReturnApr
+ReturnMay,data = trn1,family = binomial(link='logit'))
summary(cmodel12)

#ReturnMar    -2.0078
#ReturnNov    -1.6929
#ReturnOct    -1.0556
#ReturnJune    1.1095 
#ReturnJuly    1.4511
#ReturnApr     0.8685
#ReturnMay     0.8885
#oddsratio
E1july = exp(1.4511)#4.2678
E1june = exp(1.1095)#3.0328
E1may = exp(0.8885)#2.4314
cpred1 = predict(cmodel12,newdata = tst1,type = 'response')
cpred1[1:5]
cpred1f = ifelse(cpred1>0.5,1,0)
cpred1f[1:5]
confusionMatrix(tst1$PositiveDec,cpred1f)
#Accuracy : 0.6466

# cluster2 - splitting,modelling & prediction
cluster2 = stocks1[stocks1$scluster.cluster==2,]
cluster2$scluster.cluster = NULL
set.seed(1234)
s3 = sample.split(cluster2$PositiveDec,SplitRatio = 0.85)
trn2 = subset(cluster2,s3==T)
tst2 = subset(cluster2,s3==F)
cmodel2 = glm(PositiveDec~.,data = trn2,family = binomial(link='logit'))
summary(cmodel2)
length(cluster2$PositiveDec[cluster2$PositiveDec==1])
# cluster2 has all zeros for PositiveDec


# cluster3 - splitting,modelling & prediction
cluster3 = stocks1[stocks1$scluster.cluster==3,]
cluster3$scluster.cluster = NULL
set.seed(1234)
s4 = sample.split(cluster3$PositiveDec,SplitRatio = 0.85)
trn3 = subset(cluster3,s4==T)
tst3 = subset(cluster3,s4==F)
cmodel3 = glm(PositiveDec~.,data = trn3,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel3)
cmodel31 = glm(PositiveDec~ ReturnMar+ReturnApr+ReturnAug+ReturnOct,data = trn3,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel31)
cmodel32 = glm(PositiveDec~ ReturnMar+ReturnApr+ReturnAug,data = trn3,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel32)
#ReturnMar     1.0360
#ReturnApr     1.6651
#ReturnAug     1.7073
#oddsratio
E2aug = exp(1.7073)#5.514
1/(1+5.514)
E2apr = exp(1.6651)#5.286
E2mar = exp(1.0360)#2.817
cpred3 = predict(cmodel32,newdata = tst3,type = 'response')
cpred3f = ifelse(cpred3>0.5,1,0)
confusionMatrix(tst3$PositiveDec,cpred3f)
#Accuracy : 0.5

# cluster4 - splitting,modelling & prediction
cluster4 = stocks1[stocks1$scluster.cluster==4,]
cluster4$scluster.cluster = NULL
set.seed(1234)
s5 = sample.split(cluster4$PositiveDec,SplitRatio = 0.85)
trn4 = subset(cluster4,s5==T)
tst4 = subset(cluster4,s5==F)
cmodel4 = glm(PositiveDec~.,data = trn4,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel4)
cmodel41 = glm(PositiveDec~ ReturnJan+ReturnMar+ReturnApr+ReturnOct+ReturnJuly
               ,data = trn4,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel41)
#ReturnJan     0.8829
#ReturnMar    -0.5916
#ReturnApr    -1.3687
#ReturnOct    -1.0956 
#ReturnJuly   -1.1375
#oddsratio
E4jan = exp(0.8829)#2.417
E4mar = exp(-0.5916)#0.553
E4oct = exp(-1.0956)#0.334
cpred4 = predict(cmodel41,newdata = tst4,type = 'response')
cpred4f = ifelse(cpred4>0.5,1,0)
confusionMatrix(tst4$PositiveDec,cpred4f)
#Accuracy : 0.7707 

# cluster5 - splitting,modelling & prediction
cluster5 = stocks1[stocks1$scluster.cluster==5,]
cluster5$scluster.cluster = NULL
set.seed(1234)
s6 = sample.split(cluster5$PositiveDec,SplitRatio = 0.85)
trn5 = subset(cluster5,s6==T)
tst5 = subset(cluster5,s6==F)
cmodel5 = glm(PositiveDec~.,data = trn5,family = binomial(link='logit'),control = list(maxit = 50))
summary(cmodel5)
length(cluster5$PositiveDec[cluster5$PositiveDec==1])
nrow(cluster5)
#cluster5 has all ones for PositiveDec