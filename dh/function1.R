fs <- function(x){
  print(x**2)
}
fs(2)
fs(8)
f1 <- function(x,y){
  print(x*y)
}
f1(2,5)
f2 <- function(x){
  m1 <- sum(x)/length(x)
  return(m1)
}
v1 <- c(23,4,56,7,89)
f2(v1)
f3 <- function(x,y){
  p1 <- x**y
  return(p1)
}
f3(2,5)
f4 <- function(x,y){
  p2 <- sum(x)*mean(y)
  return(p2)
}
f4(1:3,2)
carea <- function(r){
  a1 <- pi*r**2
  return(a1)
}
carea(5)
carea(8)
cperi <- function(r){
  p3 <- 2*pi*r
  return(p3)
}
cperi(4)
f5 <- function(x){
  if (x>10){
    print(paste(x,'10',sep='>'))
  }
  else {
    print(paste(x,'10',sep='<='))
  }
}
f5(5)
f5(20)
body(f5)
args(f5)
ls()
lsf.str(pos=-1)
lsf.str(pos=1)
lsf.str(pos=2)
saveRDS(f5,file = './f5.RDS')#saving file in RDS
readRDS('./f5.RDS')
save(f2,f3,f4,file='./funcs.RData')# saving files with RData
load('./funcs.RData')