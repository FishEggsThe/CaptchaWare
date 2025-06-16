event_inherited();
imageSprite = Spr_Checkmark;

selected = false;
isTrafficLight = false;

checkReleased = function() {
	selected = !selected;
	
	with Obj_TileSelect { if isTrafficLight != selected { return; } }
	GameWon();
};