if !debug { exit;}

draw_text(0, 0, "Debug");

var gm = Obj_GameManager,
	cs = Obj_CaptchaScreen;
	
DrawDebugText(["Game Timer: " + string(gm.gameTimer),
				"Break Timer: " + string(gm.timeline_position),
				"Size (to lerp to): " + string(cs.lerpToSize),
				"Microgame Time: " + string(gm.selectMicrogame.time)]);