data {
  real y[100];
}
parameters{
  real mu;
  real<lower=0> sigma;
}
model{
  y~normal(mu, sigma);
}