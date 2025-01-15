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
	room_goto(Rm_Menu);
};