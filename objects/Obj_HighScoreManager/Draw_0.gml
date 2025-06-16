if !showScores { exit; }

DrawSprite(Spr_CaptchaScreen, 0, room_width/2, room_height/2, 2, 2, 0, c_black, 0.5);
DrawHighScores();