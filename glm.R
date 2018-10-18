library(data.table)
library(dplyr)
library(ggplot2)

# gaussian
dat = fread("baseball.csv")
fit.lm = lm(salary ~ HR, data = dat)
predict = fit.lm$fitted.values
sigma = sqrt(sum(fit.lm$residuals^2)/199)
y = rnorm(199, predict, sigma)
hist(y)
hist(dat$salary)
hist(predict(fit.lm, interval="prediction"))

# log-normal
fit.lm.log = lm(log(salary) ~ HR, data = dat)
predict = fit.lm.log$fitted.values
sigma = sum(fit.lm.log$residuals^2)/199
y = rlnorm(199, predict, sigma)
hist(y)

# logistic
dat$ichioku = ifelse(dat$salary <= 100, 0, 1)
fit.logistic = glm(ichioku~HR, dat, family = binomial)
summary(fit.logistic)
dat %>% mutate(salary_t = salary > 100) %>% select(salary, HR, salary_t)

# poisson
hist(dat$HR)
hist(rpois(100, lambda = 1000))
plot(dat$ATbase, dat$HR)
fit.pois = glm(HR ~ ATbase, dat, family = poisson)
summary(fit.pois)
AIC(fit.pois)

# negative-binomial
library(MASS)
fit.nb = glm.nb(HR ~ ATbase, dat)
summary(fit.nb)
AIC(fit.nb)
