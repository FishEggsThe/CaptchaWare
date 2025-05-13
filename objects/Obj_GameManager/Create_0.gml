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

difficulty = 2;
playerLives = 4;
//gameSpeed = 1;
currRound = 0;
playerScore = 0;
gameWon = false;
gameOver = false;

// Sequences here
sequences = ds_map_create();
var seqID, seq;
// Break Time
seqID = layer_sequence_create("Sequences", 0, 0, Sq_BreakTime);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "Break", new sequenceInfo(seqID, seq));

// Game Results
seqID = layer_sequence_create("Sequences", 0, 0, Sq_GameResults);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "Results", new sequenceInfo(seqID, seq));

// Speed Up
seqID = layer_sequence_create("Sequences", 0, 0, Sq_SpeedUp);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "SpeedUp", new sequenceInfo(seqID, seq));

// Level Up
seqID = layer_sequence_create("Sequences", 0, 0, Sq_LevelUp);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "LevelUp", new sequenceInfo(seqID, seq));

// Startup
seqID = layer_sequence_create("Sequences", 0, 0, Sq_Startup);
seq = layer_sequence_get_instance(seqID);
layer_sequence_play(seqID)
ds_map_add(sequences, "Startup", new sequenceInfo(seqID, seq));

currSequence = sequences[? "Startup"];
// End of Sequences here

showControls = false;

gameTimer = 0;
gameWonTimer = 120;

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
		
		ChangeSequence("Results");
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
	currentState = "Startup";
}

state = startupState;