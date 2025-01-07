event_inherited();
isBus = false;
maxRerolls = 0;

color = c_white;
checkmarkSprite = Spr_Checkmark;

notHovering = function() {
	lerpToSize = 1;
};

hover = function() {
	lerpToSize = 1.2;
};

check = function() {
	lerpToSize = 0.7;
	
};

checkReleased = function() {
	if maxRerolls < 1
		isBus = choose(true, false);
	else
		isBus = false;
	maxRerolls--;
};