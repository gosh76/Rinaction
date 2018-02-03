trn = read.csv('./data/AVtrain.csv')
str(trn)
colSums(is.na(trn))
tst = read.csv('./data/AVtest.csv')
str(tst)
colSums(is.na(tst))
m1 = glm(Income.Group~.,data=trn,family = binomial(link = 'logit'))
summary(m1)
null = glm(Income.Group~1,data=trn,family = binomial(link = 'logit'))
step(null,scope = list(lower=null,upper=m1),direction = 'forward')
m2 = glm(formula = Income.Group ~ Relationship + Education + Occupation + 
           Hours.Per.Week + Age + Sex + Workclass + Marital.Status + 
           Native.Country + Race, family = binomial(link = "logit"), 
         data = trn)
pred = predict(m2,newdata = tst,type = 'response')
pred[1:5]
predf = ifelse(pred>0.5,'>50K','<=50K')
predf[1:5]
s1 = data.frame(ID=tst$ID)
s1
s1$Income.Group = predf
head(s1)
write.csv(s1,'AV1.csv',row.names = F)
