df1 <- read.csv('./data/dsstudents.csv',stringsAsFactors = F)
df1
str(df1)
df1[df1$name=='Lalit Sahni','mobno']
df1[df1$rollno==17010,'email']
table(df1$course)
df1[df1$rollno==17084,'stats'] = 89
df1
df1[df1$fees<=150000,]
df1[df1$gender=='M',]
df1[df1$city=='New Delhi',]
df1$rollno[df1$name=='Lalit Sahni']
df1$rollno[df1$gender=='M'][2]
df1$name[df1$hostel==T]
df1$email[df1$gender=='F']
df1$hostel[df1$course=='PGDDS']
df1$excel[df1$hostel==T]
df1[df1$hostel==T,c('name','excel')]
df1[df1$gender=='F',c('name','email','city')]
df1[df1$name=='Lalit Sahni',c('rpgm','excel','sql','stats')] = c(95,95,95,95)
df1
df1$name[df1$course=='PGDDS' & df1$gender=='M']
df1$name[df1$hostel==T & df1$dob>'1-Dec-80']
sort(df1$rollno)
df1$name[order(df1$rollno)]
df1[df1$gender=='F',c('rollno','name','email')]