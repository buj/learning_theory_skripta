size(9cm, 0cm);


path rect (real height) {
  path res = (0, 0) -- (0, height) -- (1, height) -- (1, 0) -- cycle;
  return res;
}

void plot (pair start, real test_err, real train_err) {
  path test = shift(start) * rect(test_err);
  path train = shift(start) * shift(1, 0) * rect(train_err);
  draw(test);
  fill(test, black);
  draw(train);
}

real[] test_errs = {5, 3, 2.1, 1.5, 1.2, 1.6, 2.4, 3.9};
real[] train_errs = {4, 2.3, 1.6, 1.1, 0.8, 0.6, 0.5, 0.45};

for (int i = 0; i < test_errs.length; ++i) {
  real err = test_errs[i];
  real err_t = train_errs[i];
  pair start = (4*i, 0);
  plot(start, err, err_t);
  Label hlab = Label("$H_{" + string(i+1) + "}$", start + (1, -1));
  label(hlab);
}
