event_inherited();
imageSprite = chives;

selected = false;
isTrafficLight = false;

checkReleased = function() {
	selected = !selected;
	
	with Obj_TileSelect { if isTrafficLight != selected { return; } }
	GameWon();
};