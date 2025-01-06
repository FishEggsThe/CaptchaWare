if CheckIfDuplicate() { exit; }
if !instance_exists(Obj_CaptchaScreen)
	instance_create_layer(room_width/2, room_height/2, "Instances", Obj_CaptchaScreen);

microgames = [];
CreateMicrogameList(global.migrogameList);
microgamesSize = array_length(global.migrogameList);
selectMicrogame = noone;

playerLives = 4;
gameSpeed = 1;
currRound = 0;
gameWon = false;

setBreakTimer = 120;
breakTimer = setBreakTimer;

gameTimer = 0;
gameWonTimer = 120;

timeline_index = Tl_BreakTimeline;
timeline_running = true;

state = noone;
gameState = function() {
	if gameTimer > 0 {
		var win = selectMicrogame.winCondition()
		gameWon = win;
		if (win && gameTimer > gameWonTimer) {
			gameTimer = gameWonTimer;
		}
		gameTimer--;
	} else {
		with Obj_CaptchaScreen { lerpToSize = minSize; }
		breakTimer = setBreakTimer
		timeline_position = 0;
		timeline_running = true;
		state = gameWon ? winGameState : loseGameState;
	}
		
}
breakState = function() {
	if timeline_position > timeline_max_moment(timeline_index) {
		with Obj_CaptchaScreen { lerpToSize = maxSize; }
		gameTimer = selectMicrogame.time;
		timeline_running = false;
		state = gameState;
	}
}
winGameState = function() {
	state = breakState;
}
loseGameState = function() {
	state = breakState;
}

state = breakState;