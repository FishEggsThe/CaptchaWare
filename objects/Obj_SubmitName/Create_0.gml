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
	if Obj_InputName.input != ""
		Obj_Control.playerName = Obj_InputName.input;
};

checkReleased = function() {
	
};