library(dplyr)
library(ggplot2)

binom = function(theta, N){
  return(function(x) {
    p = choose(N, x)*(theta^x)*(1-theta)^(N-x)
    return(p)
  })
}

p = c()
for (xn in 0:30) {
  p = c(p, binom(0.5, 30)(xn))
}
binom(0.5, 30)(10)
plot(0:30, p, xlab="x", ylab="probability")

likelihood = function(x, N){
  return(function(theta) {
    L = choose(N, x)*(theta^x)*(1-theta)^(N-x)
    return(L)
  })
}

likelihood(1,3)(2)
plot(likelihood(15,30), 0, 1, xlab="theta", ylab="likelihood")

prior_prob = function(theta) {
  #dunif(theta, 0,0.5)
  dexp(theta)
}
plot(prior_prob, 0, 1, xlab="theta")

posterior_prob = function(theta) {
  prior_prob(theta)*likelihood(15,30)(theta)
}

plot(posterior_prob, 0, 1, xlab = "theta")
