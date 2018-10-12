# This script creates data that lie on different manifolds:

# This creates two clusters.
n <- 100
t <- runif(n, 0, 2*pi)
r <- runif(n, 0 , 1)
clust1 <- cbind(2*r*cos(t)+2, r*sin(t)+2)
clust2 <- cbind(r*cos(t)-2, 2*r*sin(t) + 1)
twoclust <- rbind(clust1, clust2)
write.table(twoclust, file = "data1.txt", row.names = FALSE, col.names = FALSE)
write.table(clust1, file = "clust1.txt", row.names = FALSE, col.names = FALSE)
write.table(clust2, file = "clust2.txt", row.names = FALSE, col.names = FALSE)
max(dist(twoclust))

# This creates data on a circle. Call this data2
n <- 100
t <- runif(n, 0, 2*pi)
S1 <- cbind(cos(t), sin(t))
plot(S1)
write.table(S1, file = "data2.txt", row.names = FALSE, col.names = FALSE)

#This creates data on a cirlce with error. Call this data3.
n <- 200
t <- runif(n, 0, 2*pi)
e1 <- rnorm(n, 0, 0.1)
e2 <- rnorm(n, 0, 0.1)
S1e <- cbind(cos(t)+ e1, sin(t)+e2)
plot(S1e)
write.table(S1e, file = "data3.txt", row.names = FALSE, col.names = FALSE)

# Creates data on S1 V S2. Call this data4.
n  <- 250
t  <- runif(n, 0, pi)
u  <- runif(n, 0, 2*pi)
v  <- runif(n, 0, 2*pi)

S2 <- cbind(sin(t)*cos(u)-1, sin(t)*sin(u), cos(t))
S1 <- cbind(cos(v) + 1, sin(v), 0)
S1VS2 <- rbind(S1, S2)
write.table(S1VS2, file = "data4.txt", row.names = FALSE, col.names = FALSE)
plot(S1VS2[,c(1,3)])

# Let's try some real data.  data5 will be the wine dataset
data(wine, package='rattle')
W <- wine[,-1]
write.table(W, file = "data5.txt", row.names = FALSE, col.names = FALSE)

# data6 will be data from the S2 shell of a lithium atom.
n1 <- 2000
temp <- rexp(n1, 1)
which(temp > 1)
r <- temp[which(temp>1)] #distance of the electron from the nuculus.
n <- length(r)
u <- runif(n, 0, 2*pi)
v <- runif(n, 0, pi)
E <- cbind(r*sin(v)*cos(u), r*sin(v)*sin(u), r*cos(v))
plot(E[,c(1,2)])
plot(E[,c(1,3)])
write.table(E, file = "data6.txt", row.names = FALSE, col.names = FALSE)

# data7 will use data 3 and have new, outlier data in the middle of the circle
data7wdensity <- read.table(file = "data7wdensity.txt")
data7 <- data7wdensity[,c(1,2)]
fromO <- sqrt(data7[,1]^2 + data7[,2]^2)
noise_index <- which(fromO<2)
noise <- data7[which(fromO<2), ]
data7nonoise <- data7[-which(fromO<2),]
write.table(data7, file = "data7.txt", row.names = FALSE, col.names = FALSE)
write.table(noise, file = "data7noise.txt", row.names = FALSE, col.names = FALSE)
write.table(data7nonoise, file = "data7nonoise.txt", row.names = FALSE, col.names = FALSE)
