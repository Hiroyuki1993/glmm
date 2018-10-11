library(data.table)
library(dplyr)
library(ggplot2)

dat = fread("baseball.csv")
colnames(dat)

likelihood = function(y){
  return(function(mu) {
    L = 1
    for (yn in y) {
      L = L*exp(-0.5*(yn-mu)^2)/sqrt(2*pi)
    }
    return(L)
  })
}

y = c(3,2,4,3)
likelihood(y)(2)
plot(likelihood(y), 2, 4, xlab="mu", ylab="likelihood")

log_likelihood = function(y) {
  return(function(mu) {
    L = 0
    for (yn in y) {
      L = L - (yn-mu)^2
    }
    return(L)
  })
}

y = rnorm(100,5,1)
plot(log_likelihood(y), 2, 8, xlab="mu", ylab="likelihood")
