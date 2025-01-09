if CheckIfDuplicate() { exit; }
if !instance_exists(Obj_CaptchaScreen)
	instance_create_layer(room_width/2, room_height/2, "Instances", Obj_CaptchaScreen);

microgames = [];
CreateMicrogameList(global.migrogameList);
microgamesSize = array_length(global.migrogameList);
selectMicrogame = noone;

holdSize = 1;
holdList = array_create(holdSize, -1);
availableIndexes = array_create_ext(microgamesSize-holdSize-1, function(_index) {return _index;});
pickIndex = -1;

difficulty = 0;
playerLives = 4;
//gameSpeed = 1;
currRound = 0;
playerScore = 0;
gameWon = false;
gameOver = false;

// Figure out if you need these values later
breakTimer = 0;
setBreakTimer = 120;

showControls = false;

gameTimer = 0;
gameWonTimer = 120;

timeline_index = Tl_Startup//Tl_BreakTime;
timeline_running = true;

// This part is dedicated to initializing states
state = noone;
currentState = "";
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
		
		timeline_index = Tl_GameResults;
		state = gameWon ? winGameState : loseGameState;
	}
	currentState = "Game";
		
}
// The time right before a microgame is to be played
breakState = function() {
	//if timeline_position > timeline_max_moment(timeline_index) {}
	currentState = "Break";
}
// The game over screen
gameOverState = function() {
	currentState = "Game Over";
	
}
// Right after a microgame is won
winGameState = function() {
	//if timeline_position > timeline_max_moment(timeline_index) {}
	currentState = "Won Game";
}
// Right after a microgame is lost
loseGameState = function() {
	//if timeline_position > timeline_max_moment(timeline_index) {}
	currentState = "Lost Game";
}
// When the difficulty goes up
levelUpState = function() {
	//if timeline_position > timeline_max_moment(timeline_index) {}
	currentState = "Level Up";
}
startupState = function() {
	if timeline_position > timeline_max_moment(timeline_index) {
		timeline_position = 0;
		timeline_index = Tl_BreakTime;
		state = breakState;
	}
	currentState = "Startup";
}

state = startupState;