library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
library(MASS)
library(nnet)

train = read.csv("./data/hatrain.csv")
dim(train)
test = read.csv("./data/hatest.csv")
dim(test)

#multinomial model
tr1 = train
tes1 = test
tr1$subject = NULL
tes1$Activity = NULL
tes1$subject = NULL
dim(tr1)
m1 = multinom(Activity~.,data=tr1,MaxNWts=3400)
pred1 = predict(m1,tes1)
str(pred1)
pred1[1:5]
table(test$Activity,pred1)
accuracy = (496+410+498+428+357+437)/dim(test)[1]
accuracy#0.8910757

#lda model
tr2 = train
tr2$subject = NULL
tes2 = test
tes2$subject = NULL
tes2$Activity = NULL
dim(tes2)
m2 = lda(Activity~.,data=tr2)
pred2 = predict(m2,newdata=tes2)
length(pred2$class)
table(test$Activity,pred2$class)
accuracy1 = (537+434+510+490+405+460)/dim(test)[1]
accuracy1#0.9623346

#lda model performs better than multinomial model

#PCA dimensionality reduction
tr3 = train
tr3$subject = NULL
tr3$Activity = NULL
tes3 = test
tes3$Activity = NULL
tes3$subject = NULL
pc = prcomp(tr3,scale. = T)#pca reduction
sd = pc$sdev
pr_var = sd^2
pr_var[1:10]
prop_varex <- pr_var/sum(pr_var)
plot(prop_varex,xlim=c(0,10),ylim=c(0,0.6),type = 'b')#max. variance explained by 10 var
prop_varex[1:10]
tr4 = data.frame(train$Activity,pc$x)
tr4 = tr4[1:11]
str(tr4)
tes4 = predict(pc,newdata = tes3)
tes4 = as.data.frame(tes4)
tes4 = tes4[1:10]
str(tes4)

# multinomial with PCA
m3 = multinom(train.Activity~.,data=tr4)
pred3 = predict(m3,tes4)
pred3[1:10]
table(test$Activity,pred3)
accuracy2 = (496+323+458+475+309+423)/dim(test)[1]
accuracy2#0.8428911-with only 10 independent vars reduced by PCA

# lda with PCA
m4 = lda(train.Activity~.,data=tr4)
pred4 = predict(m4,newdata = tes4)
pred4$class[1:10]
table(test$Activity,pred4$class)
accuracy3 = (499+268+490+456+272+422)/dim(test)[1]
accuracy3#0.8167628-with only 10 independent vars reduced by PCA
