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
		//selectMicrogame = microgames[irandom(microgamesSize-1)];
		selectMicrogame = microgames[microgamesSize-1];
		//selectMicrogame = microgames[1];
	}
}

function SelectBossMicrogame() {
	SelectMicrogame(); // Temporary, add boss microgames!!!!!!
}

// Tile stuff
function CreateTileGrid(object, size, setup){
	var tileList = ds_list_create();
	// Laying out tiles
	// I hate whenever I have to do this
	var dims = size, margin = 1.1, width = sprite_get_width(Spr_Button),
		xOrigin = room_width/2-width*dims/2, yOrigin = room_height/2-width*dims/2, 
		i, j, xPos, yPos;
	for(i = 0; i < dims; i++) {
		for(j = 0; j < dims; j++) {
			xPos = xOrigin+64*j*margin; yPos = yOrigin+64*i*margin;
			var tile = instance_create_layer(xPos, yPos, "Game_Instances", object);
			ds_list_add(tileList, tile);
		}
	}
	// Picking which tiles to be problem tiles
	repeat(dims) {
		var randI = irandom(ds_list_size(tileList)-1),
			tile = ds_list_find_value(tileList, randI);
		with tile {
			setup(id);
		}
		ds_list_delete(tileList, randI);
	}
	ds_list_destroy(tileList);
	tileList = -1;
}