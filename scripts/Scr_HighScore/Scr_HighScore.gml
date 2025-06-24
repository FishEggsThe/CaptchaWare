function InitializeScore(p, n) {
	var s = {
		points: p,
		name: n
	};
	return s;
}

function DrawHighScores() {
	
	var xPos = room_width/2, yInc = room_height/8,
		display = "{0}: {1}";
	DrawText(xPos, yInc, "- High Scores -", 
			fa_center, fa_middle, c_white, 2, 2);
			
	for(var i = 0; i < array_length(data); i++) {
		var n = data[i].name, p = data[i].points;
		DrawText(xPos, yInc*(i+2), string(display, n, p), 
				fa_center, fa_middle, c_white, 2, 2);
	}
}