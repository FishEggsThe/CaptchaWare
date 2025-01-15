event_inherited();

notHovering = function() {
	color = c_white;
};

hover = function() {
	color = c_ltgray;
};

check = function() {
	color = c_gray;
};

checkPressed = function() {
	with Obj_Control {
		difficulty = 0;
		currRound = 0;
		playerScore = 0;
		timeline_running = true;
	}
	
	instance_destroy(Obj_GoBack);
	instance_destroy();
};