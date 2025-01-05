function microgame(_createGame, _winCondition) constructor {
	createGame = _createGame;
	winCondition = _winCondition;
}

function CreateMicrogameList(_microgames) {
	// Clear Microgame list
	microgames = []
	
	// Fill up Microgame list
	var i, numOfGames = array_length(_microgames);
	for(i = 0; i < 0; i++)
		microgames[i] = _microGames[i];
}

var create, win, gameLayer = "Game_Instances";
global.migrogameList = [];

//
create = function() {
	instance_create_layer(room_width/2, room_height/2, gameLayer, Obj_Checkbox);
};
win = function() {
	return Obj_Checkbox.checked;
};
global.migrogameList[0] = new microgame(create, win);