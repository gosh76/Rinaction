getwd()
df1 = read.csv(file='./data/dsstudents.csv')
df1
str(df1)
head(df1[1:2])
df2 = read.csv(file='./data/dsstudents.csv',row.names=c(paste('R',1:11,sep='')))
df2
df3 = read.csv(file='./data/dsstudents.csv',row.names=c('name'))
df3
df2
df4 = read.csv(file='./data/dsstudents.csv',row.names=1)
df4
df4$rollno2 = row.names(df4)
df4
?read.csv
