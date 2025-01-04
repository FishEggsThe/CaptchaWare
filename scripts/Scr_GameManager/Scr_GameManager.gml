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

var create, win;
global.migrogameList = [];

//
create = function() {
	
};
win = function() {
	
};
global.migrogameList[0] = new microgame(create, win);