library(randomForest)
trn = read.csv('./data/LoanPrediction/train.csv',na.strings = c(""))
tst = read.csv('./data/LoanPrediction/test.csv',na.strings = c(""))
str(trn)
str(tst)
target = trn$Loan_Status
trn$Loan_Status=NULL
ids = tst$Loan_ID
c1 = rbind(trn,tst)
colSums(is.na(c1))
c1$Loan_ID=NULL
library(mice)
set.seed(1234)
df1 = complete(mice(c1))
str(df1)
trn1 = head(df1,nrow(trn))
tst1 = tail(df1,nrow(tst))
str(trn1)
colSums(is.na(trn1))
colSums(is.na(tst1))
trn1$Loan_Status = target
str(trn1)
rf1 = randomForest(Loan_Status~.,data=trn1)
pred = predict(rf1,newdata = tst1,type='class')
pred[1:5]
sub1 = data.frame(Loan_ID=ids)
sub1$Loan_Status = pred
head(sub1)
write.csv(sub1,"LoanPrediction1.csv",row.names = F)
