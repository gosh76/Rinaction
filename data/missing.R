df = read.csv("./data/dsstudents2.csv")
df
str(df)
summary(df)
is.na(df)
anyNA(df)
table(is.na(df))
all(is.na(df))
all(is.na(df)==F)
all(is.na(df)==T)
all(is.na(df)==F & is.na(df)==T)
complete.cases(df)
!complete.cases(df)
sum(complete.cases(df))
sum(!complete.cases(df))
df[complete.cases(df),][1:2]
mean(df$excel)
mean(df$excel,na.rm=T)
mean(df$excel,na.rm=T,trim=0.2)
mean(df$excel,na.rm=T,trim=0.4)
na.omit(df$excel)
na.omit(df)[1:2]
colSums(is.na(df))# gives column names of missing values
apply(df,2,function(x)sum(is.na(x)))
apply(is.na(df),2,sum)
length(which(is.na(df['excel']==T)))
df$excel
df$excel[is.na(df$excel)] = mean(df$excel,na.rm=T)
df$excel
df$sql[is.na(df$sql)] = max(df$stats,na.rm=T)
df$sql
colSums(is.na(df))
na_count <- sapply(df,function(y) sum(length(which(is.na(y)))))
(na_count <- data.frame(na_count))
