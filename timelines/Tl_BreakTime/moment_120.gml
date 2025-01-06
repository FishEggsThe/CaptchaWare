Obj_GameManager.showControls = false;
with Obj_CaptchaScreen { lerpToSize = maxSize; }
with Obj_GameManager {
	gameTimer = selectMicrogame.time;
	gameWon = false;
	state = gameState;
	timeline_running = false;
}