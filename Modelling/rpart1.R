train1 = data.frame(rollno=c(1,2,3),gender=c('M','M','F'),play=c('Play','NoPlay','Play'))
train1
library(rpart)
mytree1=rpart(play~gender,data=train1,method='class')
mytree1
train2 = data.frame(rollno=c(1,2,3,4),gender=c('M','M','F','F'),play=c('NoPlay','NoPlay','Play','Play'))
mytree2 = rpart(play~gender,data=train2,method='class')
mytree2
mytree3 = rpart(play~gender,data=train2,method='class',minsplit=1,minbucket=1)
mytree3
train3 = data.frame(rollno=c(1,2,3,4,5,6,7),gender=c('M','M','F','M','F','F','M'),
                    play=c('Play','Play','NoPlay','Play','Play','NoPlay','Play'))
mytree3 = rpart(play~gender,data=train3,method='class',minsplit=2,minbucket=1)
mytree3
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(mytree3)
train3$married = c('Married','Single','Married','Married','Married','Single','Single')
mytree4b = rpart(play~gender+married,data=train3,method='class',minsplit=2,minbucket=1,cp=-1)
mytree4b
mytree4c = rpart(play~gender+married,data=train3,method='class',minsplit=2,minbucket=1)
mytree4c
fancyRpartPlot(mytree4b)
mytree4b$where
predict(mytree4b,newdata = train3)
