trn = read.csv("./data/t1train.csv",na.strings = c(""))
tst = read.csv('./data/t1test.csv',na.strings = c(""))
str(trn)
colSums(is.na(trn))
summary(trn)
library(Amelia)
missmap(trn, main = "Missing values vs Observed")
trn1 = subset(trn,select = -c(Cabin,PassengerId,Ticket, Name))
trn1$Age[is.na(trn1$Age)]=mean(trn1$Age,na.rm = T)
colSums(is.na(trn1))
trn1<-trn1[!is.na(trn1$Embarked),]
colSums(is.na(trn1))
rownames(trn1) = NULL
library(caTools)
set.seed(113)
spl = sample.split(trn1$Survived,0.85)
trn1t = subset(trn1,spl==T)
trn1v = subset(trn1,spl==F)
dim(trn1t)
m1 = glm(Survived~.,data=trn1t,family = binomial(link = 'logit'))
summary(m1)
m2 = glm(Survived~Pclass+ Sex+ Age+ SibSp+ Embarked,data=trn1t,family = binomial(link = 'logit'))
summary(m2)
m3 = glm(Survived~Pclass+ Sex+ Age+ SibSp+ I(Embarked=='S'),data=trn1t,family = binomial(link = 'logit'))
summary(m3)
library(car)
vif(m3)
anova(m3, test = "Chisq")
library(BaylorEdPsych)
PseudoR2(m3)
pred_sur=predict(m3,newdata=trn1v,type="response")
pred1 = ifelse(pred_sur>0.5,1,0)
library(caret)
confusionMatrix(pred1,trn1v$Survived)
library(ROCR)
pr <- prediction(pred_sur, trn1v$Survived)
pr
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
prf
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc

str(tst)
colSums(is.na(tst))
tst$Age[is.na(tst$Age)] = median(tst$Age,na.rm=T)
tst$Fare[is.na(tst$Fare)] = median(tst$Fare,na.rm=T)
colSums(is.na(tst))
tst1 = subset(tst,select = -c(Cabin,PassengerId,Ticket,Name))
str(tst1)
tstpred = predict(m3,newdata = tst1,type='response')
tstpred[1:10]
tstpred1 = ifelse(tstpred>0.5,1,0)
tstpred1[1:10]
m3$coefficients
#odds ratio
exp(m3$coefficients)#Pclass is 0.328 times more likely to survive
