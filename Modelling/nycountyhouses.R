library(caTools)
df = read.csv("./data/nyc.csv")
str(df)
df$ZIP.CODE = as.factor(df$ZIP.CODE)
df$LAND.SQUARE.FEET = as.numeric(df$LAND.SQUARE.FEET)
df$GROSS.SQUARE.FEET = as.numeric(df$GROSS.SQUARE.FEET)
df$SALE.PRICE = as.numeric(df$SALE.PRICE)
df$SALE.DATE = as.Date(df$SALE.DATE)
head(df$SALE.DATE)
str(df)
df$TAX.CLASS.AT.TIME.OF.SALE = as.factor(df$TAX.CLASS.AT.TIME.OF.SALE)
str(df)
df$SALE.DATE = NULL
str(df)
sum(is.na(df))
colSums(is.na(df))
df$EASE.MENT = NULL
str(df)
a1 = aggregate(df$SALE.PRICE,by=list(df$ZIP.CODE),FUN='mean')
head(a1)
zip1 = a1$Group.1[a1$x==max(a1$x)]
zip1#10803
high1 = max(a1$x)
high1#8426
df$ADDRESS = NULL
df$APARTMENT.NUMBER = NULL
m1 = lm(SALE.PRICE~.,data=df)
summary(m1)
null = lm(SALE.PRICE~1,data=df)
full = lm(SALE.PRICE~.,data=df)
step(null,scope=list(lower=null,upper=full),direction = 'forward')
