rm(list = ls())
set.seed(12345678)

true_theta <- 2/3

grid_size <- 1000
theta <- seq(0, 1, length.out = grid_size)
p_theta <- dbeta(theta, 30, 60)

plot(theta, rep(.01, grid_size), ylim = c(0, 0.03), type = 'n')
for(i in c(1, 10, 100, 1000)) {
  myData <- rbinom(n = i, size = 1, prob = true_theta)
  z <- sum(myData)
  N <- length(myData)
  likelihood <- theta^z * (1 - theta)^(N - z)
  posterior <- likelihood * p_theta / sum(likelihood * p_theta)
  lines(theta, posterior, col = i + 1)
}
theta %*% posterior
theta[which.max(posterior)]
