df3 = read.csv("./data/dsstudents2.csv",stringsAsFactors = F)
str(df3)
df3$dob = as.Date(df3$dob,format="%d-%b-%y")
head(df3$dob)
df3$age = round(difftime(Sys.Date(),df3$dob,units = 'weeks')/52)
head(df3$age)
sum(is.na(df3))
df3[!complete.cases(df3),]
colSums(is.na(df3))
df3$hostel[is.na(df3$hostel)] = names(table(sort(df3$hostel)))[1]
colSums(is.na(df3))
df3$fees[is.na(df3$fees)] = mean(df3$fees,na.rm = T)
colSums(is.na(df3))
df3$excel[is.na(df3$excel)] = mean(df3$excel,na.rm=T)
df3$sql[is.na(df3$sql)] = mean(df3$sql,na.rm=T)
colSums(is.na(df3))
df1 = data.frame(17000, 'Ramesh Singh', 'MSC','' ,TRUE, '1994-10-17', 50000,
      'ramesh@gmail.com','' , 'Delhi', '','' ,'' ,'')
str(df1)
colnames(df1) = colnames(df3[1:14])
df1
df1$dob = as.Date.factor(df1$dob)
head(df1$dob)
df1$age = round(difftime(Sys.Date(),df1$dob,units='weeks')/52)
df2 = rbind(df3,df1)
str(df2)
df2$excel = as.numeric(df2$excel)
str(df2)
df2$rpgm = as.numeric(df2$rpgm)
df2$sql = as.numeric(df2$sql)
df2$stats = as.numeric(df2$excel)
df2$gender = as.factor(df2$gender)
df2$course = as.factor(df2$course)
df2$hostel = as.logical(df2$hostel)
str(df2)
colSums(is.na(df2))
df2
df2$age = as.numeric(df2$age)
df2
df2$city[df2$city==''] = 'Delhi'
df2
df2$gender[df2$gender==''] = 'M'
df2
df2$excel[is.na(df2$excel)] = median(df2$excel,na.rm=T)
df2
df2$rpgm[is.na(df2$rpgm)] = median(df2$rpgm,na.rm=T)
df2
df2$sql[is.na(df2$sql)] = median(df2$sql,na.rm=T)
df2$stats[is.na(df2$stats)] = median(df2$stats,na.rm=T)
df2
df3a = df2
addmargins(as.matrix(df3a[,c('rpgm','excel','sql','stats')]),c(2,1,1),FUN = list('sum','mean','median'))
levels(df3a$gender)[1] = 'F'
levels(df3a$gender)
table(df3a$course,df3a$gender)
addmargins(table(df3a$course,df3a$gender),FUN=list('sum','sum'))
prop.table(table(df3a$course,df3a$gender))
df3a
df3a$average = round((df3a$rpgm+df3a$excel+df3a$sql+df3a$stats)/4)
df3a
for (i in 1:nrow(df3a)){
  if(df3a[i,'average'] > 70)
    {df3a[i,'grade'] = 'A'} 
  else if (df3a[i,'average'] >= 60 & df3a[i,'average'] <= 70 )
    {df3a[i,'grade'] = 'B'} 
  else if (df3a[i,'average'] < 60)
    {print(i)
    df3a[i,'grade'] = 'C'
    }
}
df3a
df3a$rank = rank(-df3a$average)
df3a
aggregate(df3a[,c('rpgm','excel','sql','stats')],by=list(df3a$course),FUN=mean)
split(df3a,df3a$course)
split(df3a,df3a$gender)
split(df3a,df3a$hostel)
df3a$bigd = runif(12,100,150)
df3a
df3a$bigs = scale(df3a$bigd,center = F)
df3a
df4 = df3a[,c('rpgm','excel','sql','stats')]
df4
g1 = colMeans(df4)
barplot(g1)
