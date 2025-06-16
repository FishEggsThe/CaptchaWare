event_inherited();
imageSprite = 

selected = false;
isTrafficLight = false;

checkReleased = function() {
	selected = !selected;
	GetNewTileSprite();
	
	with Obj_TileSelect { if isTrafficLight != selected { return; } }
	GameWon();
};