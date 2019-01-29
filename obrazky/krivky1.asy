size(13cm, 0cm);

texpreamble("
  \usepackage[utf8]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage[slovak]{babel}
");

path x_axis = (0, 0) -- (5, 0);
path y_axis = (0, 0) -- (0, 5);

path bias = (0, 1.5) -- (5, 1.5);
path err = (0, 4.5) .. (1, 3.75) .. (2, 3.4) .. (3, 2.5) .. (4, 2.1) .. (5, 1.9);
path training_err = (0, 0) .. (2, 0.7) .. (4, 1.1) .. (5, 1.2);

fill(training_err -- reverse(x_axis) -- cycle, lightgray);
fill(bias -- reverse(training_err) -- cycle, palegray);

draw(x_axis, L="počet príkladov $t$", align=RightSide, arrow=Arrow());
draw(y_axis, L=rotate(90)*"chyba", align=LeftSide, arrow=Arrow());

draw(bias, dashed, L="výchylka", align=LeftSide);
draw(err, L="chyba algoritmu", align=LeftSide);
draw(training_err, dotted);

Label training_err_label = Label("trénovacia chyba", shift(0, -0.5) * arcpoint(training_err, 4));
label(training_err_label);

Label training_var_label = Label("trénovací rozptyl", shift(0, 0.5) * arcpoint(training_err, 1.25));
label(training_var_label);
