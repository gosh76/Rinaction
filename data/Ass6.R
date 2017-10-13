seq(10,200,length.out=40)
seq.int(10,200,length.out = 40)
M = matrix(1:12,ncol=3)
M
M+1
M+c(1,2)
M+c(1,2,3)
cbind(M,M+c(1,2,3))
(dx = colMeans(M))
sweep(M,2,dx,FUN='-')
sweep(M,2,dx,FUN='*')
sweep(M,2,dx,FUN='^')
cbind(M,M[,1]*M[,2])
rbind(M,M[1,]*M[2,])
