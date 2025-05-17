if !debug { exit;}

DrawText(0, 0, "Debug", fa_left, fa_top);

var gm,
	cs,
	ct,
	debugLog = [];

if instance_exists(Obj_GameManager) {
	gm = Obj_GameManager
	array_push(debugLog, "Game Timer: " + string(gm.gameTimer));
	array_push(debugLog, "Sequence Timer: " + string(gm.currSequence.seq.headPosition));
	array_push(debugLog, "Game Won: " + string(gm.gameWon));
	array_push(debugLog, "Lives: " + string(gm.playerLives));
	array_push(debugLog, "Score: " + string(gm.playerScore));
	array_push(debugLog, "Timeline Currently Running: " + string(gm.currSequence.seq.paused));
	array_push(debugLog, "State: " + string(gm.currentState));
	array_push(debugLog, "Next Speed Up: " + string(gm.nextSpeedUp));
	array_push(debugLog, "Next Boss Stage: " + string(gm.nextBossStage));
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
//array_push(debugLog, "No. of Button Managers: " + string(instance_number(Obj_SubmitName)));

DrawDebugText(debugLog);