size(0cm, 3cm);

transform fontsc = scale(1);

pair[] pts = {(0, 0), (3, 0), (3, 3), (0, 3)};
int[] labs = {1, 0, 1, 0};

for (int i = 0; i < pts.length; ++i) {
  int k = labs[i];
  
  pair pos = pts[i];
  path circ = circle(pos, 0.05);
  pen fillclr = (k == 1? white : black);
  draw(circ);
  fill(circ, fillclr);
  
  string str = (k == 1 ? "$+$" : "$-$");
  Label l = Label(str, pos + (0, 0.5));
  label(fontsc * l);
}
