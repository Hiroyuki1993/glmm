x = seq(0,5,0.5)
y = rnorm(length(x),0.8+2*x^2,0.3)
plot(x,y)

fit.pol1 = lm(y~1+x)
fit.pol2 = lm(y~1+x+I(x^2))
fit.pol3 = lm(y~1+x+I(x^2)+I(x^3))
fit.pol4 = lm(y~1+x+I(x^2)+I(x^3)+I(x^4))

names = c('pol1', 'pol2', 'pol3')
ll = c(logLik(fit.pol1), logLik(fit.pol2), logLik(fit.pol3))
barplot(exp(ll),names.arg = names, ylab = 'likelihood')

aics = c(BIC(fit.pol1), BIC(fit.pol2),BIC(fit.pol3))
barplot(aics, names.arg = names, ylab = 'AIC')
AIC(fit.pol4)
