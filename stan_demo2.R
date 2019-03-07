x = rnorm(100,7,6)
y = rnorm(100,6,2)

mean(x)
mean(y)

t.test(x,y)

fit = stan(file = "mean_diff.stan", data = list(x=x, y=y))
fit

diff = rstan::extract(fit)$diff
sigma_p = (99*(var(x)+var(y))) / 198
d = diff/sigma_p^0.5
mean(d)
hist(d)
