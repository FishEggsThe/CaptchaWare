event_inherited();

depth = -20;

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
	ResetGame();
	
	instance_destroy(Obj_GoBack);
	instance_destroy();
};