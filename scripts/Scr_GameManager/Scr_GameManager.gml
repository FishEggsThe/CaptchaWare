function microgame(_createGame, _winCondition, _time, _popupText, _controls) constructor {
	createGame = _createGame;
	winCondition = _winCondition;
	time = _time;
	popupText = _popupText;
	controls = _controls;
}

#region Microgame stuff
function CreateMicrogameList(_microgames) {
	with Obj_GameManager {
		microgames = [];
	
		// Fill up Microgame list
		var i = 0, numOfGames = array_length(_microgames);
		for(i = numOfGames-1; i >= 0; i--)
			microgames[i] = _microgames[i];
	}
}

function SelectMicrogame() {
	with Obj_GameManager {
		selectMicrogame = microgames[irandom(microgamesSize-1)];
		//selectMicrogame = microgames[microgamesSize-1];
		//selectMicrogame = microgames[1];
	}
}

function SelectBossMicrogame() {
	SelectMicrogame(); // Temporary, add boss microgames!!!!!!
}
#endregion

function CheckIfCanInteract() {
	if instance_exists(Obj_GameManager) {
		with Obj_GameManager {
			if !(currentState == "Game" || currentState == "GameOver") { return false; }
		}
	}
	return true;
}

function DetermineRampUp() {
	nextSpeedUp--;
	nextBossStage--;
	if (nextBossStage <= 0 && difficulty < 2) {
		ResetDifficultyProgression();
		ChangeSequence("BossStage");
	} else if (nextSpeedUp <= 0) {
		nextSpeedUp = setNextSpeedUp;
		ChangeSequence("SpeedUp");
	} else {
		ChangeSequence("Break");
	}
}

function ResetDifficultyProgression() {
	with Obj_GameManager {
		nextSpeedUp = setNextSpeedUp;
		nextBossStage = setNextBossStage;
	}
}

function ResetGame() {
	ResetDifficultyProgression()
	with Obj_GameManager {
		difficulty = 0;
		currRound = 0;
		playerScore = 0;
		playerLives = 4
		ChangeSequence("Startup");
	}
}

#region Game Speed
global.gameSpeed = 1;
function SetGameSpeed(_speed) {
	global.gameSpeed = _speed;
	Obj_GameManager.currSequence.seq.speedScale = _speed;
}
function GetGameSpeed() {
	return global.gameSpeed;
}
function ResetGameSpeed() {
	SetGameSpeed(1);
}
function IncrementGameSpeed(_inc = 0.05) {
	SetGameSpeed(GetGameSpeed()+_inc);
}
#endregion

// Setup all microgames
var create, win, time, popupText, controls, index = 0;
global.migrogameList = [];

#region Click the Checkbox
create = function(_difficulty) {
	var xPos = room_width/2 + random_range(-128, 128)*_difficulty, 
		yPos = room_height/2 + random_range(-96, 96)*_difficulty,
		checkbox = instance_create_layer(xPos, yPos, "Game_Instances", Obj_Checkbox);
	checkbox.size = 2/(_difficulty+1);
};
win = function() {
	if instance_exists(Obj_Checkbox)
		return Obj_Checkbox.checked;
	return false;
};
time = 240; popupText = "Check the Box"; controls = [true, false];
global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;
#endregion

#region Pick all Buses
create = function(_difficulty) {
	instance_create_layer(0, 0, "Game_Instances", Obj_TileSpriteBank);
	// Laying out tiles
	// I hate whenever I have to do this
	var dims = 3+_difficulty, margin = 1.1, width = sprite_get_width(Spr_Button),
		xOrigin = room_width/2-width*dims/2, yOrigin = room_height/2-width*dims/2, 
		i, j, xPos, yPos;
	for(i = 0; i < dims; i++) {
		for(j = 0; j < dims; j++) {
			xPos = xOrigin+64*j*margin; yPos = yOrigin+64*i*margin;
			instance_create_layer(xPos, yPos, "Game_Instances", Obj_TileDisappear);
		}
	}
	// Picking which tiles to be problem tiles
	var indexList = array_create_ext(dims*dims, function(_index) {return _index;});
	repeat(dims) {
		var listPick = irandom(array_length(indexList)-1),
			randI = indexList[listPick], 
			tile = instance_find(Obj_TileDisappear, randI);
		with tile {
			isBus = true;
			maxRerolls = choose(1, 2);
			GetNewTileSprite();
		}
		array_delete(indexList, listPick, 1);
	}
};
win = function() {
	if instance_exists(Obj_TileDisappear) {
		with Obj_TileDisappear { if isBus { return false; } }
		return true;
	}
	return false;
};
time = 300; popupText = "Pick all Buses"; controls = [true, false];
global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;
#endregion

#region Type the Prompt
create = function(_difficulty) {
	//160, 256
	instance_create_layer(160, 256, "Game_Instances", Obj_TypePrompt);
};
win = function() {
	if instance_exists(Obj_TypePrompt) {
		with Obj_TypePrompt { if input == prompt { return true; } }
	}
	return false;
};
time = 360; popupText = "Type the Prompt"; controls = [false, true];
global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;
#endregion

// Microgame Template
//create = function(_difficulty) {
	
//};
//win = function() {
	
//};
//time = 300; popupText = ""; controls = [true, false];
//global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;