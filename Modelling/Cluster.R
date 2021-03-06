df = read.csv("./data/AirlinesCluster.csv")
str(df)
summary(df)
colSums(is.na(df))
library(caret)
preproc = preProcess(df)
dfn = predict(preproc,df)
summary(dfn)
distan = dist(dfn,method = 'euclidean')
cluster1 = hclust(distan,method='ward.D')
plot(cluster1)
cluster2 = cutree(cluster1,k=5)
table(cluster2)
class(cluster2)
MeanComp<-function(var, clustergrp, meas){
  z<-tapply(var, clustergrp, meas)
  print(z)
}
Bal_mean<-MeanComp(df$Balance, cluster2, mean)
dfF = data.frame(df,cluster2)
str(dfF)

set.seed(88)
AirlineCluster_K<-kmeans(dfn, centers = 5, iter.max = 1000)
table(AirlineCluster_K$cluster)
AirlineCluster_K$centers
dfF1 = data.frame(df,AirlineCluster_K$cluster)
str(dfF1)
