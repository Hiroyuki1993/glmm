x = seq(0,5,0.5)
y = rnorm(length(x),0.8+0.6*x,0.8)
plot(x,y)

fit.pol1 = lm(y~x)
fit.pol2 = lm(y~x+I(x^2))
fit.pol3 = lm(y~x+I(x^2)+I(x^3))

names = c('pol1', 'pol2', 'pol3')
ll = c(logLik(fit.pol1), logLik(fit.pol2), logLik(fit.pol3))
barplot(exp(ll),names.arg = names, ylab = 'likelihood')

aics = c(AIC(fit.pol1), AIC(fit.pol2),AIC(fit.pol3))
barplot(aics, names.arg = names, ylab = 'AIC')
