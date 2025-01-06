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
playerScore = 0;
gameWon = false;
gameOver = false;

// Figure out if you need these values later
breakTimer = 0;
setBreakTimer = 120;

gameTimer = 0;
gameWonTimer = 120;

timeline_index = Tl_BreakTimeline;
timeline_running = true;

// This part is dedicated to initializing states
state = noone;
// While a microgame is being played
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
		timeline_position = 0;
		timeline_running = true;
		state = gameWon ? winGameState : loseGameState;
	}
		
}
// The time right before a microgame is to be played
breakState = function() {
	if timeline_position > timeline_max_moment(timeline_index) {
		with Obj_CaptchaScreen { lerpToSize = maxSize; }
		gameTimer = selectMicrogame.time;
		timeline_running = false;
		gameWon = false;
		state = gameState;
	}
}
// The game over screen
lostState = function() {
}
// Right after a microgame is won
winGameState = function() {
	playerScore++;
	state = breakState;
}
// Right after a microgame is lost
loseGameState = function() {
	playerLives--;
	//var noLives = playerLives <= 0;
	if playerLives <= 0 {	
		state = lostState;
		gameOver = true;
		timeline_running = false;
	} else {
		state = breakState;
	}
}

state = breakState;