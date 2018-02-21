getwd
getwd()
df1 = read.csv('F:/BlackFriday/train.csv',na.strings = c(''))
str(df1)
head(df1)
colSums(is.na(df1))
u1 = unique(df1$Product_Category_2)
length(u1)
summary(df1)
table(df1$Product_Category_2)
sort(table(df1$Product_Category_2),decreasing = T)
names(sort(table(df1$Product_Category_2),decreasing = T))[1]
df1$Product_Category_2[is.na(df1$Product_Category_2)] = names(sort(table(df1$Product_Category_2),decreasing = T))[1]
df1$Product_Category_3[is.na(df1$Product_Category_3)] = names(sort(table(df1$Product_Category_3),decreasing = T))[1]
colSums(is.na(df1))
df1$User_ID = NULL
df1$Product_ID = NULL
m1 = lm(Purchase~.,data=df1)
summary(m1)#r2 - 0.2137
8+7*1.5
df1$Product_Category_1[df1$Product_Category_1>18.5]=18.5
12054-5823
12054+1.5*6231
df1$Purchase[df1$Purchase>21400.5]=21400
5823-1.5*6231
m2 = lm(Purchase~.,data=df1)
summary(m2)#r2 - 0.2155
plot(df1$Purchase,df1$Product_Category_2)
