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

// Setup all microgames
var create, win, time, popupText, controls, index = 0;
global.migrogameList = [];

// Click the Checkbox
create = function() {
	instance_create_layer(room_width/2, room_height/2, "Game_Instances", Obj_Checkbox);
};
win = function() {
	if instance_exists(Obj_Checkbox)
		return Obj_Checkbox.checked;
	return false;
};
time = 300; popupText = "Check the Box"; controls = [true, false];
global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;

// Pick all Buses
create = function() {
	// Laying out tiles
	var dims = 3, xOrigin = room_width/2-64*dims/2, yOrigin = room_height/2-64*dims/2, i, j;
	for(i = 0; i < dims; i++) {
		for(j = 0; j < dims; j++) {
			instance_create_layer(xOrigin+64*j, yOrigin+64*i, "Game_Instances", Obj_TileDisappear);
		}
	}
	// Picking which tiles to be problem tiles
	var indexList = array_create_ext(dims*dims, function(_index) {return _index;});
	repeat(3) {
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