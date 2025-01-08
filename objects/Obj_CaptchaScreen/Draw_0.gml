if size >= maxSize { exit; }

DrawSprite(sprite, 0, x, y, maxSize, maxSize, 0, backgroundColor, 2-size);


var i, gm = Obj_GameManager, alpha = 2-size;
for(i = 0; i < gm.playerLives; i++) {
	DrawSprite(chives, 0, 32, 96+64*i, 1, 1, 0, c_white, alpha);
}
var color, on = gm.showControls;
for(i = 0; i < 2; i++) {
	color = (on && gm.selectMicrogame.controls[i]) ? c_yellow : c_dkgray;
	DrawSprite(chives, 0, room_width-96, 160+64*i, 1, 1, 0, color, alpha);
}

DrawText(room_width, room_height-30, "Score: "+string(gm.playerScore), fa_right, fa_bottom, c_black, 2, 2, 0, alpha);
DrawText(room_width, room_height-30, "Score: "+string(gm.playerScore), fa_right, fa_bottom, c_black, 2, 2, 0, alpha);
DrawText(room_width, room_height,    "Round: "+string(gm.currRound), fa_right, fa_bottom, c_black, 2, 2, 0, alpha);

DrawSprite(sprite, 0, x, y, size, size, 0, c_white, alpha);
