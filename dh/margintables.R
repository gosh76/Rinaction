parties = c('bjp','congress','sp','aap')
length(parties)
states1 = c('up','delhi','haryana','punjab','uk')
set.seed(1234)
v1 <- ceiling(runif(20,25,50))
v1
df1 <- data.frame(c(rep(parties,each=5)),c(rep(states1,times=4)),v1)
df1
colnames(df1) <- c('parties','states','MP')
df1
df1$parties = factor(df1$parties)
df1$states = factor(df1$states)
str(df1)
table(df1)# table does not work here:works for single vector
table(df1[,c('parties','states')])
table(df1[,c('parties','states')],dnn=list('Political Parties','States of India'))
df1
xtabs(MP ~ parties+states,data=df1)
statesel = c('up','delhi')#vector of state names(few)
xtabs(MP~parties+states,data=df1,subset=states %in% statesel)
xtabs(MP~parties+states,data=df1,subset=states %in% statesel,drop.unused.levels = T)
partysel = 'bjp'
partysel
xtabs(MP~parties+states,data=df1,subset=parties %in% partysel,drop.unused.levels = T)
xtabs(MP~parties+states,data=df1,subset=states %in% statesel & parties %in% partysel,drop.unused.levels = T)
ftable(df1)
ftable(df1$states,df1$parties,df1$MP)
matresults = xtabs(MP ~ parties+states,data=df1)
matresults
margin.table(matresults,margin=NULL)
sum(v1)
margin.table(matresults,margin=1)# gives rowwise total
margin.table(matresults,margin=2)#gives columnwise total
#prop table----
prop.table(matresults,margin=NULL)
round(prop.table(matresults,margin=NULL),2)
sum(round(prop.table(matresults,margin=NULL),2))
(p1=round(prop.table(matresults,margin=1),2))#proportion of rows
rowSums(p1)
(p2=round(prop.table(matresults,margin=2),2))#proportion of columns
rowSums(p2)
colSums(p2)
addmargins(p2,1,sum)# 1 for columnwise
