set.seed(1132)
marks <- ceiling(runif(15,10,40))
marks
sort(marks)
sort(marks,decreasing = T)
sort(-marks)
rev(sort(marks))
order(marks)
marks[order(marks)]
order(marks,decreasing = T)
order(-marks)
marks[c(6,11,14)]
length(marks)
marks2 = marks
marks2[8]=NA
marks2
order(marks2)# index of NA value is last
order(marks2,na.last = NA)# index of NA value removed
is.na(marks2)
sum(is.na(marks2))
anyNA(marks2)
mean(marks2)# gives NA
mean(marks2,na.rm = T)
order(marks2,na.last = T)# gives NA value at last
order(marks2,na.last = F)#gives NA value first
table(marks)
rank(marks,ties.method = 'first')
marks
?rank
x1 <- c(12,34,56,78,12,34)
rank(x1)
rank(x1,ties.method = 'first')
rank(x1,ties.method = 'max')
rank(x1,ties.method = 'min')
