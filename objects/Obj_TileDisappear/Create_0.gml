event_inherited();
isBus = false;
maxRerolls = 0;

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
	maxRerolls--;
	mask_index = noone;
	doSwap = true;
	isBus = maxRerolls > 0;
	doSwap = true;
	swap = true;
};