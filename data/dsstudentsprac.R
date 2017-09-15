df1 <- read.csv('./data/dsstudents.csv')
df1
str(df1)
names(df1)
cls = c('numeric','character','factor','factor','logical','character','numeric','character','character','character',rep('numeric',4))
df2 <- read.csv('./data/dsstudents.csv',colClasses = cls)
df2
str(df2)
df2$dob <- as.Date(df2$dob,format = '%d-%b-%y')
df2$dob
x1 <- as.Date(df2$dob)
x1
df2$age <- ceiling(as.numeric(difftime(Sys.Date(),df2$dob,unit='weeks')/52))
head(df2$age)
df2
cat(names(df2))
df2[df2$age>30,][1:3]
df2[df2$gender=='F',][c('email','mobno')]
df2[df2$hostel==F & df2$age>25,][1:3]
write.csv(x=df2,file='./data/goldieds.csv')
saveRDS(object=df2,file='./data/g1.RDS')
m1 <- runif(10,25,100)
save(m1,df2,file = './data/g2.RData')
df2[which(df2$gender=='M'),][1:2]
df2[which(df2$course=='MSCDS'),][1:3]
df2[which(!df2$course=='MSCDS'),][1:3]
df2[c(1,4,5,7),c(1,4,8)]
str(df2)
df2[order(df2$rollno),]
df2$name[order(df2$rollno)]
df2[order(df2$hostel),][2]
df2
df2[rev(order(df2$rollno)),][1:2]
df2[order(df2$rollno[1:5]),][1:2]
df2[df2$fees>15000 & df2$gender=='M',][1:2]
df2
df2[df2$rollno>17045,][1:2]
df2[df2$fees>14000,][c('name','fees')]
