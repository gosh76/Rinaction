t = women
str(t)
m1 <- lm(weight~height,data=t)
summary(m1)
W = predict(m1)
W
t$W1 = W
t
t$R = t$weight - t$W1
t
plot(t$height,t$weight)
abline(m1)
plot(t$weight,t$R)
plot(m1)

