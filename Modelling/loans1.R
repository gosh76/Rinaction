df = read.csv("./data/loans.csv")
str(df)
length(df$not.fully.paid[df$not.fully.paid==1])/nrow(df)#Q1 - 0.1600543
colSums(is.na(df))
#Q2 - days.with.cr.line,revol.util,inq.last.6mths,delinq.2yrs,pub.rec
library(mice)
set.seed(144)
vars.for.imputation = setdiff(names(df), "not.fully.paid")
imputed = complete(mice(df[vars.for.imputation]))
df[vars.for.imputation] = imputed
as.data.frame(colSums(is.na(df)))
library(caTools)
s1 = sample.split(df$not.fully.paid,SplitRatio = 0.85)
trn = subset(df,s1==T)
str(trn)
tst = subset(df,s1==F)
str(tst)
m1 = glm(not.fully.paid~.,data=trn,family = binomial(link = 'logit'))
summary(m1)
colnames(trn)

m2 = glm(not.fully.paid~credit.policy+purpose+installment+log.annual.inc+fico+
revol.bal+revol.util+inq.last.6mths+pub.rec,data=trn,family = binomial(link = 'logit'))
summary(m2)
#Q3 - credit.policy,purpose,installment,log.annual.inc,fico,revol.bal,revol.util,inq.last.6mths,pub.rec
c1 = as.data.frame(m2$coefficients)
c1
n1 = row.names(c1)
n1
c1$names = n1
c1
c2 = c1[order(c1$'m2$coefficients'),]
t1 = tail(c2,5)
t1
Epurpose7 = exp(c2$`m2$coefficients`[c2$names=='purpose7'])
Epurpose7# 1.731288
Epub.rec = exp(c2$`m2$coefficients`[c2$names=='pub.rec'])
Epub.rec#1.394669
Epurpose4 = exp(c2$`m2$coefficients`[c2$names=='purpose4'])
Epurpose4#1.13646
pred = predict(m2,newdata = tst,type='response')
pred[1:5]
pred1 = ifelse(pred>0.5,1,0)
pred1[1:5]
library(caret)
confusionMatrix(pred1,tst$not.fully.paid)
#Accuracy - 0.8441

levels(trn$purpose)
