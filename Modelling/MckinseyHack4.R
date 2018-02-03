library(caret)
library(ggplot2)
library(rpart.plot)
library(pROC)
library(ROCR)
library(rpart)
library(randomForest)
library(caTools)
library(e1071)
trn = read.csv('./data/Mckinsey1/train.csv')
str(trn)
trn$ID = NULL
trn$DOB = NULL
colSums(is.na(trn))
tst = read.csv('./data/Mckinsey1/test.csv')
str(tst)
Ids = tst$ID
tst$ID = NULL 
tst$DOB = NULL
nrow(trn)#69713
nrow(tst)#30037
str(trn)
trn1 = trn[,1:19]
str(trn1)
colSums(is.na(tst))
c1 = rbind(trn1,tst)
nrow(c1)
c1$Employer_Category2 = median(c1$Employer_Category2,na.rm=T)
colSums(is.na(c1))
c1$Existing_EMI = median(c1$Existing_EMI,na.rm=T)
c1$Loan_Amount = median(c1$Loan_Amount,na.rm=T)
c1$Loan_Period = median(c1$Loan_Period,na.rm=T)
c1$Interest_Rate = median(c1$Interest_Rate,na.rm=T)
c1$EMI = median(c1$EMI,na.rm=T)
colSums(is.na(c1))
train = head(c1,69713)
train1 = cbind(train,trn$Approved)
train1$Approved = train1$`trn$Approved`
train1$`trn$Approved` = NULL
str(train1)
test1 = tail(c1,30037)

train1$Lead_Creation_Date = NULL
train1$City_Code = NULL
train1$Employer_Code = NULL
train1$Customer_Existing_Primary_Bank_Code = NULL
rf1 = randomForest(Approved~.,data=train1)
test1$Lead_Creation_Date = NULL
test1$City_Code = NULL
test1$Employer_Code = NULL
test1$Customer_Existing_Primary_Bank_Code = NULL
pred = predict(rf1,newdata = test1,type='class')
pred[1:5]
pred4 = ifelse(pred>0.15,1,0)
sub4 = data.frame(ID = Ids)
sub4
sub4$Approved = pred4
head(sub4)
pred4[1:10]
length(sub4$Approved[sub4$Approved==0])
write.csv(sub4,'MckinseyHack4.csv',row.names = F)
