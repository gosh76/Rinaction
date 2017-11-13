S1 <- c(18.5,24,17.2,19.9,18)
S2 <- c(26.3,25.3,24,21.2,24.5)
S3 <- c(20.6,25.2,20.8,24.7,22.9)
S4 <- c(25.4,19.9,22.6,17.5,20.4)
df <- data.frame(S1,S2,S3,S4)
df
colMeans(df)
addmargins(df,c(1,2),FUN=list(list(mean,sum,length),list(length)))
