normal = function(x, mu, sigma) {
  exp(-(x-mu)^2/2*sigma^2) /sqrt(2*pi*sigma^2)
}

comb = function(n, x) {
  factorial(n)/(factorial(x)*factorial(n-x))
}

binom = function(x, n, p) {
  comb(n,x)*p^x*(1-p)^(n-x)
}

x = seq(-5,5, 0.03)
qplot(x, normal(x,0,1))

x = seq(0,10)
y = c()
for (xi in x) {
  y = c(y, binom(xi, 10, 0.8))
}
qplot(x, y, geom = "line")
