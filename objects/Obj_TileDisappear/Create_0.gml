event_inherited();
imageSprite = Spr_Checkmark;

isBus = false;
maxRerolls = 0;
getNewTileSprite = function() {
	var newSprite, bus = isBus;
	with Obj_TileSpriteBank {
		if bus {
			newSprite = buses[irandom(busesLength-1)];
		} else {
			if random(99) < 1
				newSprite = Spr_Secret;
			else
				newSprite = nonBuses[irandom(nonBusesLength-1)];
		}
	}
	imageSprite = newSprite;
}

checkReleased = function() {
	maxRerolls--;
	//mask_index = noone;
	isBus = maxRerolls > 0;
	getNewTileSprite();
	
	with Obj_TileDisappear { if isBus { return; } }
	GameWon();
	lerpToSize = 1;
};