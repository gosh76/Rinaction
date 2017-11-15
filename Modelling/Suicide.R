df = read.csv("./data/Suicide.csv")
str(df)
library('caTools')
split = sample.split(df$Total,SplitRatio = 0.8)
trn = subset(df,split==TRUE)
tes = subset(df,split==F)
m1 = lm(Total~.,data=trn)
summary(m1)
p1 = predict(m1,newdata=tes)
length(p1)
p1[1:5]
diff = tes$Total - p1
diff[1:5]
