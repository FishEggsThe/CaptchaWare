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
currRound = 0;
playerScore = 0;
gameWon = false;
gameOver = false;

setNextSpeedUp = 4;
setNextBossStage = 12;
nextSpeedUp = setNextSpeedUp;
nextBossStage = setNextBossStage;

#region Sequences here
sequences = ds_map_create();
var seqID, seq;
// Break Time
seqID = layer_sequence_create("Sequences", 0, 0, Sq_BreakTime);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "Break", new sequenceInfo(seqID, seq));

// Game Results (Win)
seqID = layer_sequence_create("Sequences", 0, 0, Sq_GameResultsWin);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "WinResults", new sequenceInfo(seqID, seq));

// Game Results (Lost)
seqID = layer_sequence_create("Sequences", 0, 0, Sq_GameResultsLose);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "LoseResults", new sequenceInfo(seqID, seq));

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

// Game Over
seqID = layer_sequence_create("Sequences", 0, 0, Sq_GameOver);
seq = layer_sequence_get_instance(seqID);
layer_sequence_pause(seqID)
ds_map_add(sequences, "GameOver", new sequenceInfo(seqID, seq));

// Startup
seqID = layer_sequence_create("Sequences", 0, 0, Sq_Startup);
seq = layer_sequence_get_instance(seqID);
layer_sequence_play(seqID) // MAKE SURE THIS IS THE ONLY SEQUENCE SET TO PLAY ON START PLEASE
ds_map_add(sequences, "Startup", new sequenceInfo(seqID, seq));

currSequence = sequences[? "Startup"];
#endregion End of Sequences here

showControls = false;

gameTimer = 0;
gameWonTimer = 120;

inGameState = false;
currentState = "Break";