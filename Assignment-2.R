df1 <- read.csv('./data/dsstudents.csv')# data read in form of dataframe df1
df1
v1 <- df1$excel # df1 column excel assigned to a vector v1
names(v1) <- df1$name # df1 column name assigned to names for vector v1
v1
# displaying barplot of students names and their excel marks in vertical bars
barplot(v1,xlab="Names", ylab="Marks", main="Excel Marks",las=2,col=c(1,2,3,4,5,6,7,8),horiz=F,ylim=c(0,100),cex.names=0.6)
# displaying barplot of students names and their excel marks in horizontal bars
barplot(v1,xlab="Marks", ylab="Names", main="Excel Marks",las=2,col=c(1,2,3,4,5,6,7,8),horiz=T,xlim=c(0,100),cex.names=0.6)


