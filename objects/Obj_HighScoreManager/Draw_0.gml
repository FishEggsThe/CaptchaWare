if !ifUsing { exit; }
if !showScores { exit; }

if data == -1 && array_length(data) <= 0 { 
	DrawText(room_width/2, room_height/2, "Fethcing scores...", fa_center, fa_middle);
	exit; 
} else {
	DrawSprite(Spr_CaptchaScreen, 0, room_width/2, room_height/2, 2, 2, 0, c_black, 0.5);
	DrawHighScores();
}