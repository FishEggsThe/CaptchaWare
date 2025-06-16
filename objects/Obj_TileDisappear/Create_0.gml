event_inherited();
isBus = false;
maxRerolls = 0;

imageSprite = Spr_Checkmark;

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
	//mask_index = noone;
	isBus = maxRerolls > 0;
	GetNewTileSprite();
	
	with Obj_TileDisappear { if isBus { return; } }
	GameWon();
};