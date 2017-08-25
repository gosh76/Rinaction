# Arrays
# 2 coys ; Each coy has 3 depts : Each dept has 4 salesman
company = c('coy1','coy2')
department = c('dept1','dept2','dept3')
salesman = c('salesman1','salesman2','salesman3','salesman4')
set.seed(1234)
sales = ceiling(runif(2*3*4,50,100))
sales
length(sales)
mean(sales)
sales = ceiling(runif(2*3*4,50,100))
mean(sales)
sales; length(sales)
salesarray = array(dim=c(4,3,2),data=sales,dimnames=list(salesman,department,company))
salesarray
colnames(salesarray)
rownames(salesarray)
dimnames(salesarray)
length(salesarray)
dimnames(salesarray)[[3]]
dimnames(salesarray)[[3]][1]
nrow(salesarray)
ncol(salesarray)
dim(salesarray)
class(salesarray)
salesarray[3,2,1]
salesarray[4,3,2]
salesarray[,,1]
salesarray[1,,]
apply(salesarray,c(1),sum) # salesman
apply(salesarray,c(2),sum) # deptt
apply(salesarray,c(3),sum) # coywise
apply(salesarray,c(2,3),sum) #deptt & coywise
apply(salesarray,c(1,2,3),sum)

