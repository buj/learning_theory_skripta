size(0cm, 3.75cm);

transform fontsc = scale(1);


path get_rect (pair x, pair y) {
  path res = (x.x, y.x) -- (x.x, y.y) -- (x.y, y.y) -- (x.y, y.x) -- cycle;
  return res;
}

pair tgt_x = (-5, 5);
pair tgt_y = (-2.5, 2.5);

path tgt = get_rect(tgt_x, tgt_y);
draw(tgt);


real hx0 = 1023;
real hx1 = -1023;
real hy0 = 1023;
real hy1 = -1023;

pair[] pts = {(-6, -2), (4, -2), (2.7, -3), (2, 1), (-1, -2), (4.5, 3), (-2, -1), (0, -2), (0.5, 1.5), (6, 1)};
int[] labs;
for (int i = 0; i < pts.length; ++i) {
  int k = 0;
  real x = pts[i].x;
  real y = pts[i].y;
  if (x >= tgt_x.x && x <= tgt_x.y) {
    if (y >= tgt_y.x && y <= tgt_y.y) {
      k = 1;
    }
  }
  if (k == 1) {
    hx0 = min(hx0, x);
    hx1 = max(hx1, x);
    hy0 = min(hy0, y);
    hy1 = max(hy1, y);
  }
  labs.push(k);
}

pair hx = (hx0, hx1);
pair hy = (hy0, hy1);

path hypo = get_rect(hx, hy);
fill(hypo, lightgray);

draw((tgt_x.x, hy0) -- (tgt_x.y, hy0), dashed);
draw((tgt_x.x, hy1) -- (tgt_x.y, hy1), dashed);
draw((hx0, tgt_y.x) -- (hx0, tgt_y.y), dashed);
draw((hx1, tgt_y.x) -- (hx1, tgt_y.y), dashed);



for (int i = 0; i < pts.length; ++i) {
  int k = labs[i];
  
  pair pos = pts[i];
  path circ = circle(pos, 0.09);
  pen fillclr = (k == 1? white : black);
  draw(circ);
  fill(circ, fillclr);
  
  string str = (k == 1 ? "$+$" : "$-$");
  Label l = Label(str, pos + (0.45, 0.45));
  label(fontsc * l);
}
