head(USArrests)
states = rownames(USArrests)
states
substr(states,1,5)
states2 = abbreviate(states,minlength = 6)
states2
sc = nchar(states)
sc
states[which(sc==max(sc))]
states[which(sc==4)]
grep(pattern = 'k',states,value = TRUE)
grep(pattern='[wW]',states,value=TRUE)
grep(pattern='w',x=tolower(states),value=TRUE)
grep(pattern='W',x=toupper(states),value=TRUE)
grep(pattern='w',x=states,value=TRUE,ignore.case = T)
hist(nchar(states))
pa = gregexpr(pattern='a',text = states,ignore.case = T)
pa
library(stringr)
str_count(states,'a')
str_count(tolower(states),'a')
vow = c('a','e','i','o','u')
num_v <- vector(mode='integer',length = 5)
for (j in c(1:5)){
  na = str_count(tolower(states),vow[j])
  num_v[j] <- sum(na)
}
length(num_v)
num_v
names(num_v) <- vow
num_v
sort(num_v,decreasing = T)
barplot(num_v,ylim=c(0,80))
c1 <- character(5)
c1
for (i in c(1:5)){
  c1[i] <- i**2
  print(c1[i])
}
c1
c1[6] = 'ate'
c1
class(c1)
c2 <- 8
is.character(c2)
c3 <- 'fame'
is.character(c3)
c4 <- as.character(c2)
c4
?str
top105 = readLines("http://www.textfiles.com/music/ktop100.txt")
top105[1]
top105[5]
top105[7]
length(top105)
head(top105)
top105[11:20]
tail(top105,n=10)
p1 <- paste(1:5,'R',sep='-')
p1
p2 <- paste('the life of ',pi)
p2
i1 = paste('I','love','R')
i1
p3 <- paste(1:5,c('@','$'),sep='-',collapse='')
p3
p4 <- paste(1:5,c('@','$'),sep='-')
p4
p5 <- paste0('it','is','bad')
p5
t1 <- 'it is really bad.'
print(t1)
print(t1,quote = F)
noquote(t1)
n1 <- noquote(c('it','is','not','bad'))
n1
cat(t1)
cat(t1,'as it is')
cat(1:8,sep = '-')
z1 <- c(3,5,7,8,9)
cat(z1)
print(z1)
cat("character vector of labels for the lines printed", fill = 10)
format(24.567567,nsmall = 5)
format(c('god','does','it','again'),width = 8,justify = "none")
format(c(5.5445,5.766,7.987),digits = 4)
sprintf("%f",4.567)
sprintf("%0.2f",4.567)
sprintf("%1.0f",4.567)
toString(12345)
toString(c(124,678,'def'))
toString(c('wer','tyu','rtu'),width = 6)
nchar(c('tor','rotr','erty','qwerty'))
nchar('it is not ?')
tolower(c('tore','DERa','qWAS'))
tolower("DFHGFEFF")
casefold('qwERTY')
casefold('FertHJH',upper = T)
chartr('a','A','it is a roaring attic.')
chartr('s','c','sip it slowly')
chartr('str','@#$',c('string','stringy','spicy'))
abbreviate(states)
x <- c('what','is','this','all','about')
substr(x,2,4) <- "@#$"
x
y <- 'Whatisit'
substr(y,2,5) <- 'fate'
y
s <- paste(rep(1,5),6:10,sep = '$')
s
h1 <- c('what','is','rotten')
h2 <- c('what','in','rotten','hell')
union(h1,h2)
intersect(h1,h2)
setdiff(h1,h2)
setdiff(h2,h1)
f1 <- c('what','is','not')
f2 <- c('not','what','is')
setequal(f1,f2)
identical(f1,f2)
is.element('what',f1)
'what' %in% f2
q1 <- c('world','earth','heaven','planet','galaxy','universe')
sort(q1)
sort(q1,decreasing = T)
q2 <- c('qwerty',34,23,'tyrol')
sort(q2)
