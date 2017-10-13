set.seed(1234)
x = rnorm(100,50,10)
x = ceiling(x)
x
meanx = sum(x)/length(x)
meanx
mean(x)
summary(x)
# Trimming values
x
set.seed(1234)
x = ceiling(runif(100,50,100))
x
mean(x)
mean(x,trim=.1)
#NA values - Remove
x[c(1,20,30)] = NA
x
length(na.omit(x)) # 3 values
mean(x)# gives NA
mean(x,na.rm=T)
# mean deviation
x = c(3,6,6,7,8,11,15,16)
(mx = mean(x))
(mdev = x - mx)
abs(mdev)
(mabsdev = sum(abs(mdev)))/length(x)
mad(x)# median absolute deviation
mad(x,center=mean(x))# mean absolute deviation
# calculate MD about Mean,Median,Mode
x = c(7,4,10,9,15,12,7,9,7)
mean(x)
median(x)
