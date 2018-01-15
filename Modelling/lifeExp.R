df = read.csv("./data/statedata.csv",stringsAsFactors = F)
str(df)
summary(df)
colSums(is.na(df))
df_ctn<-subset(df, select = c(Population,Income,Illiteracy,Life.Exp,Murder,HS.Grad,Frost,Area,state.area,x,y))
df_cat<-subset(df, select = -c(Population,Income,Illiteracy,Life.Exp,Murder,HS.Grad,Frost,Area,state.area,x,y))
library(pastecs)
options(scipen = 100)
options(digits = 2)
stat.desc(df_ctn)
as.matrix(sort(table(df_cat$state.division),decreasing = T))
as.matrix(sort(table(df_cat$state.name), decreasing = TRUE))
as.matrix(sort(table(df_cat$state.region), decreasing = TRUE))
plot(df$x,df$y, xlab = "longtitude of centres", ylab = "latitude of centres", main = "PLOT OF STATE CENTRES")
boxplot(df$HS.Grad ~ df$state.region, xlab = "Region of USA", ylab = "High School Graduation Rate", main = "Distribution of High School Graduation Rate")
df$state.region<-as.factor(df$state.region)
df$state.division<-as.factor(df$state.division)
df$state.name<-as.factor(df$state.name)
Model1<-lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
             Frost + Area + x + y + state.division + state.region,
           data = df)
summary(Model1)
m2 = lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
          Frost + Area + x + y + state.division,
        data = df)
summary(m2)
m3 = lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
          Frost + Area + x + y ,
        data = df)
summary(m3)
m4 = lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
          Frost + x + y ,
        data = df)
summary(m4)
m5 = lm(Life.Exp~ Population + Income + Illiteracy + Murder + HS.Grad + 
          x + y ,
        data = df)
summary(m5)
m6 = lm(Life.Exp~ Population + Income + Illiteracy + Murder  + 
          x + y ,
        data = df)
summary(m6)
m7 = lm(Life.Exp~ Population + Income + Murder  + 
          x + y ,
        data = df)
summary(m7)
m8 = lm(Life.Exp~ Population  + Murder  + 
          x + y ,
        data = df)
summary(m8)
library(car)
as.data.frame(vif(m8))
