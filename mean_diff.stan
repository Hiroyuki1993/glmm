data{
  real x[100];
  real y[100];
}
parameters{
  real mu_x;
  real diff;
  real<lower=0> sigma_x;
  real<lower=0> sigma_y;
}
model {
  x ~ normal(mu_x+diff, sigma_x);
  y ~ normal(mu_x, sigma_y);
}