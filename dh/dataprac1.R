df1 <- read.csv('./data/dsstudents.csv',stringsAsFactors = F)
str(df1)
df1
df1$rollno
df1$rollno[df1$rollno==170113]=17013
df1$rollno
df1[9,1]
df1[9,1]=756
df1$rollno
df1[df1$name=='Lalit Sahni',c('rollno')]
df1[df1$name=='Lalit Sahni',1]
df1[df1$name=='Lalit Sahni',c('rollno')]=17013
df1[df1$city=='New Delhi',]
df1[df1$city=='New Delhi',c('rpgm','excel','sql','stats')]
df1$rollno[df1$name=='Lalit Sahni']
df1$rollno[9]
df1[,c('name','mobno')]
df1$rollno[df1$mobno==9914901199]
df1$rollno[9]=4567
df1$rollno
lengths(df1$rollno[1])
df1$rollno[1]
class(df1$rollno[3])
str(df1$rollno[3])
df1[df1$mobno==9914901199,c('rollno')]=17013
df1
df1[df1$city=='Kolkata',c('dob','email')]
