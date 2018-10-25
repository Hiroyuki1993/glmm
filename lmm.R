library(lme4)

fit.lmm = lmer(salary ~ HR + (0 + HR|team), data)
summary(fit.lmm)
AIC(fit.lmm)

fit.lm = lm(salary ~ HR, data)
summary(fit.lm)
AIC(fit.lm)

library(nlme)
data.ar1 = read_csv('cor_ar1.csv')
data.ar1 %>% ggplot(aes(x=time,y=data)) + geom_point() +
  facet_wrap(~ condition, ncol = 2)
fit.lmm4 = lme(fixed = data ~ time*condition, data = data.ar1,
               random = data~1|ID, correlation = corAR1())
summary(fit.lmm4)
