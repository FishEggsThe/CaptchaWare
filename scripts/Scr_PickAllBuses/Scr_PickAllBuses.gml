function GetNewTileSprite(){
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