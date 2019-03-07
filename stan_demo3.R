library(rstan)
library(data.table)

dat = fread("baseball.csv")

fit = stan(file = "hbayes1.stan", data = list(y=dat$HR))
fit

fit2 = stan(file = "hbayes2.stan", data = list(y=dat$HR))
print(fit2, pars = c("m", "s"))
