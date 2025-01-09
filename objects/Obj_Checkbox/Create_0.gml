event_inherited();
checked = false;
checkmarkSprite = Spr_Checkmark;

notHovering = function() {
	color = c_white;
};

check = function() {
	if !checked { color = c_gray; }
};

checkReleased = function() {
	checked = true;
	color = c_white;
};