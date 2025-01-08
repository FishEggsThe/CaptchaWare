var textEmpty = inputSize <= 0,
	textColor = textEmpty ? c_gray : c_black,
	insert = !textEmpty && insertPoint ? "|" : "",
	text = textEmpty ? placeholder : input + insert;

draw_set_color(c_white);
draw_rectangle(x, y, x+length, y+height, false);
DrawText(x, y, text, fa_left, fa_top, textColor, 2, 2);