library(brms)

fit3 = brm(salary~HR+(1+HR|team), dat)
summary(fit3)

plot(marginal_effects(fit3, effect="HR", method = "predict", re_formula = NULL), points=TRUE)

fit4 = brm(salary~HR+(1+HR|team), dat, family = lognormal)
summary(fit4)
