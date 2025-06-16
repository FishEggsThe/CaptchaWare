if selected {
	var outline = 1.1;
	DrawSprite(sprite, 0, x, y, size*outline, size*outline, 0, c_aqua);
}

event_inherited();

if Obj_Debug.debug { DrawText(x, y, isTrafficLight, fa_center, fa_middle, c_black, 2, 2, 45, 1); }