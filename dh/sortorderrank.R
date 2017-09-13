set.seed(1123)
marks = ceiling(runif(11,5,10))
marks
sort(marks)
sort(marks,decreasing=TRUE)
sort(-marks)
rev(sort(marks))
order(marks)
marks[order(marks)]
order(marks,decreasing = T)
order(-marks)
marks[c(6,7,10)]
length(marks)
marks2 = marks
marks[5] = 10
marks
marks2[5] = NA
marks2
order(marks2)
order(marks2,na.last = NA)
length(marks)
is.na(marks2)
anyNA(marks2)
mean(marks2)# does not work with NA values
mean(marks2,na.rm=T)
order(marks2,na.last=FALSE)
order(marks2,na.last=TRUE)
marks2
marks
sort(marks)
table(marks)
rank(marks,ties.method='first')
rank(marks,ties.method = 'average')
rank(marks,ties.method = 'max')
rank(marks,ties.method = 'random')
