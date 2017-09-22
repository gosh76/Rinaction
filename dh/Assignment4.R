df3 = read.csv("./data/dsstudents2.csv",na.strings = '')# reading dsstudents2 in R
df3
str(df3)# checking structure of df3
df3$name <- as.character(df3$name)#converting df3$name from factor to character
df3$dob <- as.Date(df3$dob,format='%d-%b-%y')#converting df3$dob from factor to date
df3$email <- as.character(df3$email)#converting from factor to character
df3$city <- as.character(df3$city)#converting from factor to character
str(df3)
df3
df3$age <- ceiling(as.numeric(difftime(Sys.Date(),df3$dob,units='days')/365))#calculating age
df3
sum(is.na(df3))# no. of missing values
df3[!complete.cases(df3),]# missing rows
df3$hostel[is.na(df3$hostel)] <- names(table(df3$hostel)[1])#replacing NA with 'FALSE'having greater occurrence
df3$hostel
df3$fees[is.na(df3$fees)] <- median(df3$fees,na.rm=T)#replacing NA with median of fees
df3$fees
df3$city[is.na(df3$city)] <- 'Delhi'#replacing NA with Delhi
df3$city
df3$excel[is.na(df3$excel)] <- median(df3$excel,na.rm=T)#replacing NA with median
df3$excel
df3$sql[is.na(df3$sql)] <- median(df3$sql,na.rm=T)#replacing NA with median
sum(is.na(df3))# check for NAs after replacing all NAs
