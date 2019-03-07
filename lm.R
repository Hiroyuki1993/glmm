library(data.table)
library(dplyr)
library(ggplot2)

dat = fread("baseball.csv")
colnames(dat)

dat %>% ggplot(aes(x=HR, y=salary)) + geom_point() + geom_smooth()

fit.lm = lm(salary ~ HR, dat)
summary(fit.lm)

dat %>% ggplot(aes(x=HR, y=salary)) + geom_point() + geom_abline(intercept = 32.45, slope = 6.75)

dat %>% ggplot(aes(salary)) + geom_histogram()

# 予測区間
pred_intvl = predict(fit.lm, interval = "prediction", level = 0.95)
pred_intvl = as.data.frame(pred_intvl)
dat.pred = dat %>% select(HR, salary) %>% mutate(ymin = pred_intvl$lwr, ymax = pred_intvl$upr)
dat.pred %>% ggplot(aes(x = HR)) + geom_ribbon(aes(ymin = ymin, ymax = ymax), fill = "lightblue", alpha = 0.5) +
  geom_point(aes(y = salary))

# 対数変換
dat = dat %>% mutate(log_salary = log(salary))
dat %>% ggplot(aes(log_salary)) + geom_histogram()

fit.lm2 = lm(log_salary ~ HR, dat)
summary(fit.lm2)
dat %>% ggplot(aes(x=HR, y=log_salary)) + geom_point() + geom_abline(intercept = 3.31, slope = 0.078)
