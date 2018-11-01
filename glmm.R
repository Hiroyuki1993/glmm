library(lme4)

data = read_csv('baseball.csv', locale = locale(encoding = "CP932"))

# 過分散問題
library(MASS)
lambda = fitdistr(data$HR, "poisson")
data %>% ggplot(aes(HR)) + geom_histogram()
qplot(rpois(200, lambda = 6.25), geom = "histogram")

fit.pois2 = glmer(HR ~ 1+(1|player), data, family = poisson)
summary(fit.pois2)


fit.bin3 = glmer(cbind(HIT, ATbats - HIT) ~ league+(1|player), data, family = binomial)
summary(fit.bin3)

fit.bin2 = glm(cbind(HIT, ATbats-HIT)~league, data, family = binomial)
summary(fit.bin2)
