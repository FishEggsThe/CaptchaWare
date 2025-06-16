event_inherited();
imageSprite = Spr_Checkmark;

isBus = false;
maxRerolls = 0;

checkReleased = function() {
	maxRerolls--;
	//mask_index = noone;
	isBus = maxRerolls > 0;
	GetNewTileSprite();
	
	with Obj_TileDisappear { if isBus { return; } }
	GameWon();
};