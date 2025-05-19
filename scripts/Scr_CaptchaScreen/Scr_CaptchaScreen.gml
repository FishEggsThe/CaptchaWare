function DrawTimer(time) {
	var unitLengthMax = 3, unitLength = floor(time/30);
	if unitLength > unitLengthMax { return; }
	
	var xBomb = room_width/7, yBomb = 6*room_height/7;
	
	draw_set_color(c_blue);
	
	if unitLength <= 0 {
		DrawSprite(Spr_BombExplode, 0, xBomb, yBomb);
	} else {
		var bombThickness = 20, lineThickness = 10, 
			lineEnd = room_width-2*xBomb, 
			segmentLength = lineEnd/unitLengthMax;
		
		draw_circle(xBomb, yBomb, bombThickness, false);
		var xEnd = xBomb+unitLength*segmentLength;
		draw_line_width(xBomb, yBomb, xEnd, yBomb, lineThickness);
		draw_set_color(c_white);
		DrawText(xEnd, yBomb-25, unitLength, fa_center, fa_middle, c_white)
	}
}