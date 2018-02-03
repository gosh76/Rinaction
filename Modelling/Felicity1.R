train9 = read.csv('./data/Felicity/train9.csv')
train1 = read.csv('./data/Felicity/train1.csv')
test9 = read.csv('./data/Felicity/test9.csv')
test1 = read.csv('./data/Felicity/test1.csv')
hero = read.csv('./data/Felicity/hero_data.csv')
head(train9)
c1 = rbind(train9,train1,test9)
nrow(c1)
colSums(is.na(c1))
colSums(is.na(test1))
colSums(is.na(hero))
ids = test1$id
c1$id = NULL
c1$num_wins = NULL
str(c1)
c2 = merge(c1,hero,by='hero_id')
str(c2)
c2$roles=NULL
ids = test1$id
test1$id = NULL
test = merge(test1,hero,by='hero_id')
test$roles = NULL
library(randomForest)
rf1 = randomForest(kda_ratio~.,data=c2)
pred = predict(rf1,newdata = test,type= 'class')
pred[1:5]
sub1 = data.frame(id = ids)
sub1$kda_ratio = pred
head(sub1)
write.csv(sub1,'FelicityR1.csv',row.names = F)
