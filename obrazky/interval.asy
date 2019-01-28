size(6cm, 0cm);

int unit = 20;
int hair_len = 2;
int scope = 10;
real radius = 3;
int float_height = 23;

path real_line = (-scope*unit, 0) -- (scope*unit, 0);
draw(real_line);

for (int i = -scope; i <= scope; ++i) {
  real x = i*unit;
  path hair = (x, hair_len) -- (x, -hair_len);
  draw(hair);
}

int[] poss = {-4, 0, 7};
int[] labels = {1, 0, 1};
for (int i = 0; i < 3; ++i) {
  pair pos = (poss[i] * unit, 0);
  int k = labels[i];
  string str = (k == 1 ? "$+$" : "$-$");
  pen fillclr = (k == 1 ? white : black);
  path circ = circle(pos, radius);
  draw(circ);
  fill(circ, fillclr);
  label(Label(str, pos + (0, float_height)));
}
