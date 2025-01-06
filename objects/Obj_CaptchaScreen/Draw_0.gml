if size >= maxSize { exit; }

DrawSprite(sprite, 0, x, y, maxSize, maxSize, 0, backgroundColor, 2-size);


var i, gm = Obj_GameManager, alpha = 2-size;
for(i = 0; i < gm.playerLives; i++) {
	DrawSprite(chives, 0, 32, 96+64*i, 1, 1, 0, c_white, alpha);
}
var color, on = Obj_GameManager.showControls;
for(i = 0; i < 2; i++) {
	color = (on && gm.selectMicrogame.controls[i]) ? c_yellow : c_dkgray;
	DrawSprite(chives, 0, room_width-96, 160+64*i, 1, 1, 0, color, alpha);
}

DrawSprite(sprite, 0, x, y, size, size, 0, c_white, alpha);
