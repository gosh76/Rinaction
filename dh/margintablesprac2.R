p = c('p1','p2','p3','p4','p5')
s = c('s1','s2','s3')
df1 <- data.frame(rep(p,each=3),rep(s,5))
df1
colnames(df1) <- c('P','S')
df1
df1$V <- ceiling(runif(15,10,80))
df1
str(df1)
table(df1$P,df1$S)
table(df1[,c('P','S')])
table(df1[,c('P','S')],dnn = c('Party','State'))
xtabs(V~P+S,df1)
xtabs(V~P,df1)
xtabs(V~S,df1)
sel = 's2'
xtabs(V~P+S,df1,subset = S %in% sel)
sel1 <- 's3'
xtabs(V~P+S,df1,subset = S %in% sel1)
sel2 <- 's1'
xtabs(V~P+S,df1,subset = S %in% sel2)
xtabs(V~P+S,df1,subset = S %in% sel2,drop.unused.levels = T)
xtabs(V~P+S,df1,subset = S %in% sel2 & P %in% c('p1','p2'),drop.unused.levels = T)
xtabs(V~P+S,df1,subset = S %in% 's2' & P %in% 'p2')
xtabs(V~P+S,df1,subset = S %in% 's3' & P %in% 'p5',drop.unused.levels = T)
mr = xtabs(V~P+S,df1)
margin.table(mr)
mr
margin.table(mr,margin = 1)#sum across rows
margin.table(mr,margin = 2)#sum across columns
prop.table(mr,margin = 1)#division of row values by row total
prop.table(mr,margin = 2)#division of column values by column total