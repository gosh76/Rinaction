df1 = read.csv(file='./data/dsstudents.csv')
str(df1)
names(df1)
df1a = read.csv(file=file.choose())
colcls = c('numeric',NA,'factor','factor','logical','character','numeric','character','character','character',rep('numeric',4))
df1b = read.csv(file='./data/dsstudents.csv',stringsAsFactors = F)
str(df1b)
df2 = read.csv(file='./data/dsstudents.csv',colClasses=colcls,as.is=T)
str(df2)
as.Date('1967-20-15')#error
as.Date('1967-10-15')# right default %y-%b-%d
as.Date('05-Oct-1967',format='%d-%b-%Y')
as.Date('05-10-1967',format='%d-%b-%Y')
as.Date('05-Oct-67',format='%d-%b-%y')
str(df2$dob)
head(df2$dob)
(df2$dob=as.Date(df2$dob,format='%d-%b-%y'))
str(df2$dob)
Sys.Date()-df2$dob
difftime(Sys.Date(),df2$dob,unit ='weeks')
(df2$age = ceiling(as.numeric(difftime(Sys.Date(),df2$dob,unit='weeks'))/52.25))
head(df2$age)
cat(names(df2))
df2[df2$age>30,][1:2]
df2[df2$gender=='M' & df2$course=='PGDDS',][1:2]
df2
write.csv(x=df2,file='./data/goldie.csv')
saveRDS(object=df2,file='./data/goldie.RDS')#save 1 object as .RDS object
markstotal =runif(11,50,150)
save(markstotal,df2,file='./data/goldie2.RData')# save multiple objects in R.Data
save.image(file='./data/goldie3.RData')# save all current objects
save.image()# saves to default RData
readRDS(file='./data/goldie.RDS')#loads and prints
mydata = readRDS(file='./data/goldie.RDS')# save it into object
load(file='./data/goldie2.RData')
df2
df2[df2$age>30,][1:2]
df2[df2$gender == 'M' & df2$course == 'PGDDS',c('rollno','name')]
df2[df2$gender == 'M' & df2$course == 'PGDDS',c(1,2)]
df2[df2$hostel==TRUE,][1:2]
which(df2$hostel == TRUE)#using which command tells indices
df2[which(df2$hostel == TRUE),][c(1,2,4,5)]
df2[which(!df2$hostel == TRUE),][c(1,2,4,5)]
df2[c(1,3,5,7,9),c(1,2)]
df2
df2[which(df2$course=='MSCDS'),][1:2]
df2[which(!df2$course=='MSCDS'),][1:2]
df2
sort(df2$age)
df2$name[order(df2$age)]#sort by age
df2$name[order(-df2$age)]#avoid
df2$name[rev(order(df2$age))]# sort by descending order
df2[order(df2$age),c('name','age')]
df2[order(df2$age[1:5]),c('name','age')]
df2[order(df2$hostel,df2$age),c('name','age','hostel')]
df2[order(-df2$hostel,df2$age),c('name','age','hostel')]
df2[order(df2$fees,decreasing=T),c('name','age','fees')]
