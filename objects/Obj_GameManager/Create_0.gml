if CheckIfDuplicate() { exit; }

microgames = CreateMicrogameList(global.migrogameList);
microgamesSize = array_length(global.migrogameList);
selectMicrogame = noone;

playerLives = 4;
gameSpeed = 1;
currRound = 0;

setBreakTimer = 120;
breakTimer = setBreakTimer;

gameTimer = 0;
gameWonTimer = 120;

state = noone;
gameState = function() {
	if gameTimer > 0
		gameTimer--;
	else {
		Obj_CaptchaScreen.lerpToSize = Obj_CaptchaScreen.minSize;
		breakTimer = setBreakTimer
		state = breakState;
	}
		
}
breakState = function() {
	if breakTimer > 0
		breakTimer--;
	else {
		Obj_CaptchaScreen.lerpToSize = Obj_CaptchaScreen.maxSize;
		gameTimer = 120;
		state = gameState;
	}
}

state = breakState;