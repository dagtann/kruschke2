rm(list = ls())
source("./DBDA2Eprograms/DBDA2e-utilities.R")
source("./DBDA2Eprograms/BernBeta.R")

post <- BernBeta(c(4, 4), 1); post
# The posterior distribution follows a beta distribution
# with parameters a = 5 and b = 4.
post <- BernBeta(post, 1); post
post <- BernBeta(post, 0); post

post <- BernBeta(c(4, 4), 0); post
# The posterior distribution follows a beta distribution
# with parameters a = 5 and b = 4.
post <- BernBeta(post, 0); post
post <- BernBeta(post, 1); post

post <- BernBeta(c(4, 4), c(0, 1, 1)); post
post <- BernBeta(c(4, 4), c(1, 1, 0)); post

# Ex. 6.2
n <- 100; z <- 58
openGraph()
post <- BernBeta(
  priorBetaAB = c(1, 1),
  Data = rep(0:1, times = c(n - z, z)),
  showHDI = TRUE, showCentTend = "Mode"
)
z <- 57
openGraph()
post <- BernBeta(
  priorBetaAB = post,
  Data = rep(0:1, times = c(n - z, z)),
  showHDI = TRUE, showCentTend = "Mode"
)

# Ex 6.3
n <- 50
f_radio <- 40; j_radio <- n - f_radio
f_ocean <- 15; j_ocean <- n - f_ocean

post_f_radio <- BernBeta(
  c(1, 1), rep(0:1, times = c(j_radio, f_radio)),
  showCentTend = "Mode", showHDI = TRUE
)
# Respondents are biased towards F b/c the HDI_95
# ranges from .67 to .89 and thus excludes .5.
post_f_ocean <- BernBeta(
  c(1, 1), rep(0:1, times = c(j_ocean, f_ocean)),
  showCentTend = "Mode", showHDI = TRUE
)
# Respondents are biased against F b/c the HDI_95
# ranges from .19 to .43 and thus excludes .5.

# ex 6.4

BernBeta( # y = 1: Coin comes up heads
  c(1, 1) / 100, c(1, 1, 1, 1, 0),
  showCentTend = "Mean", showHDI = TRUE
)

# ex 6.5
BernBeta(
  c(10, 10), c(rep(1, 9), 0),
  showCentTend = "Mode", showHDI = TRUE
)
BernBeta(
  c(1, 1)/10, c(rep(1, 9), 0),
  showCentTend = "Mode", showHDI = TRUE
)
