rollno = rep(c(10,11,12,13),4)
r
sname = rep(c('Achal','Apoorva','Goldie','Hitesh'),4)
n
examunit = rep(c('u1','u2','u3','u4'),each=4)
set.seed(1234)
rpgm = ceiling(rnorm(16,60,10))
set.seed(1234)
sql = ceiling(rnorm(16,65,10))
df1 = data.frame(rollno,sname,examunit,rpgm,sql)
df1
library(reshape)
md = reshape::melt(df1,id=c('rollno','sname','examunit'))
head(md)
md
reshape::cast(md,rollno+sname+examunit~variable)
reshape::cast(md,rollno+sname+variable~examunit)
reshape::cast(md,rollno+sname~variable~examunit)
