rm(list = ls())
# definitions
theta <- 1:7                           # target distribution
n <- 1e3                           # length of markov chain
res <- vector("numeric", length = n)         # store results
# initiate chain
current <- sample(theta, 1)
res[1] <- current
# execute Metropolis algorithm
for(i in 2:n){
  direction <- sample(c(-1, 1), 1)
  candidate <- current + direction
  p_move <- min(c((candidate)/current, 1))
  if(candidate %in% theta){
    current <- ifelse(
      p_move == 1, candidate, ifelse(
        runif(1, 0, 1) <= p_move, candidate, current
      )
    )
    res[i] <- current
  } else {
    res[i] <- current
  }
}
hist(res)
table(res)
plot(res, log10(1:n), type = 'b')

step_limit <- 100
prop.table(table(res[1:2], exclude = NULL))

