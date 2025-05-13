function GetNewTileSprite(){
	var newSprite;
	with Obj_TileSpriteBank {
		if isBus {
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