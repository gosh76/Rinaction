library(ggplot2)
library(scatterplot3d)
library(MASS)
library(devtools)
i = iris
i
names(i) = c('SL','SW','PL','PW','SP')
str(i)
i.lda <- lda(i$SP ~ .-SP, data =i)
predict.iris_LDA <- predict(i.lda)
predict.iris_LDA$class[1:10]
table(i$SP, predict.iris_LDA$class)
