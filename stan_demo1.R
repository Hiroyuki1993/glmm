library(rstan)

y = rnorm(100, 5, 1)
fit = stan(file = "normal.stan", data = list(y=y))

traceplot(fit)
fit
mu = rstan::extract(fit)$mu
hist(mu)
mean(mu)
quantile(mu, probs = c(0.025, 0.975))
density(mu)$x[which.max(density(mu)$y)]
