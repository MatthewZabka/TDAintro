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

# This creates data on a circle
n <- 100
t <- runif(n, 0, 2*pi)
S1 <- cbind(cos(t), sin(t))
plot(S1)
write.table(S1, file = "data2.txt", row.names = FALSE, col.names = FALSE)

#This creates data on a cirlce with error
n <- 200
t <- runif(n, 0, 2*pi)
e1 <- rnorm(n, 0, 0.1)
e2 <- rnorm(n, 0, 0.1)
S1e <- cbind(cos(t)+ e1, sin(t)+e2)
plot(S1e)
write.table(S1e, file = "data3.txt", row.names = FALSE, col.names = FALSE)

# Next let's try S1 V S2.
n  <- 200
t  <- runif(n, 0, pi)
u  <- runif(n, 0, 2*pi)
v  <- runif(n, 0, 2*pi)
e1 <- rnorm(n, 0, 0.1)
e2 <- rnorm(n, 0, 0.1)
e3 <- rnorm(n, 0, 0.1)
e4 <- rnorm(n, 0, 0.1)
e5 <- rnorm(n, 0, 0.1)
e6 <- rnorm(n, 0, 0.1)

S2e <- cbind(sin(t)*cos(u)-1 +e1, sin(t)*sin(u) + e2, cos(t) + e3)
S1e <- cbind(cos(v) + 1 + e4, sin(v) + e5, e6)
S1VS2 <- rbind(S1e, S2e)
write.table(S1VS2, file = "data4.txt", row.names = FALSE, col.names = FALSE)
plot(S1VS2[,c(1,3)])
