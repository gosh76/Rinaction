p = c('p1','p2','p3','p4','p5')
s = c('s1','s2','s3')
df1 <- data.frame(rep(p,each=3),rep(s,5))
df1
names(df1) <- c('p','s')
df1
set.seed(1234)
df1$v = ceiling(runif(15,50,100))
df1
df1$p <- factor(df1$p)
df1$s <- factor(df1$s)
str(df1)
table(df1[,c('p','s')])
table(df1[,c('p','s')],dnn=list('parties','states'))
xtabs(v~p+s,df1)
sel = 's1'
xtabs(v~p+s,df1,subset=s %in% sel)
xtabs(v~p+s,df1,subset= s %in% sel,drop.unused.levels = T)
xtabs(v~p+s,df1,subset= s %in% sel & p %in% c('p1','p2'),drop.unused.levels = T)
mr = xtabs(v~p+s,df1)
mr
margin.table(mr,margin = NULL)
margin.table(mr,margin = 1)
margin.table(mr,margin = 2)
prop.table(mr,margin = NULL)
p1 = prop.table(mr,margin = 1)
rowSums(p1)
p2 = prop.table(mr,margin = 2)
colSums(p2)
