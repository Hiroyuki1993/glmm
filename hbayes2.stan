data {
  int y[199];
}
parameters{
  real<lower=0> m;
  real<lower=0> r[199];
  real<lower=0> s;
}
model {
  y ~ poisson(r);
  r ~ gamma(s, (s/m));
}