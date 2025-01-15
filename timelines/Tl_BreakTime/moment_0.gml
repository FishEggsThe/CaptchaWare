// 0
with Obj_GameManager {
	currRound++;
	selectMicrogame = microgames[irandom(microgamesSize-1)];
	//selectMicrogame = microgames[microgamesSize-1];
	//selectMicrogame = microgames[1];
}

// 30
layer_destroy_instances("Game_Instances");
Obj_GameManager.showControls = true;

// 60
with Obj_GameManager { selectMicrogame.createGame(difficulty); }

// 120
Obj_GameManager.showControls = false;
with Obj_CaptchaScreen { lerpToSize = maxSize; }
with Obj_GameManager {
	gameTimer = selectMicrogame.time;
	gameWon = false;
	state = gameState;
	timeline_running = false;
}