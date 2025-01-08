var textCheck = inputSize <= 0,
	textColor = textCheck ? c_gray : c_black,
	text = textCheck ? placeholder : input;

draw_set_color(c_white);
draw_rectangle(x, y, x+length, y+height, false);
DrawText(x, y, text, fa_left, fa_top, textColor, 2, 2);
DrawText(x, y, chr(keyboard_lastkey), fa_right, fa_bottom, c_black, 2, 2);