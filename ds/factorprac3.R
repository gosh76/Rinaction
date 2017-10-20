f1 <- c('a','b','c','a','d','b')
f2 <- factor(f1)
f2
f2[3] <- 'a'
f2
f2[4] <- 'e'#NA generated as 'e' is invalid factor level
levels(f2)[5] <- 'e'# 'e' added as a level in factor f2
f2[4] <- 'e'# successful
f3 <- factor(f2,levels = levels(f2),ordered=T)
f3 #Levels: a < b < c < d < e
f4 <- factor(f3,labels=c('f1','f2','f3','f4'))# labels for 4 levels
f4
f4[4] <- NA
f4
is.na(f4)
sum(is.na(f4))
levels(f3)
levels(f3) <- c(levels(f3),'f')# adding 'f' to levels of factor f3
levels(f3)