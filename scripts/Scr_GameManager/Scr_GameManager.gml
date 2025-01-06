function microgame(_createGame, _winCondition, _time) constructor {
	createGame = _createGame;
	winCondition = _winCondition;
	time = _time;
}

function CreateMicrogameList(_microgames) {
	Obj_GameManager.microgames = [];
	
	// Fill up Microgame list
	var i, numOfGames = array_length(_microgames);
	for(i = numOfGames-1; i >= 0; i--)
		Obj_GameManager.microgames[i] = _microgames[i];
}

// Setup all microgames
var create, win, gameLayer = "Game_Instances";
global.migrogameList = [];

//
create = function() {
	instance_create_layer(room_width/2, room_height/2, gameLayer, Obj_Checkbox);
};
win = function() {
	if instance_exists(Obj_Checkbox)
		return Obj_Checkbox.checked;
	return false;
};
global.migrogameList[0] = new microgame(create, win, 300);