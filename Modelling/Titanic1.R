library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
d1 = read.csv("./data/train.csv",stringsAsFactors = F,na='')
head(d1)
colnames(d1)
str(d1)
d1[!complete.cases(d1),]
colSums(is.na(d1))
names(sort(table(d1$Embarked),decreasing = T))[1]
d1$Embarked[is.na(d1$Embarked)] = names(sort(table(d1$Embarked),decreasing = T))[1]
colSums(is.na(d1))
d1$Cabin <- NULL
colnames(d1)
apply(d1,2,function(x) length(unique(x)))#finding unique elements per column
cols = c('Survived','Pclass','Sex','Embarked')#selecting column with 2,3 categories
for (i in cols){
  d1[,i] = as.factor(d1[,i])
}
ggplot(d1,aes(x=Pclass,fill=factor(Survived))) + geom_bar() +
ggtitle("Pclass v/s Survival Rate")+ xlab("Pclass") + ylab("Total Count") +
  labs(fill = "Survived") # Pclass analysis
ggplot(d1,aes(x=Sex,fill=factor(Survived)))+geom_bar()+
  ggtitle("Sex Vs Survival Rate")+xlab("Sex")+ylab("Total Count")+
  labs(fill="Survived")# Sex analysis
ggplot(d1,aes(x=Sex,fill=factor(Survived)))+geom_bar()+facet_wrap(~Pclass)+
  ggtitle("3D view of Sex,Pclass & Survived")+xlab("Sex")+ylab('Total Count')+
  labs(fill='Survived')# 3D view of sex,Pclass & Survived
head(d1$Name)
d1$Title <-  gsub("^.*, (.*?)\\..*$", "\\1", d1$Name)#getting title from names
head(d1$Title)
table(d1$Sex,d1$Title)
officer = c( 'Capt','Col','Don','Dr','Jonkheer','Major','Rev','Sir')
d1$Title[d1$Title %in% officer] = 'officer'
ladies = c('Lady','Miss','Mlle','Mme','the Countess','Ms')
d1$Title[d1$Title %in% ladies] = "Miss"
table(d1$Sex,d1$Title)
ggplot(d1,aes(x=Title,fill=factor(Survived)))+geom_bar()+
  ggtitle("TiTle Vs Survived")+xlab("Title")+ylab("Count")+labs(fill='Survived')
ggplot(d1,aes(x=Title,fill=factor(Survived)))+geom_bar()+facet_wrap(~Pclass)+
  ggtitle("3D view of TiTle,Pclass & Survived")+xlab("Title")+ylab("Count")+labs(fill='Survived')

d1$Fsize = d1$SibSp + d1$Parch + 1
ggplot(d1,aes(x=Fsize,fill=factor(Survived)))+geom_bar()+ggtitle("Fsize Vs Survived")+
  xlab("Fsize")+ylab("Count")+labs(fill="Survived")
d1$Fsize[d1$Fsize==1] = "Single"
d1$Fsize[d1$Fsize>1 & d1$Fsize<5] = 'small'
d1$Fsize[d1$Fsize>4] = 'large'
ggplot(d1,aes(x=d1$Fsize,fill=factor(Survived)))+geom_bar()+ggtitle("Fsize Vs Survived")+
  xlab("Fsize")+ylab("Count")+labs(fill='Survived')

ggplot(d1,aes(x=d1$Embarked,fill=factor(Survived)))+geom_bar()+ggtitle("Embarked Vs Survived")+
  xlab("Embarked")+ylab("Count")+labs(fill='Survived')

d1$Age <- NULL#dropping Age
colnames(d1)
d1$Name <- NULL#dropping name
colnames(d1)
d1$Ticket <- NULL
d1$Title <- as.factor(d1$Title)
d1$Fsize <- as.factor(d1$Fsize)
set.seed(156)
str(d1)
split = sample.split(d1$Survived,SplitRatio = 0.8)
trn = subset(d1,split==TRUE)
str(trn)
tes = subset(d1,split==FALSE)
str(tes)
length(unique(d1$Fsize))
c1 = glm(factor(Survived)~Pclass+Sex+SibSp+Parch+Fare+Embarked+Title,data=trn,family=binomial)
#Fsize is not taken in model as it is a factor with only 1 level
summary(c1)
c2 = glm(factor(Survived)~Pclass+SibSp+Parch+Title,data=trn,family=binomial)
summary(c2)
fm = fastbw(lrm(factor(Survived)~Pclass+Sex+SibSp+Parch+Fare+Embarked+Title),rule='p')
fm# Factors in Final Model - Pclass SibSp  Parch  Title
c3 = glm(factor(Survived)~Pclass+SibSp+Parch+Title,data=trn,family=binomial)
pred1 = predict(c3,type='response',newdata=tes[c('Pclass','SibSp','Parch','Title')])
str(pred1)
spred = ifelse(pred1>0.5,1,0)
str(spred)
cm = table(tes$Survived,spred)
cm
Accuracy = (96+46)/length(tes$Survived)
Accuracy
