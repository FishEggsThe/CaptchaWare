function DrawTimer(time) {
	var unitLengthMax = 3, unitLength = floor(time/30);
	if unitLength > unitLengthMax { return; }
	
	var xBomb = room_width/5, yBomb = 4*room_height/5, bombThickness = 25,
		lineThickness = 10, lineEnd = room_width-2*xBomb, segmentLength = lineEnd/unitLengthMax;
	
	draw_set_color(c_blue);
	draw_circle(xBomb, yBomb, bombThickness, false);
	var xEnd = xBomb+unitLength*segmentLength;
	draw_line_width(xBomb, yBomb, xEnd, yBomb, lineThickness);
}