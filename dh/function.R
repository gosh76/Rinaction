x=2 ; y=3
(sumofnos=x+y)
x1 = c(1:10)
(sumofnos = sum(x1))
fsum1 <- function(x1){
  sumofnos = sum(x1)/length(x1)
}# must put return in function body
fsum1(1:10)
(sumout = fsum1(x1))
fsum2 <- function(x1){
  sumofnos = sum(x1)/length(x1)
  return(sumofnos)
}
fsum2(x1)

sum2a <- function(x1, y1) {
  sumofnos = sum(x1)*mean(y1)
}
sum3a <- function(y3) {
  sumofnos2 <- sum(y3)*mean(y3)
  return (sumofnos)
}
sum3a(100:200)
sum4a <- function(x3, y3) {
  sumnos <- sum(x3)*mean(y3)
  return(sumnos) 
}
sum4a(1:10,100:200)
fsum3 <- function(x1) {
  sumofnos=sum(x1)
  print(sumofnos)
  print(paste('Sum of object is ',sumofnos,sep=''))#gives quotes
  cat(paste('Sum of object is ',sumofnos,sep=''))# does not give quotes
}
fsum3(x1)
body(fsum3)# check structure of function
args(fsum3)
pi
area <- function(mypi=pi, r) {
  circle <- mypi*r**2
  return(circle)
}
area(,2)
a1 <- function(r) {
  c2 <- r**2
  ac <- pi*c2
  return(ac)
}
a1(2)
body(a1)
library(plyr)
lsf.str()
search()
ls()
lsf.str(pos=-1)
lsf.str(pos=1)
lsf.str(pos=2)
lsf.str(pos=4)
save(a1,area,file='./data/gf1.RData')
rm(list=ls())
load(file='./data/gf1.RData')
a1
area
(ch1 = deparse(args(area)))# R commands and objects name into character strings
str(ch1)
areacircle2 <- function(constant=3.14,r){
  areacircle=constant*r^2
  invisible(areacircle)
}
areacircle2(r=5)
(ch = areacircle2(r=5))
print(pi)
print(pi,digits=2)
?print
