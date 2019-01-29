size(13cm, 0cm);

texpreamble("
  \usepackage[utf8]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage[slovak]{babel}
");

path x_axis = (0, 0) -- (5, 0);
path y_axis = (0, 0) -- (0, 5);

path bias = (0, 4.5) .. (1, 2.5) .. (2, 1.5) .. (3, 1) .. (4, 0.75) .. (5, 0.625);
path variance = (0, 0.1) .. (1, 0.2) .. (2, 0.4) .. (3, 0.8) .. (4, 1.6) .. (5, 3.2);
path total = (0, 4.6) .. (1, 2.7) .. (2, 1.9) .. (3, 1.8) .. (4, 2.35) .. (5, 3.825);

path training_err = (0, 4.4) .. (1, 2.2) .. (2, 1.1) .. (3, 0.55) .. (4, 0.275) .. (5, 0.15);

fill(training_err -- reverse(x_axis) -- cycle, lightgray);
fill(bias -- reverse(training_err) -- cycle, palegray);

draw(x_axis, L="zložitosť množiny hypotéz $H$", align=RightSide, arrow=Arrow());
draw(y_axis, L=rotate(90)*"chyba", align=LeftSide, arrow=Arrow());

draw(bias, dashed);
Label bias_lab = Label("výchylka", (2.65, 1.4));
label(bias_lab);

draw(variance, dashed, L=Label("rozptyl", position=Relative(0.8)), align=RightSide);

draw(total);
Label total_lab = Label("chyba algoritmu", (2.65, 2));
label(total_lab);

draw(training_err, dotted);
Label training_err_lab = Label("trénovacia chyba", (1, 1));
label(training_err_lab);

Label training_var_lab = Label("trénovací rozptyl", (4.35, 0.45));
label(training_var_lab);
