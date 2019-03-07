data {
  int y[199];
}
parameters{
  real<lower=0> m;
  real<lower=0> s;
}
model{
  y ~ neg_binomial_2(m,s);
}