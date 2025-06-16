function microgame(_createGame, _time, _popupText, _controls) constructor {
	createGame = _createGame;
	time = _time;
	popupText = _popupText;
	controls = _controls;
}

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
time = 240; popupText = "Check the Box"; controls = [true, false];
global.migrogameList[index] = new microgame(create, time, popupText, controls); index++;
#endregion

#region Pick all Buses
create = function(_difficulty) {
	instance_create_layer(0, 0, "Game_Instances", Obj_TileSpriteBank);
	CreateTileGrid(Obj_TileDisappear, 3+_difficulty, function(obj) {
		obj.isBus = true;
		obj.maxRerolls = choose(1, 2);
		obj.getNewTileSprite();
	})
};
time = 300; popupText = "Pick all Buses"; controls = [true, false];
global.migrogameList[index] = new microgame(create, time, popupText, controls); index++;
#endregion

#region Type the Prompt
create = function(_difficulty) {
	//160, 256
	instance_create_layer(160, 256, "Game_Instances", Obj_TypePrompt);
};
time = 360; popupText = "Type the Prompt"; controls = [false, true];
global.migrogameList[index] = new microgame(create, time, popupText, controls); index++;
#endregion

#region Select All Traffic Lights
	create = function(_difficulty) {
		//instance_create_layer(0, 0, "Game_Instances", Obj_TileSpriteBank);
		CreateTileGrid(Obj_TileSelect, 3+_difficulty, function(obj) {
			obj.imageSprite = Spr_Checkmark;
			obj.isTrafficLight = true;
		})
	};
	time = 300; popupText = "Select All Traffic Lights"; controls = [true, false];
	global.migrogameList[index] = new microgame(create, time, popupText, controls); index++;
#endregion

#region Microgame Template
//create = function(_difficulty) {
	
//};
//win = function() {
	
//};
//time = 300; popupText = ""; controls = [true, false];
//global.migrogameList[index] = new microgame(create, win, time, popupText, controls); index++;
#endregion