if !debug { exit;}

DrawText(0, 0, "Debug", fa_left, fa_top);

var gm,
	cs,
	ct,
	debugLog = [];

if instance_exists(Obj_GameManager) {
	gm = Obj_GameManager
	array_push(debugLog, "Game Timer: " + string(gm.gameTimer));
	array_push(debugLog, "Break Timer: " + string(gm.timeline_position));
	array_push(debugLog, "Game Won: " + string(gm.gameWon));
	array_push(debugLog, "Lives: " + string(gm.playerLives));
	array_push(debugLog, "Score: " + string(gm.playerScore));
	array_push(debugLog, "Timeline Currently Running: " + string(gm.timeline_running));
	array_push(debugLog, "State: " + string(gm.currentState));
}
if instance_exists(Obj_CaptchaScreen) {
	cs = Obj_CaptchaScreen
	array_push(debugLog, "Size (to lerp to): " + string(cs.lerpToSize));
}
if instance_exists(Obj_Control) {
	ct = Obj_Control
	array_push(debugLog, "Player Name: " + string(ct.playerName));
}
array_push(debugLog, "Game Speed: " + string(global.gameSpeed));

DrawDebugText(debugLog);