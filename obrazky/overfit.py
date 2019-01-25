import sys

import numpy as np
from scipy import optimize
from matplotlib import pyplot as plt


# Degree of polynomial to plot.
k = int(sys.argv[1])

max_x = 5

# Seed the random number generator for reproducibility
np.random.seed(47)

x = np.linspace(0, max_x, 10)
y = x**2 + np.random.normal(0, 0.5, size = 10)

def polynomial(x, *args):
  res = None
  for i, k in enumerate(args):
    if res is None:
      res = k * x**i
    else:
      res += k * x**i
  return res



p, _ = optimize.curve_fit(polynomial, x, y, p0 = [0]*(k+1))

x_all = np.linspace(0, max_x, 1000)

plt.scatter(x, y, label = "data")
plt.plot(x_all, polynomial(x_all, *p), color = "orange")

plt.legend(loc = "best")
plt.ylim(-max_x, max_x**2)
plt.savefig("fitting{}.pdf".format(k), bbox_inches = "tight")
plt.show()
