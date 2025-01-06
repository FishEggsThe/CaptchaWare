if size >= maxSize { exit; }

DrawSprite(sprite, 0, x, y, maxSize, maxSize, 0, backgroundColor, 2-size);


var i, gm = Obj_GameManager, alpha = 2-size;
for(i = 1; i <= gm.playerLives; i++) {
	DrawSprite(chives, 0, 32, 32+64*i, 1, 1, 0, c_white, alpha);
}
for(i = 1; i <= 2; i++) {
	DrawSprite(chives, 0, room_width-96, 96+64*i, 1, 1, 0, c_yellow, alpha);
}

DrawSprite(sprite, 0, x, y, size, size, 0, c_white, alpha);
