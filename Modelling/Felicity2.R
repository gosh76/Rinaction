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
head(hero)
hero$roles = as.character(hero$roles)
r1 = c()
r2 = c()
r3 = c()
r4 = c()
r5 = c()
r6 = c()
for (x in 1:nrow(hero)){
  r1[x] = strsplit(hero$roles[x],':')[[1]][1]
  r2[x] = strsplit(hero$roles[x],':')[[1]][2]
  r3[x] = strsplit(hero$roles[x],':')[[1]][3]
  r4[x] = strsplit(hero$roles[x],':')[[1]][4]
  r5[x] = strsplit(hero$roles[x],':')[[1]][5]
  r6[x] = strsplit(hero$roles[x],':')[[1]][6]
}
nrow(hero)
class(as.factor(r1))
hero$R1 = r1
hero$R2 = r2
hero$R3 = r3
hero$R4 = r4
hero$R5 = r5
hero$R6 = r6
str(hero)
hero$roles = NULL
colSums(is.na(hero))
hero$R2[is.na(hero$R2)] = 'None'
hero$R3[is.na(hero$R3)] = 'None'
hero$R4[is.na(hero$R4)] = 'None'
hero$R5[is.na(hero$R5)] = 'None'
hero$R6[is.na(hero$R6)] = 'None'
colSums(is.na(hero))

hero$R1 = as.factor(hero$R1)
hero$R2 = as.factor(hero$R2)
hero$R3 = as.factor(hero$R3)
hero$R4 = as.factor(hero$R4)
hero$R5 = as.factor(hero$R5)
hero$R6 = as.factor(hero$R6)

c1$id = NULL
str(c1)
c2 = c1[,c(1:4)]
str(c2)

hc1 = merge(c1,hero,by='hero_id')
hc2 = merge(c2,hero,by='hero_id')
colSums(is.na(hc2))
ids = test1$id

#c1$num_wins = NULL

tc = merge(test1,hero,by='hero_id')
tc$id = NULL
nrow(tc)

#model1
library(randomForest)
rf1 = randomForest(num_wins~.,data=hc2)
pred = predict(rf1,newdata = tc)
length(pred)
pred1 = round(pred)
tc$num_wins = pred1

str(hc1)
#model2
rf2 = randomForest(kda_ratio~.,data=hc1)
pred2 = predict(rf2,newdata = tc,type='class')
pred2[1:5]
length(pred2)


sub1 = data.frame(id = ids)
sub1$kda_ratio = pred2
head(sub1)
write.csv(sub1,'FelicityR2.csv',row.names = F)
