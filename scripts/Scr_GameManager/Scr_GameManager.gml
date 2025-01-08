function microgame(_createGame, _winCondition, _time, _popupText, _controls) constructor {
	createGame = _createGame;
	winCondition = _winCondition;
	time = _time;
	popupText = _popupText;
	controls = _controls;
}

function CreateMicrogameList(_microgames) {
	Obj_GameManager.microgames = [];
	
	// Fill up Microgame list
	var i, numOfGames = array_length(_microgames);
	for(i = numOfGames-1; i >= 0; i--)
		Obj_GameManager.microgames[i] = _microgames[i];
}

global.gameSpeed = 1;
function SetGameSpeed(_speed) {
	global.gameSpeed = _speed;
	Obj_GameManager.timeline_speed = _speed;
}
function ResetGameSpeed() {
	SetGameSpeed(1);
}

// Setup all microgames
var create, win, time, popupText, controls, index = 0;
global.migrogameList = [];

// Click the Checkbox
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

// Pick all Buses
create = function(_difficulty) {
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
		tile.isBus = true;
		tile.maxRerolls = choose(1, 2);
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